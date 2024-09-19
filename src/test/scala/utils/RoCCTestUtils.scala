package utils
import scala.io.Source
import scala.reflect.ClassTag
import chisel3.util.log2Floor
import chisel3.util.log2Ceil
import chisel3._
import chiseltest._
import controller._
import template._

class RoCCTestUtils(val debug_mode: Boolean = false) {
    object RoCCOpcode extends Enumeration {
        val CUSTOM_0 = Value(11)
        val CUSTOM_1 = Value(43)
        val CUSTOM_2 = Value(91)
        val CUSTOM_3 = Value(123)
    }

    class RoccInstrTest(
        val cmd_rdy : Boolean,
        val cmd_valid : Boolean,
        val cmd_inst_funct : Int,
        val cmd_inst_rs2 : Int,
        val cmd_inst_rs1 : Int,
        val cmd_inst_xd : Boolean,
        val cmd_inst_xs1 : Boolean,
        val cmd_inst_xs2 : Boolean,
        val cmd_inst_rd : Int,
        val cmd_inst_opcode: Int,
        val cmd_rs1 : BigInt,
        val cmd_rs2 : BigInt,
        val resp_data : BigInt,
        val resp_rdy : Boolean,
        val resp_valid : Boolean,
        val busy : Boolean,
        val interrupt : Boolean
    ) {

        def poke_rocc_inst(inst: RoccInstrTest, c: RoCCControllerIO) {
            c.rocc_cmd.cmd_valid.poke(inst.cmd_valid)
            c.rocc_cmd.cmd_inst.funct.poke(inst.cmd_inst_funct)
            c.rocc_cmd.cmd_inst.rs2.poke(inst.cmd_inst_rs2)
            c.rocc_cmd.cmd_inst.rs1.poke(inst.cmd_inst_rs1)
            c.rocc_cmd.cmd_inst.xd.poke(inst.cmd_inst_xd)
            c.rocc_cmd.cmd_inst.xs1.poke(inst.cmd_inst_xs1)
            c.rocc_cmd.cmd_inst.xs2.poke(inst.cmd_inst_xs2)
            c.rocc_cmd.cmd_inst.rd.poke(inst.cmd_inst_rd)
            c.rocc_cmd.cmd_inst.opcode.poke(inst.cmd_inst_opcode)
            c.rocc_cmd.cmd_rs1.poke(inst.cmd_rs1)
            c.rocc_cmd.cmd_rs2.poke(inst.cmd_rs2)
            c.rocc_cmd.resp_rdy.poke(inst.resp_rdy)
        }
    }

    def pokeInterfaceReset(c: RoCCControllerIO) {
        var void_inst = new RoccInstrTest(
            false, 
            false,
            0,
            0,
            0,
            false,
            false,
            false,
            0,
            0,
            0,
            0,
            0,
            false, // resp rdy 
            false,
            false,
            false
        )          
        void_inst.poke_rocc_inst(void_inst, c) 
    }
}