package dma

import chisel3._
import chisel3.util._
import spatialtemplates._
import mi._
import pe._
import me._
import controller._
import template._
import spmv._
import freechips.rocketchip.config.{Config, Parameters}
import freechips.rocketchip.diplomacy.LazyModule
import freechips.rocketchip.tile.{BuildRoCC, OpcodeSet, XLen}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.tile._
import freechips.rocketchip.subsystem.{BaseSubsystem, CacheBlockBytes}
import freechips.rocketchip.config.{Parameters, Field, Config}
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, IdRange}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.tilelink.{TLIdentityNode, TLXbar}

object DMAOpcode extends Enumeration {
  val RREQ = Value(11)
  val RMEM32_1 = Value(43)
  val WREQ = Value(91)
}

class DMACommand(xLen: Int = 64) extends Bundle {
  val inst = new controller.RoCCInstruction()
  val rs1 = Bits(xLen.W)
  val rs2 = Bits(xLen.W)
}
class DMAResponse(xLen: Int = 64) extends Bundle {
  val resp_data = Bits(xLen.W)
}

class DMAControllerMemIO(addr_width: Int, p_width: Int) extends Bundle {
    val request = Decoupled(new MemRequestIO(p_width, addr_width))
    val response = Flipped(Decoupled(UInt(p_width.W)))
    val busy = Input(Bool())
}

class DMATestController(addr_width: Int, local_addr_width : Int, data_width: Int, local_data_width: Int, inflight: Int) extends RoCCPEController(1) {
  // IO reading from local memory
  val mem_io = IO(new DMAControllerMemIO(local_addr_width, data_width))
  // DMA IO
  val dma_req_io = IO(Decoupled(new TLAGetReq(addr_width, addr_width, data_width, inflight)))
  // write request to MI reader
  val writeRequest = IO(Decoupled(new MIReaderRequestIO(local_addr_width, addr_width)))

  val cmd_queue = Module(new Queue(new DMACommand(data_width), 2, flow=true))
  val resp_queue = Module(new Queue(new DMAResponse(data_width), 2, flow=true))  

  val last_opcode = RegInit(0.U(13.W))
  // Hold response for 1 cycle in case of non-memory operation
  val resp_reg = Reg(UInt(data_width.W))
  // Hold if there was a valid operation last cycle
  val resp_no_mem_valid = Reg(Bool()) 

  io.rocc_cmd.busy := !cmd_queue.io.enq.ready
  // No interrupts ever
  io.rocc_cmd.interrupt := false.B

  // When enqueue is ready, interface is ready, unless exec is in progress
  when(cmd_queue.io.enq.ready) {
    io.rocc_cmd.cmd_rdy := true.B
  }.otherwise{
    io.rocc_cmd.cmd_rdy := false.B
  } 

  // Command enqueue fire condition
  when(io.rocc_cmd.cmd_rdy && io.rocc_cmd.cmd_valid) {
    io.rocc_cmd.cmd_inst <> cmd_queue.io.enq.bits.inst 
    cmd_queue.io.enq.bits.rs1 <> io.rocc_cmd.cmd_rs1
    cmd_queue.io.enq.bits.rs2 <> io.rocc_cmd.cmd_rs2
    cmd_queue.io.enq.valid := true.B
  }.otherwise{
    cmd_queue.io.enq.bits := DontCare
    cmd_queue.io.enq.valid := false.B
  }  
  when((io.rocc_cmd.cmd_inst.opcode === DMAOpcode.RMEM32_1.id.U && mem_io.request.ready) || 
        (io.rocc_cmd.cmd_inst.opcode === DMAOpcode.RREQ.id.U && dma_req_io.ready) ||
        (io.rocc_cmd.cmd_inst.opcode === DMAOpcode.WREQ.id.U && writeRequest.ready)){
    cmd_queue.io.deq.ready := true.B
  }.otherwise{
    cmd_queue.io.deq.ready := false.B
  }
  val cmd_fire = cmd_queue.io.deq.ready && cmd_queue.io.deq.valid

