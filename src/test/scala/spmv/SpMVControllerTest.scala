package spatial_templates

import chisel3._
import chiseltest._
import chisel3.util._
import org.scalatest.flatspec.AnyFlatSpec
import controller._
import spmv._

object SpMVOpcode extends Enumeration {
  val WCREG = Value(11)
  val WMEM32_1 = Value(43)
  val RMEM32_1 = Value(91)
  val EXEC = Value(123)
}

object CRAddress extends Enumeration {
  val A_ADDR_REG = Value(0)
  val COL_ADDR_REG = Value(1)
  val X_ADDR_REG = Value(2)
  val ROW_ADDR_REG = Value(3)
  val N_ROWS_REG = Value(4)
  val X_LEN_REG = Value(5)
  val Y_ADDR_REG = Value(6)
  val ROW_START_REG = Value(7)
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
        val cmd_rs1 : Int,
        val cmd_rs2 : Int,
        val resp_data : Int,
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

class SpMVControllerTest extends AnyFlatSpec with ChiselScalatestTester {
    
    "DUT" should "be configured" in {
        val n_pe_test = 2
        test(new SpMVController(10, 32, n_pe_test)) {
            c => 
            if(c.io.rocc_cmd.cmd_rdy.peekBoolean()) {
                // |cr_addr| val |  -  | 1  | 1   |  0   |ack_reg| CUSTOM_0 |
                val addresses = Seq(
                    CRAddress.A_ADDR_REG.id,
                    CRAddress.COL_ADDR_REG.id,
                    CRAddress.X_ADDR_REG.id,
                    CRAddress.ROW_ADDR_REG.id,
                    CRAddress.N_ROWS_REG.id,
                    CRAddress.X_LEN_REG.id,
                    CRAddress.Y_ADDR_REG.id,
                    CRAddress.ROW_START_REG.id
                )
                for(pe_id <- 0 until n_pe_test){
                    for(reg_id <- 0 until 8){
                        var set_reg_inst = new RoccInstrTest(
                            true, 
                            true,
                            addresses(reg_id),
                            1, //RS2
                            1, //RS1
                            true,
                            true,
                            true,
                            2,
                            SpMVOpcode.WCREG.id,
                            125 * (pe_id+1) + reg_id,
                            pe_id, // pe ID
                            0,
                            true,
                            true,
                            true,
                            true
                        )

                        set_reg_inst.poke_rocc_inst(set_reg_inst, c.io)
                        c.clock.step()
                    }
                }
                c.clock.step()
            }
            for(i <- 0 until n_pe_test){
                assert(c.pe_regs(i).in_A.peekInt() == 125 * (i+1))
                assert(c.pe_regs(i).in_col_idx.peekInt() == 125 * (i+1) + 1)
                assert(c.pe_regs(i).in_row_ptr.peekInt() == 125 * (i+1) + 2)
                assert(c.pe_regs(i).in_x_addr.peekInt() == 125 * (i+1) + 3)
                assert(c.pe_regs(i).in_y_addr.peekInt() == 125 * (i+1) + 4)
                assert(c.pe_regs(i).in_nrows.peekInt() == 125 * (i+1) + 5)
                assert(c.pe_regs(i).in_row_start.peekInt() == 125 * (i+1) + 6)
                assert(c.pe_regs(i).in_xlen_pow2.peekInt() == 125 * (i+1) + 7)
            }
        }
    }
    "DUT" should "toggle execution" in {
        test(new SpMVController(10, 32, 2)) {
            c => 
            // |   -   |  -  | -   | 1  | 0   |  0   |ack_reg| CUSTOM_3 |
            var exec_inst = new RoccInstrTest(
                true, 
                true,
                0,
                0,
                1,
                true,
                false,
                false,
                2,
                SpMVOpcode.EXEC.id,
                0,
                0,
                0,
                true,
                true,
                true,
                true
            )
            exec_inst.poke_rocc_inst(exec_inst, c.io)

            c.clock.step()

            var void_inst = new RoccInstrTest(
                true, 
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
                true,
                false,
                false,
                false
            )          
            void_inst.poke_rocc_inst(void_inst, c.io)  

            assert(c.pe_regs(0).reset_setup.peekBoolean() == false)

            c.clock.step()

            assert(c.pe_regs(0).reset_setup.peekBoolean() == true)

            c.clock.step()
            c.clock.step()
        }
    }
    "DUT" should " write and read" in {
        test(new SpMVController(10, 32, 1)) {
            c => 

            // Set mem interface to ready
            c.mem_io.request.ready.poke(true)
            //  |lmem_id| addr| val | 1  | 1   |  1   |ack_reg| CUSTOM_1 |
            //  | FUNCT | RS2 | RS1 | XD | XS1 |  XS2 |  RD   | OPCODE  |
            var write_inst = new RoccInstrTest(
                true, 
                true,
                0,
                0,
                1,
                true,
                true,
                true,
                2,
                SpMVOpcode.WMEM32_1.id,
                11,
                125,
                0,
                true,
                true,
                true,
                true
            )
            write_inst.poke_rocc_inst(write_inst, c.io)
            c.clock.step()

            var void_inst = new RoccInstrTest(
                true, 
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
                true,
                false,
                false,
                false
            )          
            void_inst.poke_rocc_inst(void_inst, c.io) 

            assert(c.mem_io.request.valid.peekBoolean() == true)
            assert(c.mem_io.request.bits.addr.peekInt() == 11)
            assert(c.mem_io.request.bits.dataIn.peekInt() == 125)
            assert(c.mem_io.request.bits.write.peekBoolean == true)

            c.clock.step()

            c.clock.step()

            //  |lmem_id| addr| -   | 1  | 1   |  0   |  res  | CUSTOM_2 |
            //  | FUNCT | RS2 | RS1 | XD | XS1 |  XS2 |  RD   | OPCODE  |
            var read_inst = new RoccInstrTest(
                true, 
                true,
                0,
                0,
                1,
                true,
                true,
                false,
                2,
                SpMVOpcode.RMEM32_1.id,
                11,
                0,
                0,
                true,
                true,
                true,
                true
            )     
            read_inst.poke_rocc_inst(read_inst, c.io)
        
            c.clock.step()

            assert(c.mem_io.request.valid.peekBoolean() == true)
            assert(c.mem_io.request.bits.addr.peekInt() == 11)
            assert(c.mem_io.request.bits.write.peekBoolean == false)

            void_inst.poke_rocc_inst(void_inst, c.io) 

            c.mem_io.response.valid.poke(true)
            c.mem_io.response.bits.poke(125)

            c.clock.step()

            assert(c.mem_io.response.ready.peekBoolean() == true)
            
            c.clock.step()
        }
    }
}
