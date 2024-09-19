package pe

import chisel3._
import chisel3.util._

/** Represents the ID of a PE/ME in the spatial template. It allows up to three
  * logical dimensions
  *
  * @param dim
  *   number of used dimension for this ID
  */
class ElemId(val dim: Int, val x: Int, val y: Int, val z: Int) {
  def printID() {
    print("D=" + dim + ", x=" + x + ", y=" + y + ", z=" + z + "\n")
  }
  def canEqual(a: Any) = a.isInstanceOf[ElemId]

  override def equals(o: Any): Boolean = {
    o match {
      case o: ElemId => {
        o.canEqual(this) &&
        (o.dim == dim) && (o.x == x) && (o.y == y) && (o.z == z)
      }
      case _ => false
    }
  }
}

/** This abstract class represents a Processing Element for a generic spatial
  * template
  */
abstract class PE(val id: ElemId) extends Module

trait WithBCastConnection {

  def linkToDest(d: PE, i: Int) {
    println("WARNING: Abstract connection method called")
  }

}
trait WithFWConnection {

  def linkToDest(d: PE) {
    println("WARNING: Abstract connection method called")
  }

}

/**
 * Legacy PE interfaces 
 */
class PEBidirectionalLiteInterface(val lite_data_width: Int, val lite_addr_bits: Int) extends Bundle {
    val ch_out = Decoupled(new Bundle{
        val data = Bits(lite_data_width.W)
        val addr = Bits(lite_addr_bits.W)
    })
    val ch_in = Flipped(Decoupled(new Bundle{
        val data = Bits(lite_data_width.W)
        val addr = Bits(lite_addr_bits.W)
    }))
}

/**
  * Defines a generic communication interface between two Processing Elements in a spatial template
  * 
  */
trait LitePEInterfaces {
    val lite_interfaces: Seq[PEBidirectionalLiteInterface]
}