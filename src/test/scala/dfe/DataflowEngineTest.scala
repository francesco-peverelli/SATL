package dfe

import chisel3._
import chiseltest._
import chisel3.util._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.experimental.FixedPoint
import firrtl.FirrtlProtos.Firrtl.Type.FixedType
import spatialtemplates.Arithmetic.FloatArithmetic._
import spatialtemplates._

class FixedToDouble(width: Int, point: Int, fpExp: Int, fpMant: Int) extends Module {
  val fpType = FixedPoint(width.W, point.BP)
  val in = IO(Input(fpType))
  val out = IO(Output(Float(fpExp,fpMant)))
  val expOffset = ((1 << fpExp-1)-1).U.asTypeOf(UInt(fpExp.W))
  
  val uSign = in(width-1).asTypeOf(UInt(1.W))
  val fixed = in.asTypeOf(UInt(width.W))
  val noTwosCompl = Mux(uSign === 1.U,  ~(fixed - 1.U), fixed)
  
  val msb = PriorityEncoder(Reverse(noTwosCompl))
  val b = (width-1).U - msb
  val shiftVal = Mux(b > point.U, b - point.U, point.U - b)
  val absShift = Mux(b > point.U, noTwosCompl >> shiftVal, noTwosCompl << shiftVal).asTypeOf(UInt(width.W))

  val mantissa = (absShift(width - 1 - point, 0) << ((fpMant-1)-point).U).asTypeOf(UInt((fpMant-1).W))
  val exponent = Mux(b > point.U, expOffset + shiftVal, expOffset - shiftVal) 
  out.bits := Cat(uSign, exponent, mantissa)
}

class DoubleToFixed(width: Int, point: Int, fpExp: Int, fpMant: Int) extends Module {
  val fpType = FixedPoint(width.W, point.BP)
  val in = IO(Input(Float(fpExp,fpMant)))
  val out = IO(Output(fpType))
  val expOffset = ((1 << fpExp-1)-1).U.asTypeOf(UInt(fpExp.W))
  val one = FixedPoint(1, width.W, point.BP)
  val exponent = in.bits((width-1)-1, (fpMant-1)).asTypeOf(UInt(fpExp.W)) 
  val shiftVal = Mux(exponent > expOffset, exponent - expOffset, expOffset - exponent)
  val mantissa = in.bits((fpMant-1)-1,0)
  val sign = in.bits(width-1)
  val mantissaPlusOne = mantissa.asTypeOf(UInt(width.W)) | (1.U << (fpMant-1).U).asTypeOf(UInt(width.W))
  val mantissaShift = ((fpMant-1)-point)
  val fixedVal = Mux(exponent > expOffset, 
    Mux(shiftVal > mantissaShift.U, mantissaPlusOne << (shiftVal - mantissaShift.U), mantissaPlusOne >> (mantissaShift.U - shiftVal)),
    mantissaPlusOne >> (shiftVal + mantissaShift.U))
  out := Mux(sign, (~fixedVal)+1.U, fixedVal).asTypeOf(fpType)
}


class FloatMultAccEngineWrapper() extends DataflowEngine[UInt](2, 1, UInt(32.W)) {

  val internal = Module(new FloatMultAccEngineFixed())

  // Control part of IO to reset the sum counter
  val ctrl_io = IO(new MultAccEngineCtrlIO())

  ctrl_io <> internal.ctrl_io
  for(i <- 0 until 2){
    io.inData(i).bits.asTypeOf(Float(8,24)) <> internal.io.inData(i).bits
    io.inData(i).ready <> internal.io.inData(i).ready
    io.inData(i).valid <> internal.io.inData(i).valid   
  }
  io.outData(0).bits <> internal.io.outData(0).bits.asTypeOf(UInt(32.W))
  io.outData(0).ready <> internal.io.outData(0).ready
  io.outData(0).valid <> internal.io.outData(0).valid
}

class FloatMultAccEngineTest extends AnyFlatSpec with ChiselScalatestTester {

  val testerArgs = Array[String](
    "--backend-name",
    "treadle",
    "--generate-vcd-output",
    "off",
    "--target-dir",
    "../test/scala"
  )

  "dut" should "do fix to double" in {
    val bp = 16
    test(new FixedToDouble(32, bp, 8, 24)) { c =>
//      c.in.poke(FixedPoint.fromDouble(2.0, 64.W, 32.BP))
//      for(i <- 0 until 2){
//        c.clock.step()
//        val d_val = java.lang.Double.longBitsToDouble(c.out.bits.peekInt().longValue())
      
      for(i <- 0 until 10){
        val rnd = new scala.util.Random
        val start = -100.0f
        val end = 100.0f
        val n = (-0.5f + rnd.nextFloat()) * 20.0f
        c.in.poke(FixedPoint.fromDouble(n, 32.W, bp.BP))
        c.clock.step()
        val d_val = java.lang.Float.intBitsToFloat(c.out.bits.peekInt().toInt)
        print(d_val)
        print("\n---\n")
        print(n)
        print("\n\n")
      }
    }
  }
  "dut" should "do double to fix" in {
    val bp = 16
    test(new DoubleToFixed(32, bp, 8, 24)) { c =>
//      c.in.poke(FixedPoint.fromDouble(2.0, 64.W, 32.BP))
//      for(i <- 0 until 2){
//        c.clock.step()
//        val d_val = java.lang.Double.longBitsToDouble(c.out.bits.peekInt().longValue())

      for(i <- 0 until 1){
        val rnd = new scala.util.Random
        val n = (-0.5f + rnd.nextFloat()) * 20.0f
        val dataAsInt = java.lang.Float.floatToIntBits(+1.33f)
        val bit0 = dataAsInt & 0x1
        val data_unsigned = (BigInt((dataAsInt >> 1) & 0x7FFFFFFF) << 1) + BigInt(bit0)
        c.in.bits.poke(data_unsigned)
        c.clock.step()
        val d_val = c.out.peekDouble
        print("\nFixed:\n ")
        print(d_val)
        print("\n---\n")
        print(n)
        print("\n")
      }
    }
  }

