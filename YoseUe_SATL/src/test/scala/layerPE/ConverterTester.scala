package YoseUe_SATL

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import scala.math._
import chisel3.experimental.FixedPoint
/*
class ForwardConverterTester extends AnyFreeSpec with ChiselScalatestTester {

  val n_attr = 4
  val n_classes = 4
  val n_depths = 2
  val info_bit = 10
  val tree_bit = 7
  val rounded_info_bit = 16
  val rounded_tree_bit = 8
  val compensation = if ((n_attr+n_classes+n_depths)%2==0) 16 else 0 

  "Forward Converter should convert AxiSample in Sample" in {
    test(new ForwardConverter(n_attr,n_classes,n_depths,info_bit,tree_bit,rounded_info_bit,rounded_tree_bit,compensation)) { c =>
        
        for(i <- 0 until 4){
          c.io.sample_in.TVALID.poke(true.B)
          if(i==3){
            c.io.sample_in.TDATA.poke(BigInt("0", 10).U(256.W))
          }else if(i==1){
            c.io.sample_in.TDATA.poke(BigInt("3213900608446634405305657918234759609991344031508927740903937", 10).U(256.W))
          }else{
            c.io.sample_in.TDATA.poke(BigInt("3213900608446634405305657918234759609991344031508927740903936", 10).U(256.W))
          }
          
          c.io.sample_in.TKEEP.poke(0.U)
          //c.io.sample_in.TREADY.poke(true.B)
          c.io.sample_in.TLAST.poke(false.B)
          c.io.sample_out.ready.poke(true)
              
          c.clock.step(1)
        }
        
        println("SAMPLE_OUT: ")
        println("FEATURES: ")
        for (i <- 0 until n_attr){
          println(c.io.sample_out.bits.features(i).peek().litToDouble)
        }
        println("SCORES: ")
        for (i <- 0 until n_classes){
          println(c.io.sample_out.bits.scores(i).peek().litToDouble)
        }
        println("WEIGHTS: ")
        for (i <- 0 until n_depths){
          println(c.io.sample_out.bits.weights(i).peek().litToDouble)
        }
        println("SHIFT, OFFSET, SEARCH_FOR_ROOT, TREE_TO_EXEC, VALID, DEST")
        println(c.io.sample_out.bits.shift.peek().litValue)
        println(c.io.sample_out.bits.offset.peek().litValue)
        println(c.io.sample_out.bits.search_for_root.peek().litValue)
        println(c.io.sample_out.bits.tree_to_exec.peek().litValue)
        println(c.io.sample_out.valid.peek().litValue)
        println(c.io.sample_out.bits.dest.peek().litValue)

    }
  }
}

class BackwardConverterTester extends AnyFreeSpec with ChiselScalatestTester {

  val n_attr = 2
  val n_classes = 1
  val n_depths = 1
  val info_bit = 10
  val tree_bit = 7
  val rounded_info_bit = 16
  val rounded_tree_bit = 8
  val compensation = if ((n_attr+n_classes+n_depths)%2==0) 16 else 0 

  "Backward Converter should convert Sample in AxiSample" in {
    test(new BackwardConverter(n_attr,n_classes,n_depths,info_bit,tree_bit,rounded_info_bit,rounded_tree_bit,compensation)) { c =>
        
        c.io.sample_in.valid.poke(true.B)
        for (i <- 0 until n_classes){
          c.io.sample_in.bits.scores(i).poke(FixedPoint.fromDouble(9,16.W,8.BP))
        }
        for (i <- 0 until n_depths){
          c.io.sample_in.bits.weights(i).poke(FixedPoint.fromDouble(33,16.W,8.BP))
        }
        for (i <- 0 until n_attr){
          c.io.sample_in.bits.features(i).poke(FixedPoint.fromDouble(i+1,16.W,8.BP))
        }
        c.io.sample_in.bits.offset.poke(5.U)
        c.io.sample_in.bits.shift.poke(true.B)
        c.io.sample_in.bits.search_for_root.poke(true.B)
        c.io.sample_in.bits.tree_to_exec.poke(7.U)
        c.io.sample_in.bits.last.poke(true.B)
        c.io.sample_in.bits.dest.poke(true.B)
        
        c.io.sample_out.TREADY.poke(true)
            
        c.clock.step(1)
        
        println("SAMPLE_OUT: ")
        println("TDATA, TKEEP, TLAST, TVALID")
        
        println(c.io.sample_out.TDATA.peek().litValue)
        println(c.io.sample_out.TKEEP.peek().litValue)
        println(c.io.sample_out.TLAST.peek().litValue)
        println(c.io.sample_out.TVALID.peek().litValue)
    }
  }
}
*/