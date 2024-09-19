package YoseUe_SATL
import chisel3._
import chisel3.util._
import chisel3.experimental._
import spatial_templates._

class ForwardConverter(n_attr: Int, n_classes: Int, n_depths: Int, info_bit: Int, tree_bit: Int, rounded_info_bit: Int, rounded_tree_bit: Int, compensation: Int)  
    extends PE(new ElemId(0,0,0,0)) with WithFWConnection {
    val io = IO(new Bundle{
        val sample_in = new AxiSample(n_attr,n_classes,n_depths,rounded_info_bit,rounded_tree_bit,compensation)
        val sample_out = Decoupled(new Sample(n_attr,n_classes,n_depths,info_bit,tree_bit))
    })
    
    for(i <- 0 until n_attr){
        io.sample_out.bits.features(i) := io.sample_in.TDATA((i+1)*32-1,i*32).asFixedPoint(16.BP)
    }
    io.sample_out.bits.offset := io.sample_in.TDATA(n_attr*32+15,n_attr*32)
    io.sample_out.bits.shift := io.sample_in.TDATA(n_attr*32+23,n_attr*32+16)
    io.sample_out.bits.search_for_root := io.sample_in.TDATA(n_attr*32+31,n_attr*32+24)
    io.sample_out.bits.tree_to_exec := io.sample_in.TDATA(n_attr*32+39,n_attr*32+32)
    for(i <- 0 until n_classes){
        io.sample_out.bits.scores(i) := io.sample_in.TDATA(n_attr*32+48+(i+1)*32-1,n_attr*32+48+i*32).asFixedPoint(8.BP)
    }
    for(i <- 0 until n_depths){
        io.sample_out.bits.weights(i) := io.sample_in.TDATA(n_attr*32+48+n_classes*32+(i+1)*32-1,n_attr*32+48+n_classes*32+i*32).asFixedPoint(8.BP)
    }
    io.sample_out.valid := io.sample_in.TVALID
    io.sample_out.bits.dest := false.B
    io.sample_out.bits.last := io.sample_in.TLAST
    io.sample_out.bits.clock_cycles := 0.U
    io.sample_in.TREADY := io.sample_out.ready

    def linkToDest(fic: FirstInterconnectPE){ 
        io.sample_out <> fic.io.sample_entering
    }
}

class BackwardConverter(n_attr: Int, n_classes: Int, n_depths: Int, info_bit: Int, tree_bit: Int, rounded_info_bit: Int, rounded_tree_bit: Int, compensation: Int) 
    extends  PE(new ElemId(0,0,0,0)) with WithFWConnection {
    val io = IO(new Bundle{
        val sample_in = Flipped(Decoupled(new Sample(n_attr,n_classes,n_depths,info_bit,tree_bit)))
        val sample_out = Flipped(new AxiSample(n_attr,n_classes,n_depths,rounded_info_bit,rounded_tree_bit,compensation))
    })

    val queue = Queue(io.sample_in, 128)
    
    queue.ready := io.sample_out.TREADY

    //io.sample_out.TKEEP := 0xFFFFFFF.U //(scala.math.pow(2,((((n_attr+n_depths+n_classes)*16+24+rounded_info_bit+rounded_tree_bit+compensation)/8).toInt))-1).toInt.U
    io.sample_out.TLAST := queue.bits.last
    io.sample_out.TVALID := queue.valid
    //io.sample_out.TSTRB := 0xFFFFFFF.U

    /*io.sample_out.bits.TDATA := Cat(Cat(queue.bits.weights.reverse),Cat(queue.bits.scores.reverse),Cat(Fill(rounded_info_bit-tree_bit,0.U),queue.bits.tree_to_exec), 
                                        Cat(Fill(7,0.U),queue.bits.search_for_root), Cat(Fill(7,0.U),queue.bits.shift), 
                                        Cat(Fill(rounded_info_bit-info_bit,0.U),queue.bits.offset), Cat(queue.bits.features.reverse))*/
    
    io.sample_out.TDATA := Cat(Cat(queue.bits.clock_cycles),Cat(queue.bits.scores.reverse),Cat(Fill(rounded_info_bit-tree_bit,0.U),queue.bits.tree_to_exec),
                                    Cat(Fill(7,0.U),queue.bits.search_for_root), Cat(Fill(7,0.U),queue.bits.shift),
                                    Cat(Fill(rounded_info_bit-info_bit,0.U),queue.bits.offset), Cat(queue.bits.features.reverse))
    
    def linkToDest(lic: LastInterconnectPE){
        io.sample_in.bits.features := lic.io.sample_leaving.bits.features
        io.sample_in.bits.weights := lic.io.sample_leaving.bits.weights
        io.sample_in.bits.tree_to_exec := lic.io.sample_leaving.bits.tree_to_exec
        io.sample_in.bits.shift := lic.io.sample_leaving.bits.shift
        io.sample_in.bits.offset := lic.io.sample_leaving.bits.offset
        io.sample_in.bits.scores := lic.io.sample_leaving.bits.scores
        io.sample_in.bits.search_for_root := lic.io.sample_leaving.bits.search_for_root
        io.sample_in.bits.dest := lic.io.sample_leaving.bits.dest
        io.sample_in.bits.last := lic.io.sample_leaving.bits.last
        io.sample_in.valid := lic.io.sample_leaving.valid
        lic.io.sample_leaving.ready := io.sample_in.ready
    }
    
    def addCyclesCounter(cc: UInt){
        io.sample_in.bits.clock_cycles := cc
    }

}