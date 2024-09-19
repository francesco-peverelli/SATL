package spmvvb

import chisel3._
import chisel3.util._
import controller._
import mi._
import pe._
import spmv._
import dataclass.data

/*
class RoCCInstruction extends Bundle {
  val funct = Bits(width = 7)
  val rs2 = Bits(width = 5)
  val rs1 = Bits(width = 5)
  val xd = Bool()
  val xs1 = Bool()
  val xs2 = Bool()
  val rd = Bits(width = 5)
  val opcode = Bits(width = 7)
}

class RoCCCommand(implicit p: Parameters) extends CoreBundle()(p) {
  val inst = new RoCCInstruction
  val rs1 = Bits(width = xLen)
  val rs2 = Bits(width = xLen)
  val status = new MStatus
}

class RoCCResponse(implicit p: Parameters) extends CoreBundle()(p) {
  val rd = Bits(width = 5)
  val data = Bits(width = xLen)
}

 SPMV INSTRUCTION INTERFACE

 | FUNCT | RS1 | RS2 | XD | XS1 |  XS2 |  RD   | OPCODE  |
 |0     6|7  11|12 16| 17 | 18  |  19  |20  24 |25     31|
WRITE_CONFIG_REG
 |cr_addr| val |  pe  | 1  | 1   |  1   |ack_reg| CUSTOM_0 |
<----- OPTIONAL ----->
WRITE_MEM_[32|64]_2
 |lmem_id| val1| val2| 1  | 1   |  1   |ack_reg| CUSTOM_1 |
<-------------------->
WRITE_MEM_[32|64]_1
 |lmem_id| addr| val | 1  | 1   |  1   |ack_reg| CUSTOM_1 |
READ_MEM_[32|64]_1
 |lmem_id| addr| -   | 1  | 1   |  0   |  res  | CUSTOM_2 |
COMPUTE
 |   -   |  -  | -   | 1  | 0   |  0   |ack_reg| CUSTOM_3 |

---------------------------------------------------------

cr_addr mapping:
    0000000 -> in_A
    0000001 -> in_col
    0000010 -> in_x_addr
    0000011 -> in_row_ptr
    0000100 -> in_nrows
    0000101 -> in_xlen_pow2
    0000110 -> in_y_addr
    0000111 -> in_row_start

lmem_id:
-- SpMV:    0 only
-- SpMVVB:  0       -> x_vb
            1-127   -> local PE mem
*/

class SpMVVBControllerMemIO(data_width: Int, n_pe: Int) extends Bundle {
  val v_req = Decoupled(new MemRequestIO(data_width, data_width))
  val v_resp = Flipped(Decoupled(UInt(data_width.W)))
  val local_req = Vec(n_pe, Decoupled(new MemRequestIO(data_width, data_width)))
  val local_resp = Vec(n_pe, Flipped(Decoupled(UInt(data_width.W))))
  val busy = Input(Bool())
}

class MemSelStageIO(data_width: Int, n_pe: Int) extends  Bundle {
  val mem_req = Vec(n_pe+1, Valid(new MemRequestIO(data_width, data_width)))
  val command_in = Flipped(Valid(new SpMVCommand(data_width)))
  val command_out = Valid(new SpMVCommand(data_width))
}

class MemSelStage(data_width: Int, n_pe: Int) extends Module {
  val io = IO(new MemSelStageIO(data_width, n_pe))

  io.command_in <> io.command_out
  when(io.command_in.bits.inst.opcode === SpMVOpcode.WMEM32_1.id.U && (io.command_in.valid)){
    for(i <- 0 until (n_pe+1)){
      io.mem_req(i).bits.addr := io.command_in.bits.rs1
      io.mem_req(i).bits.dataIn := io.command_in.bits.rs2
      io.mem_req(i).bits.write := true.B
      io.mem_req(i).valid := io.command_in.bits.inst.funct === i.U
    }
  }.elsewhen((io.command_in.bits.inst.opcode === SpMVOpcode.RMEM32_1.id.U) && (io.command_in.valid)){
    for(i <- 0 until (n_pe+1)){
      io.mem_req(i).bits.addr := io.command_in.bits.rs1
      io.mem_req(i).bits.dataIn := io.command_in.bits.rs2
      io.mem_req(i).bits.write := false.B
      io.mem_req(i).valid := io.command_in.bits.inst.funct === i.U
    } 
  }.otherwise{
    for(i <- 0 until (n_pe+1)){
      io.mem_req(i).bits.addr := DontCare
      io.mem_req(i).bits.dataIn := DontCare
      io.mem_req(i).bits.write := false.B
      io.mem_req(i).valid := false.B
    }    
  }
}

