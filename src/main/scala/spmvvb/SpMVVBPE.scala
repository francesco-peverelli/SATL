package spmvvb

import chisel3._
import chisel3.util._
import pe._
import dfe._
import addrgen._
import spmv._

class SpMVVBPE(
    id: ElemId,
    io_bundle: CtrlInterfaceIO,
    p_width : Int,
    local_addr_width: Int,
    vb_addr_width: Int,
    data_width: Int,
    rQueueDepth: Int,
    local_n_banks: Int,
    vb_n_banks: Int,
    bank_id: Int,
    dfe_queue_size : Int
) extends DataflowPE (
    id, io_bundle, p_width, local_addr_width + log2Up(local_n_banks), 5, 4, rQueueDepth
) with WithSpMVVBAddrGen {
  val pe_addr_gen = Module(new SpMVVBAddressGenerator(local_addr_width, vb_addr_width, data_width, local_n_banks, vb_n_banks, bank_id))
  val addr_gen_ctrl_io = IO(new SpMVVBAddrGenPassthroughIO(local_addr_width, vb_addr_width, data_width, local_n_banks, vb_n_banks))
  val pe_dfe = Module(new FloatMultAccEngine(dfe_queue_size, data_width))

  connectAddrGenToDFE()
  connectToMEInterface()
  connectAddrGenPassthrough()

  // PE general control signals to the outside world
  io.ctrl_cmd.ready := true.B 
  io.idle := !pe_addr_gen.mem_io.generatingRequests && pe_dfe.ctrl_io.idle
}
