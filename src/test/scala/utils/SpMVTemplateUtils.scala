package utils
import scala.io.Source
import scala.reflect.ClassTag
import chisel3.util.log2Floor
import chisel3.util.log2Ceil
import chisel3._
import chiseltest._
import controller._

class SpMVTemplateUtils(debug_mode: Boolean = false) {
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

    def pokeWriteCommand(address: Int, value: BigInt, c: RoCCControllerIO, mem_id: Int = 0) {

        var write_inst = new RoccInstrTest(
            true, 
            true,
            mem_id, //funct
            0, //rs2
            1, //rs1
            true,
            true,
            true,
            2, //rd
            SpMVOpcode.WMEM32_1.id,
            address,
            value,
            0, //rd_data
            true, //rdy
            true, //valid
            true, //busy
            false //interrupt
        )
        write_inst.poke_rocc_inst(write_inst, c)
    }

    def write_chunk[T](in_buffer: Array[T], src_addr: Int, dest_addr: Int, num_elements: Int, 
        ctrl_io: RoCCControllerIO, dut: Module, my_cast: T => Int = (i:Int) => i, mem_id : Int = 0) {

        if(debug_mode){
            print("writing chunk of " + num_elements + " elements...\n")
        } 
        var resp_ack = num_elements
        for(i <- 0 until num_elements){
            val dataAsInt = my_cast(in_buffer(src_addr+i))
            val bit0 = dataAsInt & 0x1
            val data_unsigned = (BigInt((dataAsInt >> 1) & 0x7FFFFFFF) << 1) + BigInt(bit0)

            pokeWriteCommand(dest_addr+i, data_unsigned, ctrl_io, mem_id)

            if(debug_mode){
                print("writing @[" + (dest_addr+i) + "] <- " + data_unsigned + "(" + in_buffer(src_addr+i) + ")@[" + (src_addr+i) + "]\n")
            }
            dut.clock.step()
            pokeInterfaceReset(ctrl_io)
            var cc = 0
            while(!ctrl_io.rocc_cmd.resp_valid.peekBoolean()){
                //print("Waiting for response\n")
                dut.clock.step()
                cc += 1
                if(cc > 1000)
                    assert(false)
            }
            if(ctrl_io.rocc_cmd.resp_valid.peekBoolean()){
                dut.clock.step()
                dut.clock.step()
                dut.clock.step()
                dut.clock.step()
                resp_ack -= 1
                ctrl_io.rocc_cmd.resp_rdy.poke(true)
                if(debug_mode){
                    print("Dequeue response: " + ctrl_io.rocc_cmd.resp_data.peekInt() + ", ack=" + resp_ack + "\n")
                }
                dut.clock.step()
            }
        }
        pokeInterfaceReset(ctrl_io)
        
        while(resp_ack > 0) {
            dut.clock.step()
            if(ctrl_io.rocc_cmd.resp_valid.peekBoolean()){
                resp_ack -= 1
                if(debug_mode){
                    print("Dequeue response: " + ctrl_io.rocc_cmd.resp_data.peekInt() + ", ack=" + resp_ack + "\n")
                }
            }
        }
        dut.clock.step()
         var cc = 0
        while(ctrl_io.rocc_cmd.resp_valid.peekBoolean()){
            //print("Trailing valid response... " + ctrl_io.rocc_cmd.resp_data.peekInt() + ", ack=" + resp_ack + "\n")
                if(cc > 1000)
                    assert(false)
            dut.clock.step()
        }

    }

    def pokeReadCommand(address: Int, c: RoCCControllerIO, mem_id : Int = 0) {

        var read_inst = new RoccInstrTest(
            true, 
            true,
            mem_id,
            0,
            1,
            true,
            true,
            false,
            2,
            SpMVOpcode.RMEM32_1.id,
            address,
            0,
            0,
            true,
            true,
            true,
            false
        )     
        read_inst.poke_rocc_inst(read_inst, c)
    }

