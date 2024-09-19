package template

import chisel3._
import chisel3.util._
import me._
import mi._
import pe._

trait WithNtoMMemInterface {
  val me_interface: NtoMMemInterface
}

trait WithNtoMMemInterfaceSeq {
  val me_interfaces: Seq[NtoMMemInterface]
}

trait WithDataflowPE {
  val df_pe: Seq[DataflowPE]
}

trait WithBRAMLikeMEM {
  val mem: Seq[BRAMLikeMem]
}

trait With2DBRAMLikeMEM {
  val mems: Seq[Seq[BRAMLikeMem]]
}

trait WithNToMDataflowToMem {
  def connectDFPEToNtoMMEInterface(me_interface: NtoMMemInterface, pe: DataflowPE, 
    i_queue_start: Int, i_queue_end: Int, rw_map: Array[Boolean]) {

    for (i <- i_queue_start until (i_queue_end + 1)) {
      if(rw_map(i - i_queue_start)) {
        var rq_idx = 0
        for(j <- 0 until (i - i_queue_start)) {
          if(rw_map(j)){
            rq_idx+=1
          }
        }
        pe.df_io.memQueuesIO.inReadData(i - i_queue_start).valid := me_interface.io.outData(i).valid 
        pe.df_io.memQueuesIO.inReadData(i - i_queue_start).bits := me_interface.io.outData(i).bits 
        me_interface.io.outData(i).ready := pe.df_io.memQueuesIO.readQueuesEnqReady(rq_idx)
        me_interface.io.inReq(i).valid := pe.df_io.memQueuesIO.outgoingReq(i - i_queue_start).valid
      } else {
        me_interface.io.inReq(i).valid := pe.df_io.memQueuesIO.outgoingReq(i - i_queue_start).valid
        me_interface.io.outData(i).ready := true.B
      }
      // Connect write queues
      me_interface.io.inReq(i).bits <> pe.df_io.memQueuesIO.outgoingReq(i - i_queue_start).bits
      pe.df_io.memQueuesIO.outgoingReq(i - i_queue_start).ready := me_interface.io.inReq(i).ready
      //me_interface.io.inReq(i).valid := pe.df_io.memQueuesIO.outgoingReq(i - i_queue_start).valid
    }   
  }
  def connectDFPEToNtoMMEInterfaceInterleaved(me_interface: NtoMMemInterface, pe: DataflowPE, 
    pe_idx: Int, n_pe: Int, rw_map: Array[Boolean], start_offset: Int, map_offs: Int = 0) {

    var rq_idx = 0
    for(i <- 0 until rw_map.size) {
      if(rw_map(i)) {
        pe.df_io.memQueuesIO.inReadData(map_offs+rq_idx).valid := me_interface.io.outData(i*n_pe + pe_idx + start_offset).valid 
        pe.df_io.memQueuesIO.inReadData(map_offs+rq_idx).bits := me_interface.io.outData(i*n_pe + pe_idx + start_offset).bits 
        me_interface.io.outData(i*n_pe + pe_idx + start_offset).ready := pe.df_io.memQueuesIO.readQueuesEnqReady(map_offs+rq_idx)
        me_interface.io.inReq(i*n_pe + pe_idx + start_offset).valid := pe.df_io.memQueuesIO.outgoingReq(map_offs+i).valid
        rq_idx+=1
      } else {
        me_interface.io.inReq(i*n_pe + pe_idx + start_offset).valid := pe.df_io.memQueuesIO.outgoingReq(map_offs+i).valid
        me_interface.io.outData(i*n_pe + pe_idx + start_offset).ready := true.B
      }
      me_interface.io.inReq(i*n_pe + pe_idx + start_offset).bits <> pe.df_io.memQueuesIO.outgoingReq(map_offs+i).bits
      pe.df_io.memQueuesIO.outgoingReq(map_offs+i).ready := me_interface.io.inReq(i*n_pe + pe_idx + start_offset).ready
    }  
  }
}

trait WithNToMDataflowToDMA {
  // TODO: define connections to DMA for DataflowPE
}
