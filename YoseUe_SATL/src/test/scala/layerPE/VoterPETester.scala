package YoseUe_SATL

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import scala.math._

/*

class VoterPETester extends AnyFreeSpec with ChiselScalatestTester {

  val n_attr = 4
  val n_classes = 4
  val n_depths = 5
  val info_bit = 10
  val tree_bit = 8

  "Pe should compute the overall score of the samples" in {
    test(new VoterPE(new ElemId(2,0,0,0),n_attr,n_classes,n_depths,info_bit,tree_bit,2)) { c =>
        
        for (i <- 0 until 2){
            c.io.samples_in(i).bits.offset.poke(0.U)
            c.io.samples_in(i).bits.shift.poke(false.B)
            c.io.samples_in(i).bits.tree_to_exec.poke(1.U)
            c.io.samples_in(i).bits.dest.poke(true.B)
            for (j <- 0 until n_classes){
                c.io.samples_in(i).bits.scores(j).poke(((i+j)).U)
            }
            for (j <- 0 until n_depths){
                c.io.samples_in(i).bits.weights(j).poke(i.U)
            }
            for (j <- 0 until n_attr){
                c.io.samples_in(i).bits.features(j).poke(5.U)
            }
            if(i==0){
                c.io.samples_in(i).valid.poke(true.B)
            }else{
                c.io.samples_in(i).valid.poke(false.B)
            }
            //c.io.samples_in(i).valid.poke(true.B)
            c.io.sample_out.ready.poke(true)
        }

        c.clock.step()

        println("SCORES: ")
        for (i <- 0 until n_classes){
            println(c.io.sample_out.bits.scores(i).peek().litValue)
        }
        println("VALID: ")
        println(c.io.sample_out.valid.peek().litValue)

        for (i <- 0 until 2){
            c.io.samples_in(i).bits.offset.poke(0.U)
            c.io.samples_in(i).bits.shift.poke(false.B)
            c.io.samples_in(i).bits.tree_to_exec.poke(1.U)
            c.io.samples_in(i).bits.dest.poke(true.B)
            for (j <- 0 until n_classes){
                c.io.samples_in(i).bits.scores(j).poke(1.U)
            }
            for (j <- 0 until n_depths){
                c.io.samples_in(i).bits.weights(j).poke(i.U)
            }
            for (j <- 0 until n_attr){
                c.io.samples_in(i).bits.features(j).poke(7.U)
            }
            if(i==0){
                c.io.samples_in(i).valid.poke(true.B)
            }else{
                c.io.samples_in(i).valid.poke(true.B)
            }
            //c.io.samples_in(i).valid.poke(true.B)
            c.io.sample_out.ready.poke(true)
        }

        c.clock.step()

        println("SCORES: ")
        for (i <- 0 until n_classes){
            println(c.io.sample_out.bits.scores(i).peek().litValue)
        }
        println("VALID: ")
        println(c.io.sample_out.valid.peek().litValue)
    }
  }
}
*/