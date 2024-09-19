package dfe

import chisel3._
import chisel3.util._
import spatialtemplates._
import spatialtemplates.Arithmetic.FloatArithmetic._

/** Engine that multiplies two numbers and accumulates the result in a register,
  * producing a result when the counter resets inData(0): value of the first
  * operand to multiply inData(1): value of the second operand outData(0): value
  * of the accumulated sum
  */
class FloatMultAccEngine(val queue_size : Int = 16, val data_size : Int = 32, val futil: FloatUtil = new FloatUtil()) 
  extends DataflowEngine[Float](2, 1, Float(futil.floatExp(data_size), futil.floatMantissa(data_size))) {
  // Control part of IO to reset the sum counter
  val ctrl_io = IO(new MultAccEngineCtrlIO())

  // Result of multiplication
  val multWire = Wire(Decoupled(Float(futil.floatExp(data_size), futil.floatMantissa(data_size))))

  val multReg = RegInit(0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size))))
  val multValid = RegInit(false.B)
  // Mult res logic
  when(io.inData(0).ready && io.inData(1).ready && io.inData(0).valid && io.inData(1).valid){
    multReg := io.inData(0).bits * io.inData(1).bits
  }.otherwise{
    multReg := multReg
  }
  // Input is ready if next stage is also ready or current out is not valid
  when(multWire.ready || !multWire.valid){
    io.inData(0).ready := true.B
    io.inData(1).ready := true.B
  }.otherwise{
    io.inData(0).ready := false.B
    io.inData(1).ready := false.B
  }
  // If we have a new result this cycle, reg is valid
  when(io.inData(0).ready && io.inData(1).ready && io.inData(0).valid && io.inData(1).valid){
    multValid := true.B
  // If out is ready and no new in will arrive, out will be invalid next cycle
  }.elsewhen(multWire.ready){
    multValid := false.B
  }.otherwise{
    multValid := multValid
  }

  multWire.bits := multReg
  multWire.valid := multValid

  val result_0 = RegInit(0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size))))
  val result_1 = RegInit(0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size))))
  val count = RegInit(0.U(32.W))
  val accQueue = Module(new Queue(UInt(32.W), queue_size))
  val accNum = RegInit(0.U(32.W))
  val s_reset :: s_iterating :: s_dequeue :: Nil = Enum(3)
  val state = RegInit(s_reset)

  ctrl_io.idle := (state === s_reset) && !accQueue.io.deq.valid && (accNum === count)

  accQueue.io.enq <> ctrl_io.resetCounter

  // Condition to reset the counting
  // 1. the counter reaches accNum
  // 2. the output fires (ready && valid) or was 0
  when(state === s_reset) {
    accQueue.io.deq.ready := true.B
  }.otherwise{
    accQueue.io.deq.ready := false.B
  }
  
  val validInput = multWire.valid //io.inData(0).valid && io.inData(1).valid
  val lastIter = (state === s_iterating) && (count === accNum)
  
  when(((state === s_dequeue) || (state === s_iterating)) && (count < accNum)){
    //io.inData(0).ready := true.B
    //io.inData(1).ready := true.B
    multWire.ready := true.B
  }.otherwise {
    //io.inData(0).ready := false.B
    //io.inData(1).ready := false.B
    multWire.ready := false.B
  }
  // Do one iteration:
  // 1.consume input data
  // 2. multiply
  // 3. sum to result so far
  when(validInput && multWire.ready /*io.inData(0).ready && io.inData(1).ready*/) {
    val mult = multWire.bits //(io.inData(0).bits * io.inData(1).bits)
    result_1 := mult + result_0
    result_0 := result_1
    count := count + 1.U
    state := s_iterating
  }

  // Reset the counting;
  // 1. accNum <- new N
  // 2. count <- 0
  // 3. counting <- true
  // 4. reset result
  when(accQueue.io.deq.valid && accQueue.io.deq.ready) {
    accNum := accQueue.io.deq.bits
    count := 0.U
    result_0 := 0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size)))
    result_1 := 0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size)))
    state := s_dequeue
  }


  when((io.outData(0).valid && io.outData(0).ready) || ((state === s_dequeue) && (accNum === 0.U))) {
    state := s_reset
  }

  when((count === accNum) && (state =/= s_reset)) { 
    // Result is valid if we have a valid accNum and we reached it
    io.outData(0).bits := result_0 + result_1
    io.outData(0).valid := true.B
  }.otherwise{
    io.outData(0).bits := 0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size)))
    io.outData(0).valid := false.B 
  }
}

