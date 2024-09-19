package YoseUe_SATL

import chisel3._
import chisel3.util._
import chisel3.experimental._
import spatial_templates._

class IncrementTreePE(id: ElemId, n_attr: Int, n_classes: Int, n_depths: Int, info_bit: Int, tree_bit: Int) 
    extends PE(id) with WithFWConnection {
    val io = IO(new Bundle{
        val sample_in = Flipped(Decoupled(new Sample(n_attr,n_classes,n_depths,info_bit,tree_bit)))
        val sample_out = Decoupled(new Sample(n_attr,n_classes,n_depths,info_bit,tree_bit))
    })

    val queue = Queue(io.sample_in, 3)

    io.sample_out.bits.features := queue.bits.features
    io.sample_out.bits.weights := queue.bits.weights
    io.sample_out.bits.tree_to_exec := queue.bits.tree_to_exec + 1.U
    io.sample_out.bits.shift := queue.bits.shift
    io.sample_out.bits.offset := queue.bits.tree_to_exec + 1.U
    io.sample_out.bits.scores := queue.bits.scores
    io.sample_out.bits.search_for_root := queue.bits.search_for_root
    io.sample_out.bits.dest := queue.bits.dest
    io.sample_out.bits.last := queue.bits.last
    io.sample_out.bits.clock_cycles := queue.bits.clock_cycles

    io.sample_out.valid := queue.valid

    queue.ready := io.sample_out.ready

    def linkToDest(ic: FirstInterconnectPE) {
        io.sample_out <> ic.io.sample_looping
    }


    
}
