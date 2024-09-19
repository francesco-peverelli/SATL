package spmv

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.{Config, Parameters}
import freechips.rocketchip.diplomacy.LazyModule
import freechips.rocketchip.tile.{BuildRoCC, OpcodeSet, XLen}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.tile._
import template._
import controller._
import me._
import mi._
import pe._

class SpMVTemplate(    
    n_banks: Int,
    n_queues: Int,
    n_pe: Int,
    resp_q_size: Int,
    req_q_size: Int,
    bank_size: Int,
    data_size: Int,
    dfe_q_size: Int,
    use_bb: Boolean = false
) extends Module
    with WithNtoMMemInterface
    with WithDataflowPE
    with WithNToMDataflowToMem
    with WithBRAMLikeMEM {
    def get_bank_bits(n_banks: Int) : Int = {
        if(n_banks > 1)
            return log2Ceil(n_banks) 
        else 
            return 0
    }

  val mem =  if(use_bb){
    Seq.tabulate[BRAMLikeMem2](n_banks)(n =>
      Module(new BRAMLikeMem2(new ElemId(3, n, 0, 0), 36, log2Up(bank_size)))
    )
  } else {
    Seq.tabulate[BRAMLikeMem1](n_banks)(n =>
      Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), 36, log2Up(bank_size)))
    )
  }
  val me_interface = Module(
    new NtoMMemInterface(
      data_size, // p_width,
      log2Up(bank_size), // addr_width,
      n_banks, // n_banks,
      n_queues * n_pe + 1, // n_queue,
      req_q_size // q_depth
    )
  )

  me_interface.connectMems(mem)

  val df_pe = Seq.tabulate[SpMVPE](n_pe)(n =>
    Module(
      new SpMVPE(
        new ElemId(3, n, 0, 0),
        new CtrlInterfaceIO(),
        data_size, // p_width
        log2Up(bank_size), // addr_width
        data_size, // data_width
        resp_q_size, // rQueueDepth
        n_banks, // n_banks
        n, // bank_id
        dfe_q_size
      )
    )
  )

  for (i <- 0 until df_pe.size) {
    connectDFPEToNtoMMEInterfaceInterleaved(
      me_interface,
      df_pe(i),
      i,
      df_pe.size,
      Array(false, true, true, true, true),
      1
    )
  }

  val controller = Module(
    new SpMVController(log2Up(bank_size)+get_bank_bits(n_banks), data_size, n_banks)
  )

  // TODO: internalize this logic
  controller.mem_io.request <> me_interface.io.inReq(0)
  controller.mem_io.response <> me_interface.io.outData(0)
  controller.mem_io.busy := me_interface.io.busy

  for (i <- 0 until n_pe) {
    df_pe(i).addr_gen_ctrl_io <> controller.pe_regs(i)
    controller.pe_ctrl(i) <> df_pe(i).io
  }

  val ctrl_io = IO(new RoCCControllerIO(n_pe, 32))
  controller.io <> ctrl_io
}

class SpMVTemplateRoCC(
    opcodes: OpcodeSet,
    n_banks: Int,
    n_queues: Int,
    n_pe: Int,
    resp_q_size: Int,
    req_q_size: Int,
    bank_size: Int,
    data_size: Int,
    dfe_q_size: Int)
  (implicit p: Parameters) extends LazyRoCC(opcodes) {
  override lazy val module = new SpMVTemplateImp(this, n_banks, n_queues, n_pe, resp_q_size, req_q_size, 
    bank_size, data_size, dfe_q_size)
}

class SpMVTemplateImp(
  outer: SpMVTemplateRoCC,
  n_banks: Int,
  n_queues: Int,
  n_pe: Int,
  resp_q_size: Int,
  req_q_size: Int,
  bank_size: Int,
  data_size: Int,
  dfe_q_size: Int)
  (implicit p: Parameters) extends LazyRoCCModuleImp(outer)
  with HasCoreParameters {
  
  val spmv_impl = Module(new SpMVTemplate(n_banks, n_queues, n_pe, resp_q_size, req_q_size, 
    bank_size, data_size, dfe_q_size, true))

    val resp_rd = Reg(chiselTypeOf(io.resp.bits.rd))
    // RoCC Command interface IO
    io.cmd.ready := spmv_impl.ctrl_io.rocc_cmd.cmd_rdy
    spmv_impl.ctrl_io.rocc_cmd.cmd_valid := io.cmd.valid
    spmv_impl.ctrl_io.rocc_cmd.cmd_inst := io.cmd.bits.inst
    spmv_impl.ctrl_io.rocc_cmd.cmd_rs1 := io.cmd.bits.rs1
    spmv_impl.ctrl_io.rocc_cmd.cmd_rs2 := io.cmd.bits.rs2
    // Check if this gives the right response
    when(io.cmd.ready && io.cmd.valid) {
      resp_rd := io.cmd.bits.inst.rd
    }
    // RoCC Response interface IO
    io.resp.bits.rd := resp_rd
    io.resp.bits.data := spmv_impl.ctrl_io.rocc_cmd.resp_data
    io.resp.valid := spmv_impl.ctrl_io.rocc_cmd.resp_valid
    spmv_impl.ctrl_io.rocc_cmd.resp_rdy := io.resp.ready
    io.busy := spmv_impl.ctrl_io.rocc_cmd.busy
    io.interrupt := spmv_impl.ctrl_io.rocc_cmd.interrupt
    // We ignore the mem interface...
  }