class FloatMultAccEngineOld(val queue_size : Int = 16, val data_size : Int = 32, val futil: FloatUtil = new FloatUtil()) 
  extends DataflowEngine[Float](2, 1, Float(futil.floatExp(data_size), futil.floatMantissa(data_size))) {
    // Control part of IO to reset the sum counter
  val ctrl_io = IO(new MultAccEngineCtrlIO())
  val result = RegInit(0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size))))
  val count = RegInit(0.U(32.W))
  val accQueue = Module(new Queue(UInt(32.W), queue_size))
  val accNum = RegInit(0.U(32.W))
  val s_reset :: s_iterating :: s_dequeue :: Nil = Enum(3)
  val state = RegInit(s_reset)

  ctrl_io.idle := (state === s_reset) && !accQueue.io.deq.valid && (accNum === count)

  accQueue.io.enq <> ctrl_io.resetCounter

  // Condition to reset the counting
  // 1. the counter reaches accNum
  // 2. the output fires (ready && valid) or was 0
  when(state === s_reset) {
    accQueue.io.deq.ready := true.B
  }.otherwise{
    accQueue.io.deq.ready := false.B
  }
  
  val validInput = io.inData(0).valid && io.inData(1).valid
  val lastIter = (state === s_iterating) && (count === accNum)
  
  // Reset the counting;
  // 1. accNum <- new N
  // 2. count <- 0
  // 3. counting <- true
  // 4. reset result
  when(accQueue.io.deq.valid && accQueue.io.deq.ready) {
    accNum := accQueue.io.deq.bits
    count := 0.U
    result := 0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size)))
    state := s_dequeue
  }

  when(((state === s_dequeue) || (state === s_iterating)) && (count < accNum)){
    io.inData(0).ready := true.B
    io.inData(1).ready := true.B
  }.otherwise {
    io.inData(0).ready := false.B
    io.inData(1).ready := false.B
  }
  // Do one iteration:
  // 1.consume input data
  // 2. multiply
  // 3. sum to result so far
  when(validInput && io.inData(0).ready && io.inData(1).ready) {
    val mult = (io.inData(0).bits * io.inData(1).bits)
    result := mult + result
    //result := result.mac(io.inData(0).bits, io.inData(1).bits)
    count := count + 1.U
    state := s_iterating
  }

  when((io.outData(0).valid && io.outData(0).ready) || ((state === s_dequeue) && (accNum === 0.U))) {
    state := s_reset
  }

  when((count === accNum) && (state =/= s_reset)) { 
    // Result is valid if we have a valid accNum and we reached it
    io.outData(0).bits := result
    io.outData(0).valid := true.B
  }.otherwise{
    io.outData(0).bits := 0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size)))
    io.outData(0).valid := false.B 
  }
}

import chisel3.experimental.FixedPoint
import firrtl.FirrtlProtos.Firrtl.Type.FixedType

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
  val absShift = Mux(b > point.U, noTwosCompl, noTwosCompl << shiftVal).asTypeOf(UInt(width.W))

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

class FloatMultAccEngineFixed(val queue_size : Int = 16, val data_size : Int = 32, val width: Int = 32, val bp: Int = 16, val futil: FloatUtil = new FloatUtil()) 
  extends DataflowEngine[Float](2, 1, Float(futil.floatExp(data_size), futil.floatMantissa(data_size))) {
    // Control part of IO to reset the sum counter
  val ctrl_io = IO(new MultAccEngineCtrlIO())
  val result = RegInit(FixedPoint(0, width.W, bp.BP))
  val count = RegInit(0.U(32.W))
  val accQueue = Module(new Queue(UInt(32.W), queue_size))
  val accNum = RegInit(0.U(32.W))
  val s_reset :: s_iterating :: s_dequeue :: Nil = Enum(3)
  val state = RegInit(s_reset)

  ctrl_io.idle := (state === s_reset) && !accQueue.io.deq.valid && (accNum === count)

  accQueue.io.enq <> ctrl_io.resetCounter

  // Condition to reset the counting
  // 1. the counter reaches accNum
  // 2. the output fires (ready && valid) or was 0
  when(state === s_reset) {
    accQueue.io.deq.ready := true.B
  }.otherwise{
    accQueue.io.deq.ready := false.B
  }
  
  val validInput = io.inData(0).valid && io.inData(1).valid
  val lastIter = (state === s_iterating) && (count === accNum)
  
  // Reset the counting;
  // 1. accNum <- new N
  // 2. count <- 0
  // 3. counting <- true
  // 4. reset result
  when(accQueue.io.deq.valid && accQueue.io.deq.ready) {
    accNum := accQueue.io.deq.bits
    count := 0.U
    result := FixedPoint(0, width.W, bp.BP)// 0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size)))
    state := s_dequeue
  }

  when(((state === s_dequeue) || (state === s_iterating)) && (count < accNum)){
    io.inData(0).ready := true.B
    io.inData(1).ready := true.B
  }.otherwise {
    io.inData(0).ready := false.B
    io.inData(1).ready := false.B
  }

  val toFixed = Module(new DoubleToFixed(width, bp, futil.floatExp(data_size), futil.floatMantissa(data_size)))
  toFixed.in := (io.inData(0).bits * io.inData(1).bits)
  // Do one iteration:
  // 1.consume input data
  // 2. multiply
  // 3. sum to result so far
  when(validInput && io.inData(0).ready && io.inData(1).ready) {
    val mult = toFixed.out
    result := mult + result
    //result := result.mac(io.inData(0).bits, io.inData(1).bits)
    count := count + 1.U
    state := s_iterating
  }

  when((io.outData(0).valid && io.outData(0).ready) || ((state === s_dequeue) && (accNum === 0.U))) {
    state := s_reset
  }

  when((count === accNum) && (state =/= s_reset)) { 
    // Result is valid if we have a valid accNum and we reached it
    val toFloat = Module(new FixedToDouble(width, bp, futil.floatExp(data_size), futil.floatMantissa(data_size)))
    toFloat.in := result
    io.outData(0).bits := toFloat.out
    io.outData(0).valid := true.B
  }.otherwise{
    io.outData(0).bits := 0.U.asTypeOf(Float(futil.floatExp(data_size), futil.floatMantissa(data_size)))
    io.outData(0).valid := false.B 
  }
}