class ExeWregStageIO(creg_width : Int, data_width: Int, n_pe: Int) extends Bundle {
  val command_in = Flipped(Valid(new SpMVCommand(data_width)))
  val command_out = Valid(new SpMVCommand(data_width))
  val set_inflight = Output(Bool())
  val pe_regs = Flipped(Vec(n_pe, new SpMVAddrGenPassthroughIO(creg_width, data_width, n_pe)))
}

class ExeWregStage(creg_width : Int, data_width: Int, n_pe: Int) extends Module {
  val io = IO(new ExeWregStageIO(creg_width, data_width, n_pe))
  // Memory holding the current PE configuration values 
  val config_reg = Mem(8*n_pe, UInt(creg_width.W))
  val reset_setup_reg = Reg(Bool())

  io.command_in <> io.command_out
  when((io.command_in.bits.inst.opcode === SpMVOpcode.EXEC.id.U) && (io.command_in.valid)){
    io.set_inflight := true.B
    reset_setup_reg := true.B
  }.elsewhen((io.command_in.bits.inst.opcode === SpMVOpcode.WCREG.id.U) && (io.command_in.valid)){
    io.set_inflight := false.B
    config_reg.write(io.command_in.bits.inst.funct | (io.command_in.bits.rs2 << 3), io.command_in.bits.rs1)
    reset_setup_reg := false.B
  }.otherwise{
    reset_setup_reg := false.B
    io.set_inflight := false.B
  }
  // Send current configuration values to the PEs
  for(i <- 0 until n_pe) {
    io.pe_regs(i).in_A := config_reg.read(0.U | (i << 3).U)
    io.pe_regs(i).in_col_idx := config_reg.read(1.U | (i << 3).U)
    io.pe_regs(i).in_x_addr := config_reg.read(2.U | (i << 3).U)
    io.pe_regs(i).in_row_ptr := config_reg.read(3.U | (i << 3).U)
    io.pe_regs(i).in_nrows := config_reg.read(4.U | (i << 3).U)
    io.pe_regs(i).in_xlen_pow2 := config_reg.read(5.U | (i << 3).U)
    io.pe_regs(i).in_y_addr := config_reg.read(6.U | (i << 3).U)
    io.pe_regs(i).in_row_start := config_reg.read(7.U | (i << 3).U)
  }
  // Hard-wired PE output mapping
  io.pe_regs.map( _.reset_setup := reset_setup_reg )
}

class RespStageIO(data_width: Int, n_pe: Int) extends Bundle {
  val command_in = Flipped(Valid(new SpMVCommand(data_width)))
  val resp_out = Valid(new SpMVResponse(data_width))
  val mem_resp = Vec(n_pe+1, Flipped(Decoupled(UInt(data_width.W))))
  val exe_inflight = Input(Bool())
}

class RespStage(data_width: Int, n_pe: Int) extends Module {
  val io = IO(new RespStageIO(data_width, n_pe))

  val iteration_count = RegInit(0.U(64.W))

  val resp_bits = Seq.tabulate(n_pe+1)(i => io.mem_resp(i).bits)
  //val valid1H = Wire(Bits((n_pe+1).W))
  //for(i <- 0 until (n_pe+1)){
  //  valid1H(i) := io.mem_resp(i).valid
  //}
  // Count exec iterations
  when(RegNext(io.exe_inflight)){
    iteration_count := iteration_count + 1.U
  }.otherwise{
    iteration_count := 1.U
  }

