package spmvdma

import chisel3._
import chisel3.util._
import spmv._
import addrgen._
import dma._
import pe._

/**
  * 
  *
  * @param local_addr_width
  * @param vb_addr_width
  * @param data_width
  * @param local_n_banks
  * @param vb_n_banks
  */
class SpMVVBDMAAddrGenPassthroughIO(addr_width: Int, vb_addr_width : Int, data_width : Int, vb_n_banks: Int) extends AddressGeneratorPassthroughIO {
    def get_bank_bits(n_banks: Int) : Int = {
        if(n_banks > 1)
            return log2Ceil(n_banks) 
        else 
            return 0
    }
    val in_A = Input(UInt(addr_width.W))
    val in_col_idx = Input(UInt(addr_width.W))
    val in_row_ptr = Input(UInt(addr_width.W))
    val in_y_addr = Input(UInt(addr_width.W))
    val in_nrows = Input(UInt(addr_width.W))
    val in_nnz = Input(UInt(addr_width.W))
    // |X| approximated to the next power of 2
    val in_xlen_pow2 = Input(UInt((vb_addr_width+get_bank_bits(vb_n_banks)+1).W))
    val reset_setup = Input(Bool())
}

class SpMVVBDMAAddrGenCtrl(data_width : Int) extends Bundle {

    val a_vals = Decoupled(UInt(data_width.W))
    val x_vals = Decoupled(UInt(data_width.W))
    val y_vals = Flipped(Decoupled(UInt(data_width.W)))
    // Control signals to DFE (number to accumulate in current row)
    val row_elem_left = Decoupled(UInt(data_width.W))
}

class TLAGetRequestIO(addrBits: Int, dataBits: Int, inflight: Int, numPorts: Int) extends AddressGeneratorDMAReadIO {
    val tla_get = Vec(numPorts, Decoupled(new TLAGetReq(addrBits, addrBits, dataBits, inflight)))
    val tla_data = Vec(numPorts, Flipped(Decoupled(UInt(dataBits.W))))
}

class TLAPutRequestIO(addrBits: Int, dataBits: Int, inflight: Int, numPorts: Int) extends AddressGeneratorDMAWriteIO {
    val tla_put = Vec(numPorts, Decoupled(new TLAPutReq(addrBits, addrBits, dataBits, inflight)))
}


class SpMVVBDMAAddressGenerator(addr_width: Int, vb_addr_width : Int, data_width : Int, vb_n_banks: Int, bank: Int) 
    extends QueueAddressGenerator(1, 0, vb_addr_width, data_width, vb_n_banks, bank)
    with AddrGenWithPassthrough
    with AddrGenWithDFE 
    with AddrGenWithME 
    with AddrGetWithDMARead
    with AddrGetWithDMAWrite {
    def get_bank_bits(n_banks: Int) : Int = {
        if(n_banks > 1)
            return log2Ceil(n_banks) 
        else 
            return 0
    }
    val ctrl_io = IO(new SpMVVBDMAAddrGenCtrl(data_width))
    val pe_ctrl_io = IO(new SpMVVBDMAAddrGenPassthroughIO(addr_width, vb_addr_width, data_width, vb_n_banks))

    val dma_get_req_io = IO(new TLAGetRequestIO(addr_width, data_width, 64, 3))
    val dma_put_req_io = IO(new TLAPutRequestIO(addr_width, data_width, 64, 1))

    // Status registers encoding the current problem dimensions
    val base_A = Reg(UInt((addr_width).W))
    val base_col_idx = Reg(UInt((addr_width).W))
    val base_row_ptr = Reg(UInt((addr_width).W))
    val base_y_ptr = Reg(UInt((addr_width).W))

    val nrows = Reg(UInt((addr_width).W))
    val nnz = Reg(UInt((addr_width).W))

    val log_xchunk = Reg(UInt((vb_addr_width+get_bank_bits(vb_addr_width)).W))
    val xlen_pow2 = Reg(UInt((vb_addr_width+get_bank_bits(vb_n_banks)).W))

    // Buffered DMA requests submodules
    val a_buffer_unit = Module(new TLAGetBufferUnit(addr_width, data_width, 64, 32))
    val col_buffer_unit = Module(new TLAGetBufferUnit(addr_width, data_width, 64, 32))
    val row_buffer_unit = Module(new TLAGetBufferUnit(addr_width, data_width, 64, 16))

    val row_delta_holder = Module(new HoldDelta(addr_width))
    
    val deref_x = Module(new PartitionedRequestAdapter(data_width, vb_addr_width, vb_n_banks))

    val forward_y = Module(new TLAPutForwarder(data_width, addr_width, 64))

    a_buffer_unit.ctrl.reset := RegNext(pe_ctrl_io.reset_setup)
    col_buffer_unit.ctrl.reset := RegNext(pe_ctrl_io.reset_setup)
    row_buffer_unit.ctrl.reset := RegNext(pe_ctrl_io.reset_setup)
    forward_y.resetCount := RegNext(pe_ctrl_io.reset_setup)

    // Update the setup registers
    when(pe_ctrl_io.reset_setup) {
        // Data buffer base addresses
        base_A := pe_ctrl_io.in_A
        base_col_idx := pe_ctrl_io.in_col_idx
        base_row_ptr := pe_ctrl_io.in_row_ptr
        base_y_ptr := pe_ctrl_io.in_y_addr
        // Position of LSB is the log2 of the x chunk
        log_xchunk := PriorityEncoder(pe_ctrl_io.in_xlen_pow2 >> get_bank_bits(vb_n_banks))
        xlen_pow2 := pe_ctrl_io.in_xlen_pow2 >> get_bank_bits(vb_n_banks) 
        // Total number of rows of A
        nrows := pe_ctrl_io.in_nrows
        // Total number of NZ of A
        nnz := pe_ctrl_io.in_nnz 
    }

    dma_put_req_io.tla_put(0) <> forward_y.outReq
    forward_y.inData <> ctrl_io.y_vals
    forward_y.inToWrite := nrows
    forward_y.inBaseAddr := base_y_ptr

    val nnz_bytes = nnz << log2Up(data_width/8).U
    a_buffer_unit.ctrl.baseAddr := base_A
    a_buffer_unit.ctrl.dataToRead := nnz_bytes
    col_buffer_unit.ctrl.baseAddr := base_col_idx
    col_buffer_unit.ctrl.dataToRead := nnz_bytes

    row_buffer_unit.ctrl.baseAddr := base_row_ptr
    row_buffer_unit.ctrl.dataToRead := (nrows << log2Up(data_width/8).U)

    ctrl_io.a_vals <> a_buffer_unit.outData
    a_buffer_unit.inData <> dma_get_req_io.tla_data(0)
    a_buffer_unit.outReq <> dma_get_req_io.tla_get(0)

    col_buffer_unit.inData <> dma_get_req_io.tla_data(1)
    col_buffer_unit.outReq <> dma_get_req_io.tla_get(1)

    col_buffer_unit.outData <> deref_x.inAddress
    deref_x.lgBankSize := log_xchunk
    deref_x.bankBits := xlen_pow2

    deref_x.outReq <> mem_io.addressRequests(0)
    deref_x.dataIn <> mem_io.dataResponses(0)
    deref_x.dataOut <> ctrl_io.x_vals

    row_delta_holder.dataIn <> row_buffer_unit.outData
    row_buffer_unit.inData <> dma_get_req_io.tla_data(2)
    row_buffer_unit.outReq <> dma_get_req_io.tla_get(2)
    dma_get_req_io.tla_data(2) <> row_delta_holder.dataIn
    row_delta_holder.dataOut <> ctrl_io.row_elem_left

    mem_io.generatingRequests := false.B
}