  "dut" should "do macc delayed" in {
    test(new FloatMultAccEngineFixed()) { c =>
      print("Testing...\n")
       val iterations = 5
       val latency = 1

      print("Testing initial state...\n")
      // Set an iteration value
      val reps = 3
      for(j <- 0 until reps) {
        c.ctrl_io.resetCounter.valid.poke(true)
        c.ctrl_io.resetCounter.bits.poke(iterations)
        c.ctrl_io.resetCounter.ready.expect(true)
        c.clock.step()

        c.ctrl_io.resetCounter.valid.poke(false)
        c.clock.step()
      }
      print("Generating golden result\n...")
      val operand_0 = Seq.tabulate(iterations)(n => 1+n.asInstanceOf[scala.Float])
      val operand_1 = Seq.tabulate(iterations)(n => n + 3.0f)

      var op_0_queue = scala.collection.mutable.Queue[scala.Float]()
      var op_1_queue = scala.collection.mutable.Queue[scala.Float]()
      var res_queue = scala.collection.mutable.Queue[scala.Float]()
      
      var results = Seq.empty[scala.Float]

      var res = 0f
      for (i <- 0 until iterations) {
        res = res + (operand_0(i) * operand_1(i))
        results = results :+ res
      }
      print("Testing hardware module...\n")

      for (j <- 0 until reps) {
        for(i <- 0 until iterations) {
          op_0_queue.enqueue(operand_0(i))
          op_1_queue.enqueue(operand_1(i))
        }
        // Compute the accumulation
        var i = 0
        while ((op_0_queue.nonEmpty && op_1_queue.nonEmpty) && (i < 50)) { 
          if (((i % latency) == 0)) {

            // Prepare the input
            c.io.inData(0).valid.poke(true)
            c.io.inData(1).valid.poke(true)
            c.io.inData(0).bits.bits.poke(java.lang.Float.floatToIntBits(op_0_queue.front))
            c.io.inData(1).bits.bits.poke(java.lang.Float.floatToIntBits(op_1_queue.front))
            // Out is not ready
            c.io.outData(0).ready.poke(false)
            print(" i = " + i + " outData(0)=" + java.lang.Float.intBitsToFloat(c.io.outData(0).bits.bits.peekInt().toInt)+ "\n")
          } else {
            c.io.inData(0).valid.poke(false)
            c.io.inData(1).valid.poke(false)
            print(" i = " + i + " outData(0)=" + java.lang.Float.intBitsToFloat(c.io.outData(0).bits.bits.peekInt().toInt)+ "\n")
          }     
          print("OP1: " + op_1_queue + " - " + op_1_queue.nonEmpty + "\n")
          print("OP0: " + op_0_queue + " - " + op_0_queue.nonEmpty + "\n")
          print("In ready: " + c.io.inData(1).ready.peekBoolean() + " " + c.io.inData(0).ready.peekBoolean() + "\n")
          // Handle queue logic
          if(c.io.inData(0).valid.peekBoolean() && c.io.inData(0).ready.peekBoolean()) {
            op_0_queue.dequeue()
          }
          if(c.io.inData(1).valid.peekBoolean() && c.io.inData(1).ready.peekBoolean()) {
            op_1_queue.dequeue()
          } 
          c.clock.step()
          i += 1
        }
        print("res=" + java.lang.Float.intBitsToFloat(c.io.outData(0).bits.bits.peekInt().toInt) + ", valid=" + c.io.outData(0).valid.peekBoolean() + "\n")
        print("Expected res=" + res + "\n")
        c.clock.step()
        print("(2)res=" + java.lang.Float.intBitsToFloat(c.io.outData(0).bits.bits.peekInt().toInt) + ", valid=" + c.io.outData(0).valid.peekBoolean() + "\n")
        c.clock.step()
        print("(3)res=" + java.lang.Float.intBitsToFloat(c.io.outData(0).bits.bits.peekInt().toInt) + ", valid=" + c.io.outData(0).valid.peekBoolean() + "\n")
        c.io.outData(0).ready.poke(true)
        c.ctrl_io.resetCounter.valid.poke(false)
        if(c.io.outData(0).valid.peekBoolean() && c.io.outData(0).ready.peekBoolean()) {

          res_queue.enqueue(java.lang.Float.intBitsToFloat(c.io.outData(0).bits.bits.peekInt().toInt))
        }  
        c.clock.step()
      }

      assert(res_queue.size == 3)
      for(j <- 0 until 3)
        print("(j): " + j + "SW:" + results(results.size -1) + " HW: " + res_queue.dequeue() + "\n") 
      print("\n")
    }
  }
import java.nio.file.{Paths, Files}
import java.nio.charset.StandardCharsets

val VerilogEmitter = (new chisel3.stage.ChiselStage).emitVerilog(new FloatMultAccEngine() )
Files.write(Paths.get("myverilog.v"), VerilogEmitter.getBytes(StandardCharsets.UTF_8))    
    
    //println(VerilogEmitter)
}