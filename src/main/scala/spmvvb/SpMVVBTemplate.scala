package spmvvb

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.{Config, Parameters}
import freechips.rocketchip.diplomacy.LazyModule
import freechips.rocketchip.tile.{BuildRoCC, OpcodeSet, XLen}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.tile._
import template._
import pe._
import me._
import mi._
import controller._

class SpMVVBTemplate (
    local_n_banks: Int,
    v_n_banks: Int,
    n_queues: Int,
    n_pe: Int,
    resp_q_size: Int,
    local_req_q_size: Int,
    v_req_q_size: Int,
    local_bank_size: Int,
    v_bank_size: Int,
    data_size: Int,
    dfe_q_size: Int,
    use_bb: Boolean = false
) extends Module
    with WithNtoMMemInterfaceSeq
    with WithDataflowPE
    with WithNToMDataflowToMem
    with With2DBRAMLikeMEM {
    def get_bank_bits(n_banks: Int) : Int = {
        if(n_banks > 1)
            return log2Ceil(n_banks) 
        else 
            return 0
    }

    val local_mems = if(use_bb) {
      Seq.tabulate[BRAMLikeMem2](local_n_banks)(n =>
        Module(new BRAMLikeMem2(new ElemId(3, n, 0, 0), 36, log2Up(local_bank_size))))
    } else {
      Seq.tabulate[BRAMLikeMem1](local_n_banks)(n =>
        Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), 36, log2Up(local_bank_size))))
    }

    val mems = if(use_bb) {
       Seq(Seq.tabulate[BRAMLikeMem2](v_n_banks)(n =>
        Module(new BRAMLikeMem2(new ElemId(3, n, 0, 0), 36, log2Up(v_bank_size)))), local_mems)
    } else {
       Seq(Seq.tabulate[BRAMLikeMem1](v_n_banks)(n =>
        Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), 36, log2Up(v_bank_size)))), local_mems)     
    }

    val local_mem_interfaces = Seq.tabulate[NtoMMemInterface](local_n_banks)(n =>
      Module(new NtoMMemInterface(
      data_size, // p_width,
      log2Up(local_bank_size), // addr_width,
      1, // n_banks,
      5, // A, col, row, y, test
      local_req_q_size // q_depth
    )))

    // Interface 0 connects VBs, interfaces 1 - n_pe-1 connect to local mems 
    val me_interfaces = Module(
    new NtoMMemInterface(
      data_size, // p_width,
      log2Up(v_bank_size), // addr_width,
      v_n_banks, // n_banks,
      n_pe + 1, // n_queue,
      v_req_q_size // q_depth
    )
  ) +: local_mem_interfaces 

  // !CONNECT INTERFACES
  me_interfaces(0).connectMems(mems(0))
  for(i <- 0 until local_n_banks) {
    me_interfaces(i+1).connectMems(Seq(mems(1)(i)))
  }

  val df_pe = Seq.tabulate[SpMVVBPE](n_pe)(n =>
    Module(
      new SpMVVBPE(
        new ElemId(3, n, 0, 0),
        new CtrlInterfaceIO(),
        data_size, // p_width
        log2Up(local_bank_size), // addr_width
        log2Up(v_bank_size), // x addr width
        data_size, // data_width
        resp_q_size, // rQueueDepth
        local_n_banks, // local_n_banks
        v_n_banks, // vb_n_banks
        n, // bank_id
        dfe_q_size
      )
    )
  )

  for (i <- 0 until df_pe.size) {
    connectDFPEToNtoMMEInterface(
      me_interfaces(0),
      df_pe(i),
      i+1,
      i+1,
      Array(true)
    )
    connectDFPEToNtoMMEInterfaceInterleaved(
      me_interfaces(i+1),
      df_pe(i),
      0, // PE Idx is always zero, is the only PE
      1, // Only one PE connects to each interface
      Array(false, true, true, true),
      1, // start offset (leave room for test channel)
      1  // map_offs: start from the second queue in the PE
    )
  }

  val controller = Module(
    new SpMVVBController(log2Up(local_bank_size)+get_bank_bits(v_n_banks), data_size, local_n_banks)
  )
  controller.mem_io.v_req <> me_interfaces(0).io.inReq(0)
  controller.mem_io.v_resp <> me_interfaces(0).io.outData(0)
  for (i <- 0 until df_pe.size) {
    controller.mem_io.local_req(i) <> me_interfaces(i+1).io.inReq(0)
    controller.mem_io.local_resp(i) <> me_interfaces(i+1).io.outData(0)
  }
  controller.mem_io.busy := me_interfaces.map(_.io.busy).reduce(_ | _)

  // Additional control 
  for (i <- 0 until n_pe) {
    df_pe(i).addr_gen_ctrl_io <> controller.pe_regs(i)
    controller.pe_ctrl(i) <> df_pe(i).io
  }

  // Passthrough ControlledPE control
  val ctrl_io = IO(new RoCCControllerIO(n_pe, 32))
  controller.io <> ctrl_io

}

class SpMVVBTemplateRoCC(
    opcodes: OpcodeSet,
    local_n_banks: Int,
    v_n_banks: Int,
    n_queues: Int,
    n_pe: Int,
    resp_q_size: Int,
    local_req_q_size: Int,
    v_req_q_size: Int,
    local_bank_size: Int,
    v_bank_size: Int,
    data_size: Int,
    dfe_q_size: Int)
  (implicit p: Parameters) extends LazyRoCC(opcodes) {
  override lazy val module = new SpMVVBTemplateImp(this, local_n_banks, v_n_banks, n_queues, n_pe, 
    resp_q_size, local_req_q_size, v_req_q_size, 
    local_bank_size, v_bank_size, data_size, dfe_q_size)
}

class SpMVVBTemplateImp(
  outer: SpMVVBTemplateRoCC,
    local_n_banks: Int,
    v_n_banks: Int,
    n_queues: Int,
    n_pe: Int,
    resp_q_size: Int,
    local_req_q_size: Int,
    v_req_q_size: Int,
    local_bank_size: Int,
    v_bank_size: Int,
    data_size: Int,
    dfe_q_size: Int)
  (implicit p: Parameters) extends LazyRoCCModuleImp(outer)
  with HasCoreParameters {

  val spmv_impl = Module(new SpMVVBTemplate(local_n_banks, v_n_banks, n_queues, n_pe, 
    resp_q_size, local_req_q_size, v_req_q_size, 
    local_bank_size, v_bank_size, data_size, dfe_q_size, true))

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