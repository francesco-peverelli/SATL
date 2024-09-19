package YoseUe_SATL

import chisel3._
import chisel3.util._
import chisel3.experimental._

class Sample(n_attr: Int, n_classes: Int, n_depths: Int, info_bit: Int, tree_bit: Int) extends Bundle{
    val features = Vec(n_attr, FixedPoint(32.W,16.BP))
    val offset = UInt(info_bit.W)
    val shift = Bool()
    val search_for_root = Bool()
    val tree_to_exec = UInt(tree_bit.W)
    val scores = Vec(n_classes,FixedPoint(32.W,16.BP))
    val weights = Vec(n_depths, FixedPoint(32.W,16.BP))
    val dest = Bool()
    val last = Bool()
    val clock_cycles = UInt(32.W)
}

class NOInst(attr_bit: Int, info_bit: Int) extends Bundle{
    val threshold = FixedPoint(16.W,8.BP)
    val nodeRA = UInt(12.W)
    val attr_id = UInt(attr_bit.W)
    val leftChildInfo = UInt(info_bit.W)
    val rightChildInfo = UInt(info_bit.W)
    val leftChildType = Bool()
    val rightChildType = Bool()
    val is_valid = Bool()
    val depth_indicator = UInt(3.W)
}

class AxiSample(n_attr: Int, n_classes: Int, n_depths: Int, rounded_info_bit: Int, rounded_tree_bit: Int, compensation: Int) extends Bundle{
    val TDATA = Input(UInt(((n_attr+n_depths+n_classes)*32+24+rounded_info_bit+rounded_tree_bit+compensation).W))
    val TLAST = Input(Bool())
    val TREADY = Output(Bool())
    val TVALID = Input(Bool())
}