class HoldDelta(dataWidth: Int) extends Module {
    val dataIn = IO(Flipped(Decoupled(UInt(dataWidth.W))))
    val dataOut = IO(Decoupled(UInt(dataWidth.W)))

    val holdReg = RegInit(0.U.asTypeOf(UInt(dataWidth.W)))
    val holdDelta = RegInit(0.U.asTypeOf(UInt(dataWidth.W)))
    val holdValid = RegInit(false.B)

    dataIn.ready := !holdValid || dataOut.ready
    when(dataIn.ready && dataIn.valid){
        holdReg := dataIn.bits
        holdDelta := dataIn.bits - holdReg
        holdValid := true.B
    }
    dataOut.valid := holdValid
    dataOut.bits := holdDelta

    when(dataOut.ready && dataOut.valid && !dataIn.valid){
        holdValid := false.B
    }
}

class PartitionedRequestAdapter(dataWidth: Int, local_addr_width: Int, local_n_banks: Int) extends Module {
    def get_bank_bits(n_banks: Int) : Int = {
        if(n_banks > 1)
            return log2Ceil(n_banks) 
        else 
            return 0
    }
    // Forward the data responses of col_idx to the requests on X
    val inAddress = IO(Flipped(Decoupled(UInt(dataWidth.W))))
    val lgBankSize = IO(Input(UInt((local_addr_width+get_bank_bits(local_n_banks)).W)))
    val bankBits = IO(Input(UInt((local_addr_width+get_bank_bits(local_n_banks)+1).W)))

    val outReq = IO(Decoupled(UInt((local_addr_width+get_bank_bits(local_n_banks)).W)))
    val dataIn = IO(Flipped(Decoupled(UInt(dataWidth.W))))
    val dataOut = IO(Decoupled(UInt(dataWidth.W)))
    // Bank bits: i / chunk_size shifted to the msb of the address
    val bank_mask = ((inAddress.bits >> lgBankSize) << local_addr_width)(local_addr_width+get_bank_bits(local_n_banks)+1,0)
    val idx_offset = (inAddress.bits & ((bankBits) - 1.U))(local_addr_width+get_bank_bits(local_n_banks)+1,0)
    val outAddress = idx_offset(local_addr_width+get_bank_bits(local_n_banks)+1,0) | bank_mask(local_addr_width+get_bank_bits(local_n_banks)+1,0)
          
    outReq.bits := outAddress
    outReq.valid := inAddress.valid

    inAddress.ready := outReq.ready
    dataIn <> dataOut
}

trait WithSpMVDMAAddrGen extends DataflowPE {
    // TODO: trait to define 
    // 1. DMAAddrGen
    // 2. connectToMEInterface + connectToDMA
    // 3. connectAddrGenToDFE
}
