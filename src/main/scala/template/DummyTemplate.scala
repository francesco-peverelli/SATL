package template

import chisel3._
import chisel3.util._
import freechips.rocketchip.tile._
import freechips.rocketchip.config.{Config, Parameters}
import freechips.rocketchip.diplomacy.LazyModule
import freechips.rocketchip.tile.{BuildRoCC, OpcodeSet, XLen}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.rocket.MStatus

class DummyTemplate(opcodes: OpcodeSet) 
    (implicit p: Parameters) extends LazyRoCC(opcodes) {
    override lazy val module = new DummyTemplateModule(this)
}

class FModuleIO extends Bundle {
  val cmd_rdy = Output(Bool())
  val cmd_valid = Input(Bool())
  val cmd_inst = Input(new RoCCInstruction())
  val cmd_rs1 = Input(Bits(64.W))
  val cmd_rs2 = Input(Bits(64.W))
  val cmd_status = Input(new MStatus)
  val resp_data = Output(Bits(64.W))
  val resp_rdy = Input(Bool())
  val resp_valid = Output(Bool())
  val busy = Output(Bool())
  val interrupt = Output(Bool())
  val mem_valid = Output(Bool())
}

class DummyTemplateFunctionalModule() extends Module {
 
    val io = IO(new FModuleIO())

    // This is a stub
    // Expected functionality:
    //     add 1 to rs1 and write it to the output register
    val funct = io.cmd_inst.funct
    // only custom0 is a valid opcode
    val valid_op = funct === 0.U 
    // Destination register for the sum
    val resp_reg = RegInit(0.U(64.W))
    
    val s_idle :: s_res_rdy :: Nil = Enum(2)
    val state = RegInit(s_idle)
    val valid = io.resp_valid && io.resp_rdy
    val do_sum = io.cmd_rdy && io.cmd_valid && valid_op

    io.cmd_rdy := (state === s_idle)
    // do functional logic
    when(do_sum) {
        resp_reg := io.cmd_rs1 + 1.U
        io.resp_data := io.cmd_rs1 + 1.U
        state := s_res_rdy
    }.elsewhen(valid){
        state := s_idle
        io.resp_data := resp_reg
    }
    io.resp_valid := RegNext(do_sum)
    io.resp_data := resp_reg
    io.busy := !io.cmd_rdy
    io.interrupt := false.B
    io.mem_valid := false.B
}

class DummyTemplateModule(outer: DummyTemplate)(implicit p: Parameters) extends LazyRoCCModuleImp(outer)
    with HasCoreParameters {

  val resp_rd = Reg(chiselTypeOf(io.resp.bits.rd))
  val fmodule = Module(new DummyTemplateFunctionalModule())
  io.cmd.ready := fmodule.io.cmd_rdy  
  fmodule.io.cmd_valid := io.cmd.valid 
  fmodule.io.cmd_inst := io.cmd.bits.inst
  fmodule.io.cmd_rs1 := io.cmd.bits.rs1 
  fmodule.io.cmd_rs2 := io.cmd.bits.rs2 
  fmodule.io.cmd_status := io.cmd.bits.status 
  when(io.cmd.ready && io.cmd.valid) {
      resp_rd := io.cmd.bits.inst.rd
  }
  io.resp.bits.rd := resp_rd
  io.resp.bits.data := fmodule.io.resp_data
  io.resp.valid := fmodule.io.resp_valid 
  fmodule.io.resp_rdy := io.resp.ready
  io.busy := fmodule.io.busy 
  io.interrupt := fmodule.io.interrupt
  io.mem.req.valid := fmodule.io.mem_valid 

}