class BlackBoxMACC(mantissa: Int, exp: Int)
  extends BlackBox(Map("MANTISSA" -> mantissa, "EXP" -> exp))
  with HasBlackBoxInline {
    

}

/** Engine that multiplies two numbers and accumulates the result in a register,
  * producing a result when the counter resets inData(0): value of the first
  * operand to multiply inData(1): value of the second operand outData(0): value
  * of the accumulated sum
  */
class IntMultAccEngine(val queue_size : Int = 16) extends DataflowEngine[UInt](2, 1, UInt(32.W)) {
  // Control part of IO to reset the sum counter
  val ctrl_io = IO(new MultAccEngineCtrlIO())
  val result = RegInit(0.U(32.W))
  val count = RegInit(0.U(32.W))
  val accQueue = Module(new Queue(UInt(32.W), queue_size))
  val accNum = RegInit(0.U(32.W))
  val s_reset :: s_iterating :: s_dequeue :: Nil = Enum(3)
  val state = RegInit(s_reset)

  ctrl_io.idle := (state === s_reset) && !accQueue.io.deq.valid && (accNum === count)

  accQueue.io.enq <> ctrl_io.resetCounter

  // Condition to reset the counting
  // 1. the counter reaches accNum
  // 2. the output fires (ready && valid) or was 0
  when(state === s_reset) {
    accQueue.io.deq.ready := true.B
  }.otherwise{
    accQueue.io.deq.ready := false.B
  }
  
  val validInput = io.inData(0).valid && io.inData(1).valid
  val lastIter = (state === s_iterating) && (count === accNum)
  
  // Reset the counting;
  // 1. accNum <- new N
  // 2. count <- 0
  // 3. counting <- true
  // 4. reset result
  when(accQueue.io.deq.valid && accQueue.io.deq.ready) {
    accNum := accQueue.io.deq.bits
    count := 0.U
    result := 0.U
    state := s_dequeue
  }

  when(((state === s_dequeue) || (state === s_iterating)) && (accNum > 0.U) && !lastIter){
    io.inData(0).ready := true.B
    io.inData(1).ready := true.B
  }.otherwise {
    io.inData(0).ready := false.B
    io.inData(1).ready := false.B
  }
  // Do one iteration:
  // 1.consume input data
  // 2. multiply
  // 3. sum to result so far
  when((count < accNum) && validInput && ((state === s_dequeue) || (state === s_iterating))) {
    val mult = (io.inData(0).bits * io.inData(1).bits)
    result := mult + result
    count := count + 1.U
    state := s_iterating
  }

  when((io.outData(0).valid && io.outData(0).ready) || ((state === s_dequeue) && (accNum === 0.U))) {
    state := s_reset
  }

  when((count === accNum) && (state =/= s_reset)) { 
    // Result is valid if we have a valid accNum and we reached it
    io.outData(0).bits := result
    io.outData(0).valid := true.B
  }.otherwise{
    io.outData(0).bits := 0.U
    io.outData(0).valid := false.B 
  }
}