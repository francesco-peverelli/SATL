package me

import chisel3._
import chisel3.util._
import mi._
import pe._

/** Generic memory element. Extend this class to instantiate memories with more
  * specific characteristics
  *
  * @param id
  *   the identifier for this element in the spatial template. ME ids are
  *   independent and may overlap with PE ids. The programmer is expected to
  *   handle them separately.
  */
abstract class ME(val id: ElemId) extends Module

class BRAMLikeIO(val port_width: Int, val addr_width: Int) extends Bundle {
  val enable_1 = Input(Bool())
  val write_1 = Input(Bool())
  val addr_1 = Input(UInt(addr_width.W))
  val dataIn_1 = Input(UInt(port_width.W))
  val dataOut_1 = Output(UInt(port_width.W))
  val enable_2 = Input(Bool())
  val write_2 = Input(Bool())
  val addr_2 = Input(UInt(addr_width.W))
  val dataIn_2 = Input(UInt(port_width.W))
  val dataOut_2 = Output(UInt(port_width.W))
}

class BRAMLikeVivadoIO(val port_width: Int, val addr_width: Int, val synthesis: Boolean) extends Bundle{
  val bram_addr_a = Input(UInt(addr_width.W))
  val bram_clk_a = if(synthesis) Input(Clock()) else Input(Bool())
  val bram_wrdata_a = Input(UInt(port_width.W))
  val bram_rddata_a = Output(UInt(port_width.W))
  val bram_en_a = Input(Bool())
  val bram_rst_a = Input(Bool())
  val bram_we_a = Input(UInt((port_width/8).toInt.W))
}

trait WithBRAMLikeLink {
  def connect(in: BRAMLikeIO, port_self: Int, port_other: Int){
    print("WARNING: Calling abstract method for connecting ME")
  }
}
trait WithVivadoBRAMLink {
  def connect(in: BRAMLikeVivadoIO, port_self: Int){
    print("WARNING: Calling abstract method for connecting ME")
  }
}

/** This class implements a dual-port 36-bit wide memory with two read and two
  * write ports. The capacity is 1024 * 36 bit entries. This memory is meant to
  * resemble an FPGA Block RAM element
  */
class BRAMLikeMem(id: ElemId, width: Int = 36, addr_width: Int = 10)
    extends ME(id) 
    with WithBRAMLikeLink
    with WithVivadoBRAMLink {

  val io = IO(new BRAMLikeIO(width, addr_width))

  val entries: Int = scala.math.pow(2, addr_width).toInt

  override def connect(in: BRAMLikeIO, port_self: Int, port_other: Int) {
      val self_enable = if(port_self==0) io.enable_1 else io.enable_2  
      val self_write = if(port_self==0) io.write_1 else io.write_2  
      val self_addr_1 = if(port_self==0) io.addr_1 else io.addr_2  
      val self_dataIn = if(port_self==0) io.dataIn_1 else io.dataIn_2  
      val self_dataOut = if(port_self==0) io.dataOut_1 else io.dataOut_2 

      val other_enable = if(port_other==0) in.enable_1 else in.enable_2  
      val other_write = if(port_other==0) in.write_1 else in.write_2  
      val other_addr_1 = if(port_other==0) in.addr_1 else in.addr_2  
      val other_dataIn = if(port_other==0) in.dataIn_1 else in.dataIn_2  
      val other_dataOut = if(port_other==0) in.dataOut_1 else in.dataOut_2  

      self_enable := other_enable
      self_write := other_write
      self_addr_1 := other_addr_1
      self_dataIn := other_dataIn
      other_dataOut := self_dataOut      
  }

  override def connect(in: BRAMLikeVivadoIO, port_self: Int) {
      val self_enable = if(port_self==0) io.enable_1 else io.enable_2  
      val self_write = if(port_self==0) io.write_1 else io.write_2  
      val self_addr_1 = if(port_self==0) io.addr_1 else io.addr_2  
      val self_dataIn = if(port_self==0) io.dataIn_1 else io.dataIn_2  
      val self_dataOut = if(port_self==0) io.dataOut_1 else io.dataOut_2 

      val other_enable = in.bram_en_a  
      val other_write = in.bram_we_a(0)  
      val other_addr_1 = in.bram_addr_a  
      val other_dataIn = in.bram_wrdata_a  
      val other_dataOut = in.bram_rddata_a 

      self_enable := other_enable
      self_write := other_write
      self_addr_1 := other_addr_1
      self_dataIn := other_dataIn
      other_dataOut := self_dataOut      
  }
}

