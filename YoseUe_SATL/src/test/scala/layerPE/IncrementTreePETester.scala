package YoseUe_SATL

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import scala.math._

/*

class IncrementTreePETester extends AnyFreeSpec with ChiselScalatestTester {

  val n_attr = 4
  val n_classes = 4
  val n_depths = 5
  val info_bit = 10
  val tree_bit = 8

  "Pe should increment tree to exec and offset to the old value of tree_to_exec plus one" in {
    test(new IncrementTreePE(new ElemId(3,1,1,1),n_attr,n_classes,n_depths,info_bit,tree_bit)) { c =>
        
        for (i <- 0 until 10){
            c.io.sample_in.valid.poke(true.B)
            c.io.sample_in.bits.offset.poke(13.U)
            c.io.sample_in.bits.shift.poke(false.B)
            c.io.sample_in.bits.tree_to_exec.poke(i.U)
            c.io.sample_in.bits.dest.poke(0.U)
            for (i <- 0 until n_classes){
            c.io.sample_in.bits.scores(i).poke(0.U)
            }
            for (i <- 0 until n_depths){
            c.io.sample_in.bits.weights(i).poke(i.U)
            }
            for (i <- 0 until n_attr){
            c.io.sample_in.bits.features(i).poke(i.U)
            }

            c.io.sample_out.ready.poke(true)
            
            c.clock.step(1)

            c.io.sample_out.bits.offset.expect(i+1)
            c.io.sample_out.bits.tree_to_exec.expect(i+1)
        }
    }
  }
}

*/