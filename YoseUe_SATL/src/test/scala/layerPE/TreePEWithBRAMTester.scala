package YoseUe_SATL

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import scala.math._

/*

class TreePEWithBRAMTester extends AnyFreeSpec with ChiselScalatestTester {

  val n_attr = 4
  val n_classes = 4
  val n_depths = 5
  val info_bit = 10
  val tree_bit = 8
  val attr_bit = (log(n_attr)/log(2)-0.00001).toInt + 1
  val flbit = true

  "Pe should update samples" in {
    test(new TreePEwithBRAM(new ElemId(3,1,1,1),n_attr,n_classes,n_depths,info_bit,tree_bit,attr_bit,flbit,1)) { c =>
        
        c.pe_io.sample_in.valid.poke(true)
        c.pe_io.sample_in.bits.offset.poke(1.U)
        c.pe_io.sample_in.bits.shift.poke(false.B)
        c.pe_io.sample_in.bits.search_for_root.poke(true.B)
        c.pe_io.sample_in.bits.tree_to_exec.poke(1.U)
        for (i <- 0 until n_classes){
          if(i==1){
            c.pe_io.sample_in.bits.scores(i).poke(3.U)
          }else{
            c.pe_io.sample_in.bits.scores(i).poke(0.U)
          }
        }
        for (i <- 0 until n_depths){
          c.pe_io.sample_in.bits.weights(i).poke((i+1).U)
        }
        for (i <- 0 until n_attr){
          c.pe_io.sample_in.bits.features(i).poke(2.U)
        }

        c.bram_io.write_2.poke(true.B)
        c.bram_io.addr_2.poke(0.U)
        c.bram_io.dataIn_2.poke(BigInt("0", 10).U(64.W))

        c.pe_io.sample_out.ready.poke(true)
        
        c.clock.step(1)
        
        println("SAMPLE_OUT: ")
        println("FEATURES: ")
        for (i <- 0 until n_attr){
          println(c.pe_io.sample_out.bits.features(i).peek().litValue)
        }
        println("SCORES: ")
        for (i <- 0 until n_classes){
          println(c.pe_io.sample_out.bits.scores(i).peek().litValue)
        }
        println("WEIGHTS: ")
        for (i <- 0 until n_depths){
          println(c.pe_io.sample_out.bits.weights(i).peek().litValue)
        }
        println("SHIFT, OFFSET, TREE_TO_EXEC, SFR")
        println(c.pe_io.sample_out.bits.shift.peek().litValue)
        println(c.pe_io.sample_out.bits.offset.peek().litValue)
        println(c.pe_io.sample_out.bits.tree_to_exec.peek().litValue)
        println(c.pe_io.sample_out.bits.search_for_root.peek().litValue)
        
        //c.io.sample_out.bits.scores(2).expect(0)
        //c.pe_io.sample_out.bits.offset.expect(0)
        //c.pe_io.sample_out.bits.shift.expect(false)
    }
  }
}
*/