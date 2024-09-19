package dfe

import chisel3._
import chisel3.util._
import spatialtemplates.Arithmetic.FloatArithmetic._
import spatialtemplates._

abstract class AbstractDataflowEngine extends Module {}

/** This abstract bundle defines a passthrough IO designed to be handled outside
  * of the PE instantiating a dataflow engine
  */
abstract class DFEPassthroughIO extends Bundle {}

trait DFEWithPassthrough {
  val ctrl_io: DFEPassthroughIO
}

abstract class PassthroughDataflowEngine 
  extends AbstractDataflowEngine with DFEWithPassthrough {}

class DFEngineIO[T <: Data: Arithmetic](
    val num_in: Int,
    val num_out: Int,
    gen: T
) extends Bundle {
  val inData = Vec(num_in, Flipped(Decoupled(gen)))
  val outData = Vec(num_out, Decoupled(gen))
}

/** A generic computational engine for a dataflow PE
  */
abstract class DataflowEngine[T <: Data: Arithmetic](
    val num_in: Int,
    val num_out: Int,
    gen: T
) extends PassthroughDataflowEngine {
  val io = IO(new DFEngineIO[T](num_in, num_out, gen))
}

/**
 * This control bundle extends DFEPassthroughIO since the DFE control may be handled outside of the PE
 */
class MultAccEngineCtrlIO() extends DFEPassthroughIO {
  val resetCounter = Flipped(Decoupled(UInt(32.W)))
  val idle = Output(Bool())
}

class FloatUtil {
  def floatExp(width: Int) : Int = {
    return if(width == 32) { 8 } else { 11 }
  }
  def floatMantissa(width: Int) : Int = {
    return if(width == 32) { 24 } else { 53 }
  }
}
