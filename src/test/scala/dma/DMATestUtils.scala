package dma

import scala.io.Source
import scala.reflect.ClassTag
import chisel3.util.log2Floor
import chisel3.util.log2Ceil
import chisel3._
import chiseltest._
import controller._
import utils._

class DMATestUtils(debug_mode: Boolean) extends RoCCTestUtils(debug_mode) {

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
            RoCCOpcode.CUSTOM_1.id,
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
    def pokeDMAReadCommand(bytesLog2: Int, address: Int, c: RoCCControllerIO, mem_id : Int = 0) {

        var read_inst = new RoccInstrTest(
            true, 
            true,
            mem_id,
            0,
            1,
            true,
            true,
            true,
            2,
            RoCCOpcode.CUSTOM_0.id,
            address,
            bytesLog2,
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
}