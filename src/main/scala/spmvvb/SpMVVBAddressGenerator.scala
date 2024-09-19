package spmvvb

import chisel3._
import chisel3.util._
import addrgen._
import pe._
import me._
import mi._
import dfe._

/**
  * 
  *
  * @param local_addr_width
  * @param vb_addr_width
  * @param data_width
  * @param local_n_banks
  * @param vb_n_banks
  */
class SpMVVBAddrGenPassthroughIO(local_addr_width: Int, vb_addr_width : Int, data_width : Int, 
    local_n_banks: Int, vb_n_banks: Int) extends AddressGeneratorPassthroughIO {
    def get_bank_bits(n_banks: Int) : Int = {
        if(n_banks > 1)
            return log2Ceil(n_banks) 
        else 
            return 0
    }
    val in_A = Input(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val in_col_idx = Input(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val in_row_ptr = Input(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val in_x_addr = Input(UInt((vb_addr_width+get_bank_bits(vb_n_banks)).W))
    val in_y_addr = Input(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val in_nrows = Input(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val in_row_start = Input(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    // |X| approximated to the next power of 2
    val in_xlen_pow2 = Input(UInt((vb_addr_width+get_bank_bits(vb_n_banks)+1).W))
    val reset_setup = Input(Bool())
}

class SpMVVBAddrGenCtrl(data_width : Int) extends Bundle {

    val a_vals = Decoupled(UInt(data_width.W))
    val x_vals = Decoupled(UInt(data_width.W))
    val y_vals = Flipped(Decoupled(UInt(data_width.W)))
    // Control signals to DFE
    val row_elem_left = Decoupled(UInt(data_width.W))
}


class SpMVVBAddressGenerator(local_addr_width: Int, vb_addr_width : Int, data_width : Int, 
    local_n_banks: Int, vb_n_banks: Int, bank: Int) 
    extends QueueAddressGenerator(4, 1, local_addr_width, data_width, local_n_banks, bank)
    with AddrGenWithPassthrough
    with AddrGenWithDFE 
    with AddrGenWithME {
    def get_bank_bits(n_banks: Int) : Int = {
        if(n_banks > 1)
            return log2Ceil(n_banks) 
        else 
            return 0
    }
    val ctrl_io = IO(new SpMVVBAddrGenCtrl(data_width))
    val pe_ctrl_io = IO(new SpMVVBAddrGenPassthroughIO(local_addr_width, vb_addr_width, data_width, local_n_banks, vb_n_banks))

    // Status registers encoding the current problem dimensions
    val base_A = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val base_col_idx = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val base_row_ptr = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val base_x_ptr = Reg(UInt((vb_addr_width+get_bank_bits(vb_n_banks)).W))
    val base_y_ptr = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val nrows = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val log_xchunk = Reg(UInt((vb_addr_width+get_bank_bits(vb_addr_width)).W))
    val xlen_pow2 = Reg(UInt((vb_addr_width+get_bank_bits(vb_n_banks)).W))
    // Current non-zero in the A matrix to process
    val curr_a_nz = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val curr_col_nz = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val row_elem_left_a = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val row_elem_left_col = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val row_start = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val curr_row = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))
    val curr_y = Reg(UInt((local_addr_width+get_bank_bits(local_n_banks)).W))

    val request_3_enable = RegInit(Bool(), true.B)

    val not_last_row = (curr_row =/= nrows)
    val update_row = (row_elem_left_a === 0.U) && (row_elem_left_col === 0.U)

    when(mem_io.dataResponses(0).valid && mem_io.dataResponses(1).valid && ctrl_io.a_vals.ready && ctrl_io.x_vals.ready) {
        // Forward data responses on 0 as output
        mem_io.dataResponses(0).ready := true.B
        mem_io.dataResponses(1).ready := true.B 
        ctrl_io.a_vals.bits := mem_io.dataResponses(0).bits
        ctrl_io.a_vals.valid := true.B
        ctrl_io.x_vals.bits := mem_io.dataResponses(1).bits
        ctrl_io.x_vals.valid := true.B 
    }.otherwise{
        mem_io.dataResponses(0).ready := false.B 
        mem_io.dataResponses(1).ready := false.B
        ctrl_io.a_vals.bits := DontCare
        ctrl_io.a_vals.valid := false.B         
        ctrl_io.x_vals.bits := DontCare
        ctrl_io.x_vals.valid := false.B 
    }
    
    when(mem_io.writeRequests(0).ready && ctrl_io.y_vals.valid) {
        // Forward write requests to memory for outputs
        ctrl_io.y_vals.ready := true.B
        mem_io.writeRequests(0).bits.data := ctrl_io.y_vals.bits
        mem_io.writeRequests(0).bits.address := base_y_ptr + curr_y
        mem_io.writeRequests(0).valid := true.B 
    }.otherwise{
        ctrl_io.y_vals.ready := false.B
        mem_io.writeRequests(0).bits.data := DontCare
        mem_io.writeRequests(0).bits.address := DontCare
        mem_io.writeRequests(0).valid := false.B 
    }

    // Update the setup registers
    when(pe_ctrl_io.reset_setup) {
        // Data buffer base addresses
        base_A := pe_ctrl_io.in_A
        base_col_idx := pe_ctrl_io.in_col_idx
        base_row_ptr := pe_ctrl_io.in_row_ptr
        base_x_ptr := pe_ctrl_io.in_x_addr
        base_y_ptr := pe_ctrl_io.in_y_addr
        // Position of LSB is the log2 of the x chunk
        log_xchunk := PriorityEncoder(pe_ctrl_io.in_xlen_pow2 >> get_bank_bits(vb_n_banks))
        xlen_pow2 := pe_ctrl_io.in_xlen_pow2 >> get_bank_bits(vb_n_banks) 
        // Total number of rows of A
        nrows := pe_ctrl_io.in_nrows
        // Non-zero processed
        curr_a_nz := 0.U
        curr_col_nz := 0.U
        // Row elements left to process
        row_elem_left_col := 0.U
        row_elem_left_a := 0.U
        // Displacement of current row in NZ buffer
        row_start := pe_ctrl_io.in_row_start 
        // Index of the current row in the row_ptr buffer
        curr_row := 0.U
        curr_y := 0.U
        request_3_enable := true.B
    }

    when(!((curr_row === nrows) && update_row)){
        mem_io.generatingRequests := true.B
    }.otherwise{
        mem_io.generatingRequests := false.B
    }

    // Forward the data responses of col_idx to the requests on X
    val x_idx = mem_io.dataResponses(2).bits 
    // Bank bits: i / chunk_size shifted to the msb of the address
    val x_bank_mask = ((x_idx >> log_xchunk) << vb_addr_width)(vb_addr_width+get_bank_bits(vb_n_banks)+1,0)
    when(mem_io.dataResponses(2).valid && mem_io.dataResponses(2).ready && mem_io.addressRequests(0).ready) {
        // Offset: i & (not bank bits)
        val x_offset = (x_idx & ((xlen_pow2) - 1.U))(vb_addr_width+get_bank_bits(vb_n_banks)+1,0)
        mem_io.addressRequests(0).bits := x_offset(vb_addr_width+get_bank_bits(vb_n_banks)+1,0) | x_bank_mask(vb_addr_width+get_bank_bits(vb_n_banks)+1,0)
        mem_io.addressRequests(0).valid := true.B
    }.otherwise{
        mem_io.addressRequests(0).bits := DontCare
        mem_io.addressRequests(0).valid := false.B       
    }
                                            
    when(/*(!update_row || !not_last_row) */mem_io.addressRequests(0).ready) {
        mem_io.dataResponses(2).ready := true.B
    }.otherwise{
        mem_io.dataResponses(2).ready := false.B
    }

    when(update_row && not_last_row){
        // Is ready to receive if next cycle we need to change the value of the counter
        mem_io.dataResponses(3).ready := true.B
    }.otherwise{
        mem_io.dataResponses(3).ready := false.B
    }

    when(update_row && not_last_row && request_3_enable && ctrl_io.row_elem_left.ready) {
        // If we don't have a row_ptr ready and a next row exists, request a row ptr
        mem_io.addressRequests(3).valid := true.B
        mem_io.addressRequests(3).bits := base_row_ptr + curr_row + 1.U 
    }.otherwise{
        mem_io.addressRequests(3).bits := DontCare
        mem_io.addressRequests(3).valid := false.B
    }

    //When request fires, disable further requests
    when(mem_io.addressRequests(3).ready && mem_io.addressRequests(3).valid) {
        request_3_enable := false.B
    }

    when(mem_io.dataResponses(3).ready && mem_io.dataResponses(3).valid) {
        ctrl_io.row_elem_left.valid := true.B
        ctrl_io.row_elem_left.bits := mem_io.dataResponses(3).bits - row_start
    }.otherwise{
        ctrl_io.row_elem_left.valid := false.B
        ctrl_io.row_elem_left.bits := DontCare       
    }
    
    // When the response fires, set needs_row to true and update row structures
    when(mem_io.dataResponses(3).ready && mem_io.dataResponses(3).valid) {
        val next_row_val = mem_io.dataResponses(3).bits(local_addr_width+get_bank_bits(local_n_banks)+1,0)
        curr_row := curr_row + 1.U
        row_elem_left_a := next_row_val - row_start //previous value of row_start
        row_elem_left_col := next_row_val - row_start
        row_start := next_row_val
        request_3_enable := true.B
    }

    when(row_elem_left_a > 0.U && mem_io.addressRequests(1).ready) {
        // Request a new A element if there are elements left in the row
        mem_io.addressRequests(1).bits := base_A + curr_a_nz 
        mem_io.addressRequests(1).valid := true.B 
    }.otherwise{
        mem_io.addressRequests(1).bits := DontCare
        mem_io.addressRequests(1).valid := false.B         
    }

    // When an A request is enqueued, update the indexes
    when(mem_io.addressRequests(1).ready && mem_io.addressRequests(1).valid) {
        curr_a_nz := curr_a_nz + 1.U
    }

    // When a valid response on A fires, update the current element in the row
    when(mem_io.addressRequests(1).ready && mem_io.addressRequests(1).valid && row_elem_left_a > 0.U) {
        row_elem_left_a := row_elem_left_a - 1.U
    }
    
    when(row_elem_left_col > 0.U && mem_io.addressRequests(2).ready) {
        // Request a new col_idx element if there are elements left in the row
        mem_io.addressRequests(2).bits := base_col_idx + curr_col_nz
        mem_io.addressRequests(2).valid := true.B
    }.otherwise{
        mem_io.addressRequests(2).bits := DontCare
        mem_io.addressRequests(2).valid := false.B       
    }

    // When an col_idx request is enqueued, update the indexes
    when(mem_io.addressRequests(2).ready && mem_io.addressRequests(2).valid) {
        curr_col_nz := curr_col_nz + 1.U
    }

    // When a valid response on col fires, update the current element in the row
    when(mem_io.addressRequests(2).ready && mem_io.addressRequests(2).valid && row_elem_left_col > 0.U) {
        row_elem_left_col := row_elem_left_col - 1.U
    }

    //When a valid write request is issued, update the next y address
    when(mem_io.writeRequests(0).ready && mem_io.writeRequests(0).valid) {
        curr_y := curr_y + 1.U
    }
}

trait WithSpMVVBAddrGen extends DataflowPE 
    with WithAddrGenToMem
    //with WithPassthroughDFE
    with WithPassthroughAddrGen
    with WithAddrGenToDFE {
    val pe_addr_gen: SpMVVBAddressGenerator
    val pe_dfe: FloatMultAccEngine
    /**
      * Handles interconnecting this component to the DataflowPE outer interface.
      * In this generator, we assume 4 read-write queues, mapped to 
      * addressRequests[0-3], and 1 write only queue mapped to writeRequests(0)
      *
      * @param outer_pe
      */
    override def connectToMEInterface() {
        
        connectToOutgoingRequest(0, // queue index
            false.B, //write=false (this interface is reading)
            pe_addr_gen.mem_io.addressRequests(0).bits, // address to read
            0.U, // dataIn is set to 0 since we are reading
            pe_addr_gen.mem_io.addressRequests(0).ready, 
            pe_addr_gen.mem_io.addressRequests(0).valid
        )
        // Connect data read queues to data responses interfaces in this generator
        connectToReadQueue(0, pe_addr_gen.mem_io.dataResponses(0).bits, pe_addr_gen.mem_io.dataResponses(0).valid, pe_addr_gen.mem_io.dataResponses(0).ready)
        // Connect the output queue as a write-only queue
        connectToOutgoingRequest(1, 
            true.B, 
            pe_addr_gen.mem_io.writeRequests(0).bits.address,
            pe_addr_gen.mem_io.writeRequests(0).bits.data, 
            pe_addr_gen.mem_io.writeRequests(0).ready, 
            pe_addr_gen.mem_io.writeRequests(0).valid
        )
        for(i <- 2 until 5) {
            connectToOutgoingRequest(i, // queue index
                false.B, //write=false (this interface is reading)
                pe_addr_gen.mem_io.addressRequests(i-1).bits, // address to read
                0.U, // dataIn is set to 0 since we are reading
                pe_addr_gen.mem_io.addressRequests(i-1).ready, 
                pe_addr_gen.mem_io.addressRequests(i-1).valid
            )
            // Connect data read queues to data responses interfaces in this generator
            connectToReadQueue(i-1, pe_addr_gen.mem_io.dataResponses(i-1).bits, pe_addr_gen.mem_io.dataResponses(i-1).valid, pe_addr_gen.mem_io.dataResponses(i-1).ready)
        }
    }

    override def connectAddrGenToDFE() {
    /** In this generator the interfaces are mapped as: addressRequests(0):
      * A_req, row_ptr_req addressRequests(1): col_idx_req addressRequests(2):
      * x_req addressRequests(3): row_pos_req writeRequests(0): y writes
      */
    // TODO: ctrl interface should be separate from data

    val inQueue_0 = Module(new Queue(chiselTypeOf(pe_addr_gen.ctrl_io.x_vals.bits), 2))
    val inQueue_1 = Module(new Queue(chiselTypeOf(pe_addr_gen.ctrl_io.a_vals.bits), 2))
    val outQueue = Module(new Queue(chiselTypeOf(pe_addr_gen.ctrl_io.y_vals.bits), 2))
    
    // Connect x values to the first input
    pe_dfe.io.inData(0).bits.bits := inQueue_0.io.deq.bits
    pe_dfe.io.inData(0).valid := inQueue_0.io.deq.valid
    inQueue_0.io.deq.ready := pe_dfe.io.inData(0).ready

    inQueue_0.io.enq.bits := pe_addr_gen.ctrl_io.x_vals.bits
    inQueue_0.io.enq.valid := pe_addr_gen.ctrl_io.x_vals.valid
    pe_addr_gen.ctrl_io.x_vals.ready := inQueue_0.io.enq.ready

    // Connect A values to the second input
    pe_dfe.io.inData(1).bits.bits := inQueue_1.io.deq.bits
    pe_dfe.io.inData(1).valid := inQueue_1.io.deq.valid
    inQueue_1.io.deq.ready := pe_dfe.io.inData(1).ready

    inQueue_1.io.enq.bits := pe_addr_gen.ctrl_io.a_vals.bits
    inQueue_1.io.enq.valid := pe_addr_gen.ctrl_io.a_vals.valid
    pe_addr_gen.ctrl_io.a_vals.ready := inQueue_1.io.enq.ready

    // Connect y values to the output
    outQueue.io.enq.bits := pe_dfe.io.outData(0).bits.bits
    outQueue.io.enq.valid := pe_dfe.io.outData(0).valid
    pe_dfe.io.outData(0).ready := outQueue.io.enq.ready

    pe_addr_gen.ctrl_io.y_vals.bits := outQueue.io.deq.bits
    pe_addr_gen.ctrl_io.y_vals.valid := outQueue.io.deq.valid
    outQueue.io.deq.ready := pe_addr_gen.ctrl_io.y_vals.ready

    //Connect control singals
    pe_dfe.ctrl_io.resetCounter.bits := pe_addr_gen.ctrl_io.row_elem_left.bits
    pe_dfe.ctrl_io.resetCounter.valid := pe_addr_gen.ctrl_io.row_elem_left.valid
    pe_addr_gen.ctrl_io.row_elem_left.ready := pe_dfe.ctrl_io.resetCounter.ready

    }
}