    def read_chunk(in_buffer: Array[Int], src_addr: Int, dest_addr: Int, num_elements: Int,
        ctrl_io: RoCCControllerIO, dut: Module, my_cast: Int => Int = (i:Int) => i, mem_id : Int = 0) {

        if(debug_mode){
            print("reading chunk of " + num_elements + " elements...\n")
        }
        var to_read = num_elements
        for(i <- 0 until num_elements){
            pokeReadCommand(src_addr+i, ctrl_io, mem_id)
            dut.clock.step()
            pokeInterfaceReset(ctrl_io)
            var cc = 0
            while(!ctrl_io.rocc_cmd.resp_valid.peekBoolean()){
                //print("Waiting for response\n")
                dut.clock.step()
                cc += 1
                if(cc > 1000)
                    assert(false)
            }
            if(debug_mode){
                print("Request @[" + (src_addr+i) + "]\n")
            }

            if((to_read > 0) && (ctrl_io.rocc_cmd.resp_valid.peekBoolean())) {
                in_buffer(dest_addr+(num_elements-to_read)) = ctrl_io.rocc_cmd.resp_data.peekInt().toInt
                if(debug_mode){
                    print("Resp: " + in_buffer(dest_addr+(num_elements-to_read)) + " -> @[" + dest_addr+(num_elements-to_read) + "], to read: " + to_read + "\n")
                }
                to_read -= 1
            } else {
                if(debug_mode){
                    print("No valid read data...(" + ctrl_io.rocc_cmd.resp_data.peekInt().toInt + ")\n")
                }
            }
        }

        pokeInterfaceReset(ctrl_io)
        dut.clock.step()

        while(to_read > 0) {
            if(ctrl_io.rocc_cmd.resp_valid.peekBoolean()){
                in_buffer(dest_addr+(num_elements-to_read)) = ctrl_io.rocc_cmd.resp_data.peekInt().toInt
                if(debug_mode){
                    print("Resp: " + in_buffer(dest_addr+(num_elements-to_read)) + " -> @[" + dest_addr+(num_elements-to_read) + "], to read: " + to_read + "\n")
                }
                to_read -= 1
            }
            dut.clock.step()
        }
    }

    def pokeSetRegCommand(reg_address: Int, reg_value: Int, pe_id: Int, c: RoCCControllerIO) {
        var set_reg_inst = new RoccInstrTest(
            true, 
            true,
            reg_address,
            1, //RS2
            1, //RS1
            true,
            true,
            true,
            2,
            SpMVOpcode.WCREG.id,
            reg_value,
            pe_id, // pe ID
            0,
            true,
            true,
            true,
            false
        )
        set_reg_inst.poke_rocc_inst(set_reg_inst, c)
    }

    def writeSpMVReg(reg_address: Int, reg_value: Int, pe_id: Int, c: RoCCControllerIO, dut: Module) {
        pokeSetRegCommand(reg_address, reg_value, pe_id, c)
        dut.clock.step()
        var cc = 0
        while(!c.rocc_cmd.resp_valid.peekBoolean()){
            pokeInterfaceReset(c)
            //print("Waiting for response\n")
            dut.clock.step()
            cc += 1
            if(cc > 1000)
                assert(false)
        }
    }

    def pokeExecCommand(c: RoCCControllerIO) {
        var exec_inst = new RoccInstrTest(
            true, 
            true,
            0,
            0,
            1,
            true,
            true,
            true,
            2,
            SpMVOpcode.EXEC.id,
            0,
            0,
            0,
            true,
            true,
            true,
            false
        )
        exec_inst.poke_rocc_inst(exec_inst, c)
    }


    def buffer_cmp[T,K](buff_1: Array[T], buff_2: Array[K], num_elements: Int, start_1: Int = 0, start_2: Int = 0, my_cast: T => K = (i:T) => i.asInstanceOf[K]) : Boolean = {
        var all_ok = true
        for(i <- 0 until num_elements) {
            if(debug_mode){
                print("Comparing buff_1[" + (start_1+i) + "] (" + my_cast((buff_1(start_1+i))) + ") to buff_2[" + (start_2+i) + "](" + buff_2(start_2+i) + ")\n")
            }
            if(my_cast(buff_1(start_1+i)) != buff_2(start_2+i)){
                all_ok = false
                if(debug_mode){
                    print("!! Do NOT match!!\n")
                }
            }
        }
        return all_ok
    }
}
