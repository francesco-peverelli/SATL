package YoseUe_SATL

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import scala.math._
import java.io.PrintWriter
import java.io.File
import java.nio.file.Files
import java.nio.file.Paths
import dataclass.data
import java.nio.charset.StandardCharsets
import scala.io.Source
import chisel3.experimental.FixedPoint

class TreePEsWrapperTester extends AnyFreeSpec with ChiselScalatestTester {
  
  val synthesis = false

  if(synthesis){
    println("Synthesizing...")
  }else{
    println("Simulating...")
  }

  if(!synthesis){
    val n_trees = 10
    val max_depth = 5
    val n_attr = 4
    val n_classes = 4
    val n_depths = 5
    val info_bit = 10
    val tree_bit = 8
    val attr_bit = (log(n_attr)/log(2)-0.00001).toInt + 1
    val bram_size = 36*1024
    val instruction_per_bram = (bram_size/64).toInt //64 is the Node Instruction size, fixed to 64. It should not change but, if It will happen, remember to change the value here
    val trees_for_depth = (math.ceil(n_trees/n_depths)).toInt
    val max_trees_at_maximum_depth = instruction_per_bram/(math.pow(2,max_depth-1))
    val set_of_pes = (math.ceil(trees_for_depth/max_trees_at_maximum_depth)).toInt
    val n_pes = max_depth*set_of_pes
    var n_loops = 0
    if (set_of_pes > 1){
        n_loops = (max_trees_at_maximum_depth*n_depths).toInt
    }else{
        n_loops = n_trees
    }
    val structure_list = List(List(n_pes,n_loops))
    
    "Pe should compute samples score" in {
      test(new TreePEsWrapper(n_trees, max_depth, n_attr,n_classes,n_depths,info_bit,tree_bit,attr_bit,bram_size=36*1024,structure_list)) { c =>
          c.clock.setTimeout(20000)
          /*for(i <- 0 until 2){
            c.brams_io(0).write_2.poke(true.B)
            c.brams_io(0).addr_2.poke(i.U)
            c.brams_io(0).dataIn_2.poke(BigInt("126118386047385600", 10).U(64.W))
            c.brams_io(1).write_2.poke(true.B)
            c.brams_io(1).addr_2.poke((2*i).U)
            c.brams_io(1).dataIn_2.poke(BigInt("72092834244591616", 10).U(64.W))
            c.brams_io(2).write_2.poke(true.B)
            c.brams_io(2).addr_2.poke(i.U)
            c.brams_io(2).dataIn_2.poke(BigInt("126118386047385600", 10).U(64.W))
            c.brams_io(3).write_2.poke(true.B)
            c.brams_io(3).addr_2.poke((2*i).U)
            c.brams_io(3).dataIn_2.poke(BigInt("72092834244591616", 10).U(64.W))
            if(i<1){
              c.brams_io(4).write_2.poke(true.B)
              c.brams_io(4).addr_2.poke(i.U)
              c.brams_io(4).dataIn_2.poke(BigInt("126118386047385600", 10).U(64.W))
              c.brams_io(5).write_2.poke(true.B)
              c.brams_io(5).addr_2.poke((2*i).U)
              c.brams_io(5).dataIn_2.poke(BigInt("72092834244591616", 10).U(64.W))
            }else{
              c.brams_io(4).write_2.poke(true.B)
              c.brams_io(4).addr_2.poke(i.U)
              c.brams_io(4).dataIn_2.poke(BigInt("0", 10).U(64.W))
              c.brams_io(5).write_2.poke(true.B)
              c.brams_io(5).addr_2.poke((2*i).U)
              c.brams_io(5).dataIn_2.poke(BigInt("0", 10).U(64.W))
            }
            
            c.clock.step()
          }

          for(i <- 0 until 2){
            c.brams_io(1).write_2.poke(true.B)
            c.brams_io(1).addr_2.poke((2*i+1).U)
            c.brams_io(1).dataIn_2.poke(BigInt("72092834244591616", 10).U(64.W))
            c.brams_io(3).write_2.poke(true.B)
            c.brams_io(3).addr_2.poke((2*i+1).U)
            c.brams_io(3).dataIn_2.poke(BigInt("72092834244591616", 10).U(64.W))
            if(i<1){
              c.brams_io(5).write_2.poke(true.B)
              c.brams_io(5).addr_2.poke((2*i+1).U)
              c.brams_io(5).dataIn_2.poke(BigInt("72092834244591616", 10).U(64.W))
            }else{
              c.brams_io(5).write_2.poke(true.B)
              c.brams_io(5).addr_2.poke((2*i+1).U)
              c.brams_io(5).dataIn_2.poke(BigInt("0", 10).U(64.W))
            }
            c.clock.step()
          }*/


          //BRAM 0

          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(0.U)
          var value = BigInt("0000100111000000000100000000000100000000000000000000000000000000", 2).U(64.W)
          c.brams_io(0).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(1.U)
          value = BigInt("0000100111000000001100000000100100000000000000000000000000000000", 2).U(64.W)
          c.brams_io(0).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(2.U)
          value = BigInt("0000011111000000010100000001000100000000000000000000000000000000", 2).U(64.W) 
          c.brams_io(0).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(3.U)
          value = BigInt("0000011111000000011100000001100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(0).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(4.U)
          value = BigInt("0000010111000000100100000010000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(0).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(5.U)
          value = BigInt("0000010111000000101100000010100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(0).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(6.U)
          value = BigInt("0000001111000000110100000011000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(0).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(7.U)
          value = BigInt("0000001111000000111100000011100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(0).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(8.U)
          value = BigInt("0000000100000000001100000000000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(0).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(9.U)
          value = BigInt("0000000100000000001100000000000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(0).bram_wrdata_a.poke(value)
          c.clock.step()

          //BRAM 1
          
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(0.U)
          value = BigInt("0000100111000000000100000000000000000000000000000000000000000000", 2).U(64.W)
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(1.U)
          value = BigInt("0000100111000000001100000000100000000000000000000000000000000000", 2).U(64.W)
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(2.U)
          value = BigInt("0000100111000000010100000001001100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(3.U)
          value = BigInt("0000100101000000000000000001100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(4.U)
          value = BigInt("0000011111000000100100000010000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(5.U)
          value = BigInt("0000011111000000101100000010100000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(6.U)
          value = BigInt("0000011111000000110100000011001100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(7.U)
          value = BigInt("0000011111000000111100000011100000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(8.U)
          value = BigInt("0000010111000001000100000100000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(9.U)
          value = BigInt("0000010111000001001100000100101000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(10.U)
          value = BigInt("0000010111000001010100000101001100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(11.U)
          value = BigInt("0000010101000000000000000101100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(12.U)
          value = BigInt("0000001100000000011000000000000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(13.U)
          value = BigInt("0000001100000000001100000000111100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(14.U)
          value = BigInt("0000001100000000011000000000001100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(15.U)
          value = BigInt("0000001100000000000000000000111000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(1).bram_wrdata_a.poke(value)
          c.clock.step()

          //BRAM 2

          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(0.U)
          value = BigInt("0000100111000000000100000000000100000000000000000000000000000000", 2).U(64.W)
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(1.U)
          value = BigInt("0000100111000000001100000000101100000000000000000000000000000000", 2).U(64.W)
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(2.U)
          value = BigInt("0000100111000000010100000001000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(3.U)
          value = BigInt("0000100111000000011100000001100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(4.U)
          value = BigInt("0000100111000000100100000010000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(5.U)
          value = BigInt("0000100111000000101100000010101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(6.U)
          value = BigInt("0000100111000000110100000011000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(8.U)
          value = BigInt("0000011111000001000100000100000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(9.U)
          value = BigInt("0000011111000001001100000100100000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(10.U)
          value = BigInt("0000011110000001010100000000101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(11.U)
          value = BigInt("0000011111000001011100000101100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(12.U)
          value = BigInt("0000011111000001100100000110000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(13.U)
          value = BigInt("0000011111000001101100000110101000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(14.U)
          value = BigInt("0000011101000000000000000111000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(15.U)
          value = BigInt("0000011111000001111100000111101000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(16.U)
          value = BigInt("0000010100000000011000000000000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(17.U)
          value = BigInt("0000010100000000000000000001100000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(18.U)
          value = BigInt("0000010100000000001100000000100000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(19.U)
          value = BigInt("0000010100000000001100000001100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(20.U)
          value = BigInt("0000010100000000011000000000000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(21.U)
          value = BigInt("0000010100000000000000000001100000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(22.U)
          value = BigInt("0000010100000000011000000000111000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(2).bram_wrdata_a.poke(value)
          c.clock.step()

          //BRAM 3

          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(0.U)
          value = BigInt("0000100111000000000100000000000000000000000000000000000000000000", 2).U(64.W)
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(1.U)
          value = BigInt("0000100111000000001100000000100000000000000000000000000000000000", 2).U(64.W)
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(2.U)
          value = BigInt("0000100111000000010100000001000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(3.U)
          value = BigInt("0000100101000000000000000001101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(4.U)
          value = BigInt("0000100110000000100100000000111000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(5.U)
          value = BigInt("0000100111000000101100000010101000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(6.U)
          value = BigInt("0000100111000000110100000011001100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(7.U)
          value = BigInt("0000100110000000111100000000110100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(8.U)
          value = BigInt("0000100111000001000100000100000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(9.U)
          value = BigInt("0000100111000001001100000100101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(10.U)
          value = BigInt("0000100111000001010100000101000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(11.U)
          value = BigInt("0000100111000001011100000101101000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(12.U)
          value = BigInt("0000100111000001100100000110001000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(13.U)
          value = BigInt("0000011101000000000000000111000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(16.U)
          value = BigInt("0000011100000000000000000000000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(17.U)
          value = BigInt("0000011100000000000000000001101000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(18.U)
          value = BigInt("0000011100000000011000000000000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(19.U)
          value = BigInt("0000011100000000000000000000001100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(21.U)
          value = BigInt("0000011100000000001100000000110000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(22.U)
          value = BigInt("0000011100000000001000000001100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(23.U)
          value = BigInt("0000011100000000001100000001101000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(24.U)
          value = BigInt("0000011100000000000000000000000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(25.U)
          value = BigInt("0000011100000000000000000001100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(26.U)
          value = BigInt("0000011100000000011000000001101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(27.U)
          value = BigInt("0000011100000000011000000000000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(28.U)
          value = BigInt("0000011100000000001100000000110100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(30.U)
          value = BigInt("0000011100000000000000000000110100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(31.U)
          value = BigInt("0000011100000000001100000001100000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(3).bram_wrdata_a.poke(value)
          c.clock.step()

          //BRAM 4
           
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(0.U)
          value = BigInt("0000100100000000011000000000000000000000000000000000000000000000", 2).U(64.W)
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(1.U)
          value = BigInt("0000100100000000000000000000000000000000000000000000000000000000", 2).U(64.W)
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(2.U)
          value = BigInt("0000100100000000011000000001101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(3.U)
          value = BigInt("0000100100000000011000000000000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(4.U)
          value = BigInt("0000100100000000011000000000000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(5.U)
          value = BigInt("0000100100000000000000000001100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(6.U)
          value = BigInt("0000100100000000011000000000000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(9.U)
          value = BigInt("0000100100000000001000000000100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(10.U)
          value = BigInt("0000100100000000001100000000110000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(11.U)
          value = BigInt("0000100100000000001000000000000000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(12.U)
          value = BigInt("0000100100000000011000000001101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(13.U)
          value = BigInt("0000100100000000001100000000101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(15.U)
          value = BigInt("0000100100000000000000000001101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(16.U)
          value = BigInt("0000100100000000011000000000001100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(17.U)
          value = BigInt("0000100100000000000000000000001100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(18.U)
          value = BigInt("0000100100000000001000000001101000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(19.U)
          value = BigInt("0000100100000000011000000001101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(20.U)
          value = BigInt("0000100100000000011000000001100000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(21.U)
          value = BigInt("0000100100000000010100000001101100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(22.U)
          value = BigInt("0000011100000000001000000001100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(23.U)
          value = BigInt("0000100100000000011000000000001100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(24.U)
          value = BigInt("0000100100000000000000000000000100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(25.U)
          value = BigInt("0000100100000000011000000000110100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(26.U)
          value = BigInt("0000100100000000011000000000010000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(27.U)
          value = BigInt("0000100100000000001000000001100100000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
          c.brams_io(4).bram_we_a.poke(15.U)
          c.brams_io(4).bram_addr_a.poke(28.U)
          value = BigInt("0000100100000000001100000000111000000000000000000000000000000000", 2).U(64.W)  
          c.brams_io(4).bram_wrdata_a.poke(value)
          c.clock.step()
        
          /*
          
          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(0.U)
          c.brams_io(0).bram_wrdata_a.poke(BigInt("126118386047385600", 10).U(64.W))
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(0.U)
          c.brams_io(1).bram_wrdata_a.poke(BigInt("216190378594795520", 10).U(64.W))
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(0.U)
          c.brams_io(2).bram_wrdata_a.poke(BigInt("126118386047385600", 10).U(64.W))
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(0.U)
          c.brams_io(3).bram_wrdata_a.poke(BigInt("72075190518939648", 10).U(64.W))
          
          c.clock.step()

          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(1.U)
          c.brams_io(0).bram_wrdata_a.poke(BigInt("126153604779212800", 10).U(64.W))
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(1.U)
          c.brams_io(1).bram_wrdata_a.poke(BigInt("216190378594795520", 10).U(64.W))
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(1.U)
          c.brams_io(2).bram_wrdata_a.poke(BigInt("126153604779212800", 10).U(64.W))
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(1.U)
          c.brams_io(3).bram_wrdata_a.poke(BigInt("72075190518939648", 10).U(64.W))

          c.clock.step()

          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(2.U)
          c.brams_io(0).bram_wrdata_a.poke(BigInt("72075190518939648", 10).U(64.W))
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(2.U)
          c.brams_io(1).bram_wrdata_a.poke(BigInt("72075190518939648", 10).U(64.W))
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(2.U)
          c.brams_io(2).bram_wrdata_a.poke(BigInt("72075190518939648", 10).U(64.W))
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(2.U)
          c.brams_io(3).bram_wrdata_a.poke(BigInt("72075190518939648", 10).U(64.W))

          c.clock.step()

          c.brams_io(0).bram_we_a.poke(15.U)
          c.brams_io(0).bram_addr_a.poke(3.U)
          c.brams_io(0).bram_wrdata_a.poke(BigInt("0", 10).U(64.W))
          c.brams_io(1).bram_we_a.poke(15.U)
          c.brams_io(1).bram_addr_a.poke(3.U)
          c.brams_io(1).bram_wrdata_a.poke(BigInt("72075190518939648", 10).U(64.W))
          c.brams_io(2).bram_we_a.poke(15.U)
          c.brams_io(2).bram_addr_a.poke(3.U)
          c.brams_io(2).bram_wrdata_a.poke(BigInt("0", 10).U(64.W))
          c.brams_io(3).bram_we_a.poke(15.U)
          c.brams_io(3).bram_addr_a.poke(3.U)
          c.brams_io(3).bram_wrdata_a.poke(BigInt("72075190518939648", 10).U(64.W))

          c.clock.step()
          */
          val n_samples = 1
          val idle = 1
          val timeout = idle + 4000
          for(i <- 0 until n_samples){
            if (i%2==0){
              c.wrapper_io.sample_in.TVALID.poke(true.B)
            }else{
              c.wrapper_io.sample_in.TVALID.poke(true.B)
            }
            c.wrapper_io.sample_in.TDATA.poke((BigInt("312146274642695179041468581242585126082951571807392635195091124438675467384660075490684549221127095752803175029128931950805166922654195579395080", 10)+i).U(512.W))
            if (i==(n_samples-1)){
              c.wrapper_io.sample_in.TLAST.poke(true.B)
            }else{
              c.wrapper_io.sample_in.TLAST.poke(false.B)
            }
            c.wrapper_io.sample_out.TREADY.poke(false.B)

            c.clock.step()
          }

          for(i <- 0 until idle){
            c.wrapper_io.sample_in.TVALID.poke(false.B)
            c.wrapper_io.sample_in.TLAST.poke(false.B)
            c.wrapper_io.sample_out.TREADY.poke(false.B)
            c.clock.step()
          }

          var counter = 0
          var counter2 = 0
          var throughput_c = 0
          var counting = false
          var first_cycle = 0
          var last_cycle = 0
          while((counter < n_samples) && (counter2<timeout)){
            c.wrapper_io.sample_in.TVALID.poke(false.B )
            c.wrapper_io.sample_out.TREADY.poke(true.B)
            //print(counter,counter2)
            counter2 = counter2 + 1
            if(c.wrapper_io.sample_out.TVALID.peek().litValue == 1){
              
              counting = true
              counter = counter + 1
              println("SAMPLE_OUT: ")
              println("TLAST, TVALID")
              println(c.wrapper_io.sample_out.TLAST.peek())
              println(c.wrapper_io.sample_out.TVALID.peek())
              val data = c.wrapper_io.sample_out.TDATA.peek()
              
              println("TDATA: ", data.litValue)
              
              println("FEATURES: ")
              for (i <- 0 until n_attr){
                  val feature = data((i+1)*32-1,i*32).litValue
                  val fixedPointValue: Double = (feature >> 16).toDouble + ((feature & BigInt("FFFF", 32)).toDouble) / pow(2, 16)
                  println(fixedPointValue)
              }
              
              println("SCORES: ")
              for (i <- 0 until n_classes){
                val score = data(n_attr*32+48+(i+1)*32-1,n_attr*32+48+i*32).litValue
                val fixedPointValue: Double = (score >> 16).toDouble + ((score & BigInt("FFFF", 32)).toDouble) / pow(2, 16)
                println(fixedPointValue)
              }
              println("WEIGHTS: ")
              for (i <- 0 until n_depths){
                val weight = data(n_attr*32+48+n_classes*32+(i+1)*32-1,n_attr*32+48+n_classes*32+i*32).litValue
                val fixedPointValue: Double = (weight >> 16).toDouble + ((weight & BigInt("FFFF", 32)).toDouble) / pow(2, 16)
                println(fixedPointValue)
              }
              println("SHIFT, OFFSET, TREE_TO_EXEC, SFR, TIMER")
              println(data(n_attr*32+23,n_attr*32+16).litValue)
              println(data(n_attr*32+15,n_attr*32).litValue)
              println(data(n_attr*32+39,n_attr*32+32).litValue)
              println(data(n_attr*32+31,n_attr*32+24).litValue)
              println(data(207,176).litValue)
              if(first_cycle == 0){
                first_cycle = data(207,176).litValue.toInt
              }
              last_cycle = data(207,176).litValue.toInt
              println(first_cycle, last_cycle)
            }
            c.clock.step()
            if(counting)
              throughput_c += 1
          }

          print("Cycles looped: " + counter2 +"\n")
          print("Samples received:" + counter+"\n")
          //print("Throughput:" + n_samples/(last_cycle - first_cycle) +"\n")
          print("First-Last:" + throughput_c +"\n")
      }
    }
  }else{
    val n_trees = 10
    val max_depth = 5
    val n_attr = 4
    val n_classes = 4
    val n_depths = 5
    val info_bit = 10
    val tree_bit = 8
    val attr_bit = (log(n_attr)/log(2)-0.00001).toInt + 1
    val bram_size = 36*1024
    val instruction_per_bram = (bram_size/64).toInt //64 is the Node Instruction size, fixed to 64. It should not change but, if It will happen, remember to change the value here
    val trees_for_depth = (math.ceil(n_trees/n_depths)).toInt
    val max_trees_at_maximum_depth = instruction_per_bram/(math.pow(2,max_depth-1))
    val set_of_pes = (math.ceil(trees_for_depth/max_trees_at_maximum_depth)).toInt
    val n_pes = max_depth*set_of_pes
    var n_loops = 0
    if (set_of_pes > 1){
        n_loops = (max_trees_at_maximum_depth*n_depths).toInt
    }else{
        n_loops = n_trees
    }
    val structure_list = List(List(n_pes,n_loops))

    val VerilogEmitter = (new chisel3.stage.ChiselStage).emitVerilog(
              new TreePEsWrapper(n_trees, max_depth, n_attr,n_classes,n_depths,info_bit,tree_bit,attr_bit,bram_size=bram_size,structure_list,true)
          )
              Files.write(
                  Paths.get("./test.v"),
                  VerilogEmitter.getBytes(StandardCharsets.UTF_8)
              )
  }
}

/*

object VerilogGenerator extends App{

  def main(args: Array[String]): Unit = {
    val n_trees = args(0).toInt
    println(n_trees)
    val max_depth = args(1).toInt
    println(max_depth)
    val n_attr = 4
    val n_classes = 4
    val n_depths = 5
    val info_bit = 10
    val tree_bit = 8
    val attr_bit = (log(n_attr)/log(2)-0.00001).toInt + 1
    val bram_size = 36*1024
    val instruction_per_bram = (bram_size/64).toInt //64 is the Node Instruction size, fixed to 64. It should not change but, if It will happen, remember to change the value here
    val trees_for_depth = (math.ceil(n_trees/n_depths)).toInt
    val max_trees_at_maximum_depth = instruction_per_bram/(math.pow(2,max_depth-1))
    val set_of_pes = (math.ceil(trees_for_depth/max_trees_at_maximum_depth)).toInt
    val n_pes = max_depth*set_of_pes
    var n_loops = 0
    if (set_of_pes > 1){
        n_loops = (max_trees_at_maximum_depth*n_depths).toInt
    }else{
        n_loops = n_trees
    }
    val structure_list = List(List(n_pes,n_loops))

    val VerilogEmitter = (new chisel3.stage.ChiselStage).emitVerilog(
              new TreePEsWrapper(n_trees, max_depth, n_attr,n_classes,n_depths,info_bit,tree_bit,attr_bit,bram_size=bram_size,structure_list,true)
          )
              Files.write(
                  Paths.get("./test.v"),
                  VerilogEmitter.getBytes(StandardCharsets.UTF_8)
              )
  }
}*/