  io.mem_resp.map( _.ready := true.B )
  when(io.mem_resp.map(_.valid).reduce(_ | _) && io.command_in.valid && (io.command_in.bits.inst.opcode === SpMVOpcode.RMEM32_1.id.U)) {
    io.resp_out.bits.resp_data := Mux1H(io.mem_resp.map(_.valid), resp_bits)
    io.resp_out.valid := true.B
  }.elsewhen(io.command_in.valid && (io.command_in.bits.inst.opcode === SpMVOpcode.WCREG.id.U)){
    io.resp_out.bits.resp_data := 4.U
    io.resp_out.valid := true.B
  }.elsewhen(io.command_in.valid && (io.command_in.bits.inst.opcode === SpMVOpcode.WMEM32_1.id.U)){
    io.resp_out.bits.resp_data := 3.U
    io.resp_out.valid := true.B
  }.elsewhen(io.command_in.valid && (io.command_in.bits.inst.opcode === SpMVOpcode.EXEC.id.U)){
    io.resp_out.bits.resp_data := iteration_count
    io.resp_out.valid := true.B
  }.otherwise{
    io.resp_out.bits.resp_data := 0.U
    io.resp_out.valid := false.B
  }
}

class SpMVVBController(creg_width : Int, data_width: Int, n_pe: Int) extends RoCCPEController(n_pe) {
  // IO broadcasting commands to the PE array
  val pe_regs = IO(Flipped(Vec(n_pe, new SpMVAddrGenPassthroughIO(creg_width, data_width, n_pe))))
  val pe_ctrl = IO(Flipped(Vec(n_pe, new CtrlInterfaceIO())))
  // IO reading and writing to local memory
  val mem_io = IO(new SpMVVBControllerMemIO(data_width, n_pe))

  var mem_req = 
    Seq(mem_io.v_req) ++: Seq.tabulate[DecoupledIO[MemRequestIO]](n_pe)(i => mem_io.local_req(i)) 

  var mem_resp: Seq[DecoupledIO[UInt]] = Seq[DecoupledIO[UInt]](mem_io.v_resp) ++: Seq.tabulate[DecoupledIO[UInt]](n_pe)(i => mem_io.local_resp(i))

  // Memory holding the current PE configuration values 
  val config_reg = Mem(8*n_pe, UInt(creg_width.W))

  val cmd_queue = Module(new Queue(new SpMVCommand(data_width), 2))
  val resp_queue = Module(new Queue(new SpMVResponse(data_width), 2))
  val reset_setup_reg = Reg(Bool())
  val exe_inflight_reg = RegInit(false.B)

  // Hard-wired PE output mapping
  pe_ctrl.map( _.ctrl_cmd.bits := DontCare )
  pe_ctrl.map( _.ctrl_cmd.valid := false.B )

  // Forwarded portion of the interface
  val pe_busy = !(pe_ctrl.map( _.idle).reduce(_ & _)) || mem_io.busy
  io.rocc_cmd.busy := pe_busy || exe_inflight_reg
  // No interrupts ever
  io.rocc_cmd.interrupt := false.B

  // Stage 0: RoCCCommand Queue

