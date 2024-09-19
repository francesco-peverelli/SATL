package YoseUe_SATL

import chisel3._
import chisel3.util._
import chisel3.experimental._
import spatial_templates._

/** This abstract class represents a Processing Element for a generic spatial
  * template
  */

class TreePE(id: ElemId, n_attr: Int, n_classes: Int, n_depths: Int, info_bit: Int, tree_bit: Int, attr_bit: Int, is_a_root: Boolean, n_loops: Int) 
  extends PE(id) with WithFWConnection {
    val io = IO(new Bundle{
        val sample_in = Flipped(Decoupled(new Sample(n_attr,n_classes,n_depths,info_bit,tree_bit)))
        val mem = Flipped(new BRAMLikeIO(64,13))
        val sample_out = Decoupled(new Sample(n_attr,n_classes,n_depths,info_bit,tree_bit))
    })

    val queue = Queue(io.sample_in, 3)

    io.mem.enable_1 := true.B
    io.mem.addr_1 := queue.bits.offset
    io.mem.write_1 := false.B
    io.mem.dataIn_1 := 0.U
   
    io.mem.enable_2 := DontCare
    io.mem.addr_2 := DontCare
    io.mem.write_2 := DontCare
    io.mem.dataIn_2 := DontCare

    //Decode Node instruction
    
    when(RegNext(queue.valid)){

      val attr_id = io.mem.dataOut_1(32+attr_bit-1,32)
      val threshold = io.mem.dataOut_1(15,0)
      val nodeRA = io.mem.dataOut_1(31,16)
      val leftChildInfo = io.mem.dataOut_1(32+attr_bit+info_bit-1,32+attr_bit)
      val rightChildInfo = io.mem.dataOut_1(32+attr_bit+info_bit*2-1,32+attr_bit+info_bit)
      val leftChildType = io.mem.dataOut_1(32+attr_bit+info_bit*2)
      val rightChildType = io.mem.dataOut_1(32+attr_bit+info_bit*2+1)
      val is_valid = io.mem.dataOut_1(32+attr_bit+info_bit*2+2)
      val depth_indicator = io.mem.dataOut_1(32+attr_bit+info_bit*2+5,32+attr_bit+info_bit*2+3) //depth indicator assumed to be 3 bits. If the number of weights changes, it is needed to change the end bit
      
      io.sample_out.bits.features := RegNext(queue.bits.features)
      io.sample_out.bits.weights := RegNext(queue.bits.weights)
      io.sample_out.bits.tree_to_exec := RegNext(queue.bits.tree_to_exec)
      io.sample_out.bits.scores := RegNext(queue.bits.scores)
      io.sample_out.valid := true.B
      io.sample_out.bits.clock_cycles := RegNext(queue.bits.clock_cycles)

      if (is_a_root){
        val offset = Wire(UInt(info_bit.W)) 
        val shift = Wire(Bool())
        val features_bits = RegNext(queue.bits.features)
        val scores_bits = RegNext(queue.bits.scores)
        val weights_bits = RegNext(queue.bits.weights)
        shift := Mux(features_bits(attr_id) < threshold.asFixedPoint(8.BP),leftChildType,rightChildType)
        offset := Mux(features_bits(attr_id) < threshold.asFixedPoint(8.BP),leftChildInfo,rightChildInfo)
        io.sample_out.bits.offset := Mux(shift === false.B,RegNext(queue.bits.tree_to_exec),offset)
        io.sample_out.bits.shift := false.B
        io.sample_out.bits.search_for_root := !shift
        for(i <- 0 until n_classes){
          io.sample_out.bits.scores(i) := scores_bits(i) + (Mux(((shift===false.B) & is_valid & (i.U === offset)),weights_bits(depth_indicator).asUInt(),0.U(32.W))).asFixedPoint(16.BP)
        }
        io.sample_out.bits.dest := RegNext(queue.bits.tree_to_exec) === (n_loops-1).U
        io.sample_out.bits.last := RegNext(queue.bits.last)
      }else{
        val offset = Wire(UInt(info_bit.W)) 
        val shift = Wire(Bool())
        val features_bits = RegNext(queue.bits.features)
        val scores_bits = RegNext(queue.bits.scores)
        val weights_bits = RegNext(queue.bits.weights)
        shift := Mux(features_bits(attr_id) < threshold.asFixedPoint(8.BP),leftChildType,rightChildType)
        offset := Mux(features_bits(attr_id) < threshold.asFixedPoint(8.BP),leftChildInfo,rightChildInfo)
        io.sample_out.bits.offset := Mux(shift === false.B || RegNext(queue.bits.search_for_root),RegNext(queue.bits.tree_to_exec),offset)
        io.sample_out.bits.shift := false.B
        io.sample_out.bits.search_for_root := !shift || RegNext(queue.bits.search_for_root)
        for(i <- 0 until n_classes){
          io.sample_out.bits.scores(i) := scores_bits(i) + (Mux(((shift===false.B) & is_valid & (i.U === offset)),weights_bits(depth_indicator).asUInt(),0.U(32.W))).asFixedPoint(16.BP)
        }
        io.sample_out.bits.dest := RegNext(queue.bits.tree_to_exec) === (n_loops-1).U
        io.sample_out.bits.last := RegNext(queue.bits.last)
      }
    }.otherwise{
      io.sample_out.bits := DontCare
      io.sample_out.valid := false.B
    }
    
    queue.ready := io.sample_out.ready

}

class TreePEwithBRAM(id: ElemId, n_attr: Int, n_classes: Int, n_depths: Int, info_bit: Int, tree_bit: Int, attr_bit: Int, is_a_root: Boolean, n_loops: Int) 
  extends PE(id) with WithFWConnection {
  val pe_io = IO(new Bundle{
        val sample_in = Flipped(Decoupled(new Sample(n_attr,n_classes,n_depths,info_bit,tree_bit)))
        val mem = Flipped(new BRAMLikeIO(64,13))
        val sample_out = Decoupled(new Sample(n_attr,n_classes,n_depths,info_bit,tree_bit))
  })
  
  val pe = Module(new TreePE(id,n_attr,n_classes,n_depths,info_bit,tree_bit,attr_bit,is_a_root, n_loops))

  pe_io <> pe.io

  def linkToDest(ic: LastInterconnectPE) {
    pe_io.sample_out <> ic.io.sample_in
  }

  def linkToDest(tree_pe: TreePEwithBRAM) {
    pe_io.sample_out <> tree_pe.pe_io.sample_in
  }
}