/** This class implements a dual-port 36-bit wide memory with two read and two
  * write ports. The capacity is 1024 * 36 bit entries. This memory is meant to
  * resemble an FPGA Block RAM element
  */
class BRAMLikeMem1(id: ElemId, width: Int = 36, addr_width: Int = 10)
    extends BRAMLikeMem(id, width, addr_width) {

  val mem = SyncReadMem(entries, UInt(width.W))
  // Create the first write port and one read port
  when(io.write_1) { mem.write(io.addr_1, io.dataIn_1) }
  io.dataOut_1 := mem.read(io.addr_1, io.enable_1)
  // Create the second write port and one read port
  when(io.write_2) { mem.write(io.addr_2, io.dataIn_2) }
  io.dataOut_2 := mem.read(io.addr_2, io.enable_2)

  assert((io.addr_1 < entries.U) && (io.addr_2 < entries.U))
}

class BRAMBlackBox(width: Int = 36, addr_width: Int = 10) 
  extends BlackBox(Map("DATA" -> width, "ADDR" -> addr_width)) with HasBlackBoxInline {
    val io = IO(new Bundle{
      val clk = Input(Clock())
      // Port A
      val a_en = Input(Bool())
      val a_wr = Input(Bool())
      val a_addr = Input(UInt(addr_width.W))
      val a_din = Input(UInt(width.W))
      val a_dout = Output(UInt(width.W))
      // Port B
      val b_en = Input(Bool())
      val b_wr = Input(Bool())
      val b_addr = Input(UInt(addr_width.W))
      val b_din = Input(UInt(width.W))
      val b_dout = Output(UInt(width.W))

      setInline("BRAMBlackBox.v",
      """module BRAMBlackBox #(
      |    parameter DATA = 36,
      |    parameter ADDR = 10
      |) (
      |    input   wire               clk,
      |    // Port A
      |    input   wire                a_en,
      |    input   wire                a_wr,
      |    input   wire    [ADDR-1:0]  a_addr,
      |    input   wire    [DATA-1:0]  a_din,
      |    output  reg     [DATA-1:0]  a_dout,
      |    // Port B
      |    input   wire                b_en,
      |    input   wire                b_wr,
      |    input   wire    [ADDR-1:0]  b_addr,
      |    input   wire    [DATA-1:0]  b_din,
      |    output  reg     [DATA-1:0]  b_dout
      |);
      |// Shared memory
      |reg [DATA-1:0] mem [(2**ADDR)-1:0];
      |// Port A
      |always @(posedge clk) begin
      |    a_dout      <= mem[a_addr];
      |    if(a_wr & a_en) begin
      |        a_dout      <= a_din;
      |        mem[a_addr] <= a_din;
      |    end
      |end
      |// Port B
      |always @(posedge clk) begin
      |    b_dout      <= mem[b_addr];
      |    if(b_wr & b_en) begin
      |        b_dout      <= b_din;
      |        mem[b_addr] <= b_din;
      |    end
      |end
      |endmodule
      """.stripMargin)
    })

}

class BRAMBlackBoxAsymm(width_a: Int, width_b: Int, addr_width: Int) extends Module {
    val io = IO(new Bundle{
      val clk = Input(Clock())
      // Port A
      val a_en = Input(Bool())
      val a_wr = Input(Bool())
      val a_addr = Input(UInt(addr_width.W))
      val a_din = Input(UInt(width_a.W))
      val a_dout = Output(UInt(width_a.W))
      // Port B
      val b_en = Input(Bool())
      val b_wr = Input(Bool())
      val b_addr = Input(UInt((addr_width-2).W))
      val b_din = Input(UInt(width_b.W))
      val b_dout = Output(UInt(width_b.W))
    })
    assert(width_a == (width_b/2))

    val bram_1 = Module(new BRAMBlackBoxSingle(width_a,addr_width-2))