  when(cmd_fire && io.rocc_cmd.cmd_inst.opcode === DMAOpcode.RMEM32_1.id.U){
    mem_io.request.bits.write := false.B
    mem_io.request.bits.addr := cmd_queue.io.deq.bits.rs1
    mem_io.request.bits.dataIn := 0.U
    mem_io.request.valid := true.B

    dma_req_io.valid := false.B
    dma_req_io.bits.baseScAddress := DontCare
    dma_req_io.bits.fromSource := DontCare
    // First register is address to read from in DRAM
    dma_req_io.bits.toAddress := DontCare
    // Second register is base 2 of bytes to read
    dma_req_io.bits.lgSize := DontCare
    // Write request
    writeRequest.valid := false.B
    writeRequest.bits := DontCare
    // Ack response is sent next cycle by memory
    resp_reg := 10.U
    resp_no_mem_valid := false.B
    last_opcode := SpMVOpcode.RMEM32_1.id.U
  }.elsewhen(cmd_fire && io.rocc_cmd.cmd_inst.opcode === DMAOpcode.RREQ.id.U){
    mem_io.request.bits.write := false.B
    mem_io.request.bits.addr := DontCare
    mem_io.request.bits.dataIn := DontCare
    mem_io.request.valid := false.B
    //Send read from DRAM request to DMA
    dma_req_io.valid := true.B
    // Second register (HIGH) is base address in scratchpad
    dma_req_io.bits.baseScAddress := io.rocc_cmd.cmd_rs2(31,16)
    dma_req_io.bits.fromSource := 0.U
    // First register is address to read from in DRAM
    dma_req_io.bits.toAddress := io.rocc_cmd.cmd_rs1
    // Second register (LOW) is bytes to read
    dma_req_io.bits.lgSize := io.rocc_cmd.cmd_rs2(15,0)
    // Write request
    writeRequest.valid := false.B
    writeRequest.bits := DontCare
    // Pipe ack response
    resp_reg := 11.U
    resp_no_mem_valid := true.B
    last_opcode := DMAOpcode.RREQ.id.U
  }.elsewhen(cmd_fire && io.rocc_cmd.cmd_inst.opcode === DMAOpcode.WREQ.id.U){
    mem_io.request.bits.write := false.B
    mem_io.request.bits.addr := DontCare
    mem_io.request.bits.dataIn := DontCare
    mem_io.request.valid := false.B

    dma_req_io.valid := false.B
    dma_req_io.bits.baseScAddress := DontCare
    dma_req_io.bits.fromSource := DontCare
    // First register is address to read from in DRAM
    dma_req_io.bits.toAddress := DontCare
    // Second register is base 2 of bytes to read
    dma_req_io.bits.lgSize := DontCare
    // Write request
    writeRequest.valid := true.B
    // Second register (HIGH) is base address in scratchpad
    writeRequest.bits.scBaseAddr := io.rocc_cmd.cmd_rs2(31,16)
    // First register is address to write to in DRAM
    writeRequest.bits.toAddress := io.rocc_cmd.cmd_rs1
    // Second register (LOW) is bytes to write
    writeRequest.bits.scNumData := io.rocc_cmd.cmd_rs2(15,0)
    // Pipe ack response
    resp_reg := 12.U
    resp_no_mem_valid := true.B
    last_opcode := DMAOpcode.WREQ.id.U
  }.otherwise{
    mem_io.request.bits.write := false.B
    mem_io.request.bits.addr := DontCare
    mem_io.request.bits.dataIn := DontCare
    mem_io.request.valid := false.B
    // No valid instruction this cycle
    dma_req_io.valid := false.B
    dma_req_io.bits.baseScAddress := DontCare
    dma_req_io.bits.fromSource := DontCare
    // First register is address to read from in DRAM
    dma_req_io.bits.toAddress := DontCare
    // Second register is base 2 of bytes to read
    dma_req_io.bits.lgSize := DontCare
    // Write request
    writeRequest.valid := false.B
    writeRequest.bits := DontCare
    // Pipe ack response
    resp_reg := 2.U  
    resp_no_mem_valid := false.B
    last_opcode := last_opcode  
  }

  val resp_val = Wire(UInt(data_width.W))
  when(mem_io.response.valid && mem_io.response.ready) {
    resp_val := mem_io.response.bits
  }.otherwise{
    resp_val := resp_reg
  }
  mem_io.response.ready := true.B

  // Enqueue response
  when((resp_no_mem_valid || (mem_io.response.valid && mem_io.response.ready)) && resp_queue.io.enq.ready) {
    resp_queue.io.enq.bits.resp_data := resp_val
    resp_queue.io.enq.valid := true.B
  }.otherwise{
    resp_queue.io.enq.bits.resp_data := DontCare
    resp_queue.io.enq.valid := false.B
  }

  // Connect dequeue response
  io.rocc_cmd.resp_data := resp_queue.io.deq.bits.resp_data
  io.rocc_cmd.resp_valid := resp_queue.io.deq.valid
  resp_queue.io.deq.ready := io.rocc_cmd.resp_rdy  
}

class TLBundlesIO(addrBits: Int, dataWidth: Int, inflight: Int) extends Bundle {
    // Input TL request
    val io_tlAReq = Decoupled(new TLAGetReq(addrBits, 32, dataWidth, inflight))
    // Output TL response
    val inReq = Flipped(Decoupled(new MemRequestIO(32, 12)))
    val outData = Decoupled(UInt(32.W))
    // Output TLA request
    val tlaPutReq = Decoupled(new TLAPutReq(addrBits, 32, dataWidth, inflight))
}

