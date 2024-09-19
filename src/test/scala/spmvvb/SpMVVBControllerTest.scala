package spatial_templates

import chisel3._
import chiseltest._
import chisel3.util._
import org.scalatest.flatspec.AnyFlatSpec
import spmvvb._

class SpMVVBControllerTest extends AnyFlatSpec with ChiselScalatestTester {
    
    "DUT" should "be configured" in {
        val n_pe_test = 2
        test(new SpMVVBController(10, 32, n_pe_test)) {
            c => 
            c.mem_io.local_req.map(_.ready.poke(true))
            c.mem_io.v_req.ready.poke(true)
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
                c.clock.step()
            }
            for(i <- 0 until n_pe_test){
                assert(c.pe_regs(i).in_A.peekInt() == 125 * (i+1))
                assert(c.pe_regs(i).in_col_idx.peekInt() == 125 * (i+1) + 1)
                assert(c.pe_regs(i).in_x_addr.peekInt() == 125 * (i+1) + 2)
                assert(c.pe_regs(i).in_row_ptr.peekInt() == 125 * (i+1) + 3)
                assert(c.pe_regs(i).in_nrows.peekInt() == 125 * (i+1) + 4)
                assert(c.pe_regs(i).in_xlen_pow2.peekInt() == 125 * (i+1) + 5)
                assert(c.pe_regs(i).in_y_addr.peekInt() == 125 * (i+1) + 6)
                assert(c.pe_regs(i).in_row_start.peekInt() == 125 * (i+1) + 7)
                
            }
        }
    }
    "DUT" should "toggle execution" in {
        test(new SpMVVBController(10, 32, 2)) {
            c => 
            c.mem_io.local_req.map(_.ready.poke(true))
            c.mem_io.v_req.ready.poke(true)
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
            c.clock.step()

            assert(c.pe_regs(0).reset_setup.peekBoolean() == true)

            c.clock.step()
            c.clock.step()
        }
    }
    "DUT" should " write and read" in {
        test(new SpMVVBController(10, 32, 2)) {
            c => 
            c.mem_io.local_req.map(_.ready.poke(true))
            c.mem_io.v_req.ready.poke(true)
            // Set mem interface to ready
            c.mem_io.local_req(0).ready.poke(true)
            //  |lmem_id| addr| val | 1  | 1   |  1   |ack_reg| CUSTOM_1 |
            //  | FUNCT | RS2 | RS1 | XD | XS1 |  XS2 |  RD   | OPCODE  |
            var write_inst = new RoccInstrTest(
                true, 
                true,
                1,
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

            c.clock.step()
            
            // One cycle delay in requests for this controller
            assert(c.mem_io.local_req(0).valid.peekBoolean() == true)
            assert(c.mem_io.local_req(0).bits.addr.peekInt() == 11)
            assert(c.mem_io.local_req(0).bits.dataIn.peekInt() == 125)
            assert(c.mem_io.local_req(0).bits.write.peekBoolean == true)

            c.clock.step()

            //  |lmem_id| addr| -   | 1  | 1   |  0   |  res  | CUSTOM_2 |
            //  | FUNCT | RS2 | RS1 | XD | XS1 |  XS2 |  RD   | OPCODE  |
            var read_inst = new RoccInstrTest(
                true, 
                true,
                1,
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

            void_inst.poke_rocc_inst(void_inst, c.io) 

            c.clock.step()

            assert(c.mem_io.local_req(0).valid.peekBoolean() == true)
            assert(c.mem_io.local_req(0).bits.addr.peekInt() == 11)
            assert(c.mem_io.local_req(0).bits.write.peekBoolean == false)

            c.clock.step()

            c.mem_io.local_resp(0).valid.poke(true)
            c.mem_io.local_resp(0).bits.poke(125)
            
            c.clock.step()

            assert(c.mem_io.local_resp(0).ready.peekBoolean() == true)
        }
    }
}