    bram_1.io.a_wr := Mux(io.a_en, io.a_wr, io.b_wr)
    bram_1.io.a_addr := Mux(io.a_en, (io.a_addr >> 2), (io.b_addr << 1)) 
    bram_1.io.a_din := Mux(io.a_en, io.a_din, io.b_din(width_a-1,0))
    io.b_dout := Cat(bram_1.io.b_dout, bram_1.io.a_dout)
    bram_1.io.b_wr := Mux(io.a_en, false.B, io.b_wr)
    bram_1.io.b_addr := (io.b_addr << 1) + 1.U
    bram_1.io.b_din := io.b_din(width_b-1,width_a)
    io.a_dout := bram_1.io.a_dout
    bram_1.io.clk := io.clk

}

class BRAMBlackBoxSingle(width: Int = 36, addr_width: Int = 10) 
  extends BlackBox(Map("DATA" -> width, "ADDR" -> addr_width)) with HasBlackBoxInline {
    val io = IO(new Bundle{
      val clk = Input(Clock())
      // Port A
      val a_wr = Input(Bool())
      val a_addr = Input(UInt(addr_width.W))
      val a_din = Input(UInt(width.W))
      val a_dout = Output(UInt(width.W))
      // Port B
      val b_wr = Input(Bool())
      val b_addr = Input(UInt(addr_width.W))
      val b_din = Input(UInt(width.W))
      val b_dout = Output(UInt(width.W))
      //(* DONT_TOUCH = "yes" *)
      setInline("BRAMBlackBox.v",
      """
      module BRAMBlackBoxSingle #(
      |    parameter DATA = 32,
      |    parameter ADDR = 10
      |) (
      |    input   wire               clk,
      |    // Port A
      |    input   wire                a_wr,
      |    input   wire    [ADDR-1:0]  a_addr,
      |    input   wire    [DATA-1:0]  a_din,
      |    output  reg     [DATA-1:0]  a_dout,
      |    // Port B
      |    input   wire                b_wr,
      |    input   wire    [ADDR-1:0]  b_addr,
      |    input   wire    [DATA-1:0]  b_din,
      |    output  reg     [DATA-1:0]  b_dout
      |);
      |// Shared memory
      |reg [DATA-1:0] mem [(2**ADDR)-1:0];
      |// Port A
      |always @(posedge clk) begin
      |    a_dout      <= mem[a_addr];
      |    if(a_wr) begin
      |        a_dout      <= a_din;
      |        mem[a_addr] <= a_din;
      |    end
      |end
      |// Port B
      |always @(posedge clk) begin
      |    b_dout      <= mem[b_addr];
      |    if(b_wr) begin
      |        b_dout      <= b_din;
      |        mem[b_addr] <= b_din;
      |    end
      |end
      |endmodule
      """.stripMargin)
    })

}

class BRAMLikeMem2(id: ElemId, width: Int = 36, addr_width: Int = 10)
    extends BRAMLikeMem(id, width, addr_width) {

    val bramBB = Module(new BRAMBlackBox(width, addr_width))
    bramBB.io.a_en := io.enable_1
    bramBB.io.a_addr := io.addr_1
    bramBB.io.a_din := io.dataIn_1
    bramBB.io.a_wr := io.write_1
    io.dataOut_1 := bramBB.io.a_dout
    bramBB.io.b_en := io.enable_2
    bramBB.io.b_addr := io.addr_2
    bramBB.io.b_din := io.dataIn_2
    bramBB.io.b_wr := io.write_2
    io.dataOut_2 := bramBB.io.b_dout
}

class BRAMLikeMem2s(id: ElemId, width: Int = 36, addr_width: Int = 10)
    extends BRAMLikeMem(id, width, addr_width) {

    val bramBB = Module(new BRAMBlackBoxSingle(width, addr_width))
    bramBB.io.a_addr := io.addr_1
    bramBB.io.a_din := io.dataIn_1
    bramBB.io.a_wr := io.write_1
    io.dataOut_1 := bramBB.io.a_dout
    bramBB.io.b_addr := io.addr_2
    bramBB.io.b_din := io.dataIn_2
    bramBB.io.b_wr := io.write_2
    io.dataOut_2 := bramBB.io.b_dout
}