class DMADeviceTemplate(
  val dataWidth: Int,
  val addrBits: Int,
  val localAddrWidth: Int,
  val localPortWidth: Int,
  inflight: Int
)(implicit p: Parameters) extends Module 
    with WithNtoMMemInterface
    with WithBRAMLikeMEM {

    val tl_io = IO(new TLBundlesIO(addrBits, dataWidth, inflight))
    val mem = Seq.tabulate[BRAMLikeMem1](1)(n =>
      Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), localPortWidth, localAddrWidth)))

    val me_interface = Module(
      new NtoMMemInterface(
        localPortWidth, // p_width,
        log2Up(4096), // addr_width,
        1, // n_banks,
        3, // n_queue,
        32 // q_depth
      )
    )

    me_interface.connectMems(mem)
    
    val controller = Module(new DMATestController(addrBits, localAddrWidth, dataWidth, 32, inflight))

    controller.mem_io.request <> me_interface.io.inReq(0)
    controller.mem_io.response <> me_interface.io.outData(0)
    controller.mem_io.busy := me_interface.io.busy

    controller.dma_req_io <> tl_io.io_tlAReq

    val ctrl_io = IO(new RoCCControllerIO(1, 32))
    controller.io <> ctrl_io

    me_interface.io.inReq(0) <> controller.mem_io.request
    me_interface.io.outData(0) <> controller.mem_io.response 
    
    me_interface.io.inReq(2) <> tl_io.inReq
    me_interface.io.outData(2) <> tl_io.outData

    val miReader = Module(new MIReader(localPortWidth, localAddrWidth, addrBits, localAddrWidth, dataWidth, inflight))

    me_interface.io.inReq(1) <> miReader.io.inReq
    miReader.io.outData.bits := me_interface.io.outData(1).bits
    miReader.io.outData.valid := me_interface.io.outData(1).valid
    me_interface.io.outData(1).ready := miReader.io.outData.ready

    controller.writeRequest <> miReader.io.writeRequest
    miReader.io.tlaPutReq <> tl_io.tlaPutReq

}

class DMADeviceTemplateRoCC(
    opcodes: OpcodeSet)
  (implicit p: Parameters) extends LazyRoCC(opcodes) {

  val dataWidth = 64 //chiselTypeOf(mem.a.bits.data).getWidth
  val addrBits = 32 //edge.bundle.addressBits
  val localAddrWidth = 12
  val localPortWidth = 32
  val inflight = 64
  
  val streamReader = LazyModule(new StreamReader(dataWidth, localPortWidth, localAddrWidth, inflight))
  val streamWriter = LazyModule(new StreamWriter(dataWidth, localPortWidth, localAddrWidth, inflight))
  override val atlNode = TLIdentityNode()
  atlNode := streamReader.atlNode
  atlNode := streamWriter.atlNode

  override lazy val module = new LazyRoCCModuleImp(this) with HasCoreParameters {

    val dmatmpl_impl = Module(new DMADeviceTemplate(dataWidth, addrBits, localAddrWidth, localPortWidth, inflight))

    assert(streamWriter.module.io.tlAPutReq.bits.giovanni.getWidth == 64)
    dmatmpl_impl.tl_io.inReq <> streamReader.module.io.inReq
    dmatmpl_impl.tl_io.outData <> streamReader.module.io.outData
    dmatmpl_impl.tl_io.io_tlAReq <> streamReader.module.io.tlAReq
    dmatmpl_impl.tl_io.tlaPutReq <> streamWriter.module.io.tlAPutReq

    val resp_rd = Reg(chiselTypeOf(io.resp.bits.rd))
    // RoCC Command interface IO
    io.cmd.ready := dmatmpl_impl.ctrl_io.rocc_cmd.cmd_rdy
    dmatmpl_impl.ctrl_io.rocc_cmd.cmd_valid := io.cmd.valid
    dmatmpl_impl.ctrl_io.rocc_cmd.cmd_inst := io.cmd.bits.inst
    dmatmpl_impl.ctrl_io.rocc_cmd.cmd_rs1 := io.cmd.bits.rs1
    dmatmpl_impl.ctrl_io.rocc_cmd.cmd_rs2 := io.cmd.bits.rs2
    // Check if this gives the right response
    when(io.cmd.ready && io.cmd.valid) {
      resp_rd := io.cmd.bits.inst.rd
    }
    // RoCC Response interface IO
    io.resp.bits.rd := resp_rd
    io.resp.bits.data := dmatmpl_impl.ctrl_io.rocc_cmd.resp_data
    io.resp.valid := dmatmpl_impl.ctrl_io.rocc_cmd.resp_valid
    dmatmpl_impl.ctrl_io.rocc_cmd.resp_rdy := io.resp.ready
    io.busy := dmatmpl_impl.ctrl_io.rocc_cmd.busy
    io.interrupt := dmatmpl_impl.ctrl_io.rocc_cmd.interrupt

  }

}