  // When enqueue is ready, interface is ready, unless exec is in progress
  when(cmd_queue.io.enq.ready && !exe_inflight_reg) {
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
  // Dequeue can be done unless there is an inflight exec instruction or mem not ready
  when(!exe_inflight_reg && mem_req.map(_.ready).reduce(_ & _)){
    cmd_queue.io.deq.ready := true.B
  }.otherwise{
    cmd_queue.io.deq.ready := false.B
  }

  // Stage 1: MemRequest

  val memReqStage = Module(new MemSelStage(data_width, n_pe))

  memReqStage.io.command_in.bits <> cmd_queue.io.deq.bits
  when(cmd_queue.io.deq.ready && cmd_queue.io.deq.valid){
    memReqStage.io.command_in.valid := cmd_queue.io.deq.valid
  }.otherwise{
    memReqStage.io.command_in.valid := false.B
  }

  // 1 -> 2: Out Pipeline regs

  val memReqOutReg = Reg(new SpMVCommand(data_width))
  val memReqOutValid = RegInit(false.B)
  //val memRequestsRegs = Seq.fill(n_pe+1)(Reg(Valid(new MemRequestIO(data_width,data_width))))

  when(memReqStage.io.command_out.valid){
    memReqOutReg := memReqStage.io.command_out.bits
    memReqOutValid := true.B
  }.otherwise{
    memReqOutReg := memReqOutReg
    memReqOutValid := false.B
  }
  for(i <- 0 until (n_pe+1)){
    //memRequestsRegs(i).bits := memReqStage.io.mem_req(i).bits 
    //memRequestsRegs(i).valid := memReqStage.io.mem_req(i).valid
    mem_req(i).bits := memReqStage.io.mem_req(i).bits// memRequestsRegs(i).bits
    mem_req(i).valid := memReqStage.io.mem_req(i).valid//memRequestsRegs(i).valid
  }

  // Stage 2: ExeWregStage

  val exeWCRegStage = Module(new ExeWregStage(creg_width, data_width, n_pe))

  exeWCRegStage.io.command_in.bits <> memReqOutReg
  exeWCRegStage.io.command_in.valid <> memReqOutValid
  exeWCRegStage.io.pe_regs <> pe_regs
  // Drive inflight reg
  when(exeWCRegStage.io.set_inflight){
    exe_inflight_reg := true.B
  }
  // When PEs are no loger busy and we have been inflight at least one cycle,
  // set inflight reg to false and send the valid response
  when(!pe_busy && RegNext(exe_inflight_reg)){
    exe_inflight_reg := false.B
  }

  // 2 -> 3: Out Pipeline Regs

  val exeWCRegOutReg = Reg(new SpMVCommand(data_width))
  val exeWCRegOutValid = RegInit(false.B)

  // With valid command and no inflight, pass command to resp stage
  when(exeWCRegStage.io.command_out.valid && !exe_inflight_reg && (exeWCRegStage.io.command_out.bits.inst.opcode === SpMVOpcode.EXEC.id.U)){
    exeWCRegOutReg := exeWCRegStage.io.command_out.bits
    exeWCRegOutValid := false.B
  // With no inflight and op was EXE, send a valid resp
  }.elsewhen(exeWCRegStage.io.command_out.valid && !exe_inflight_reg){
    exeWCRegOutReg := exeWCRegStage.io.command_out.bits
    exeWCRegOutValid := true.B
  }.elsewhen(!(exe_inflight_reg | exeWCRegStage.io.set_inflight) && 
    (exeWCRegOutReg.inst.opcode === SpMVOpcode.EXEC.id.U) && !exeWCRegOutValid){
    exeWCRegOutValid := true.B
    exeWCRegOutReg := exeWCRegOutReg
  // Valid resp was sent last cycle, set valid to false
  }.elsewhen(!exe_inflight_reg && 
    (exeWCRegOutReg.inst.opcode === SpMVOpcode.EXEC.id.U) && exeWCRegOutValid){
    exeWCRegOutValid := false.B
    exeWCRegOutReg.inst.opcode := 0.U // Set opcode to stop sending valid resp
  }.elsewhen(exe_inflight_reg && 
    (exeWCRegOutReg.inst.opcode === SpMVOpcode.EXEC.id.U)){
    exeWCRegOutValid := false.B // exeWCRegOutValid
    exeWCRegOutReg := exeWCRegOutReg    
  }.otherwise{
    exeWCRegOutValid := false.B
    exeWCRegOutReg := DontCare    
  }

  // Stage 3: Response Stage

  val respStage = Module(new RespStage(data_width, n_pe))

  respStage.io.command_in.bits <> exeWCRegOutReg
  respStage.io.command_in.valid := exeWCRegOutValid
  respStage.io.exe_inflight := exe_inflight_reg
  for(i <- 0 until (n_pe+1)){
      respStage.io.mem_resp(i) <> mem_resp(i)
  }

  resp_queue.io.enq.bits <> respStage.io.resp_out.bits
  resp_queue.io.enq.valid := respStage.io.resp_out.valid

  io.rocc_cmd.resp_data := resp_queue.io.deq.bits.resp_data
  io.rocc_cmd.resp_valid := resp_queue.io.deq.valid
  resp_queue.io.deq.ready := io.rocc_cmd.resp_rdy 

}
