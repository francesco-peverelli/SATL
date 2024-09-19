package utils

import chisel3._
import chiseltest._
import chisel3.util._
import org.scalatest.flatspec.AnyFlatSpec
import me._
import mi._

class MemTestUtils(val addr_space: Int) {
  val debug_transfer = false
  def write_mem_interface[T](m_interface : DecoupledIO[MemRequestIO], data: Array[T], base_addr : Int, dut : Module, 
    my_cast: T => Int = (i:Int) => i, data_to_write : Int = -1, write_offset : Int = 0) {
    
    var data_size = 0
    if(data_to_write == -1) {
      data_size = data.size
    } else {
      data_size = data_to_write
    }
    
    print("Sending data write request for " + data_size + " data, offset= " + write_offset + "from address " + base_addr + "...\n")
    for(i <- 0 until data_size) {
      val dataAsInt = my_cast(data(write_offset+i))
      val bit0 = dataAsInt & 0x1
      val data_unsigned = (BigInt((dataAsInt >> 1) & 0x7FFFFFFF) << 1) + BigInt(bit0) 
        if(debug_transfer)
          print("d@" + (base_addr + i) + "=" + data(write_offset+i) + "/" + data_unsigned + "/" + my_cast(data(write_offset+i)) + ", data_idx=" + (write_offset+i) + "\n")
        m_interface.bits.write.poke(true)
        m_interface.bits.addr.poke(base_addr + i)
        m_interface.bits.dataIn.poke(data_unsigned)
        m_interface.valid.poke(true)
        dut.clock.step()
    }
    m_interface.valid.poke(false)
  }

  def read_mem_interface(m_req_interface : DecoupledIO[MemRequestIO], m_resp_interface : ValidIO[UInt], 
    data_to_read : Int, base_addr : Int, dut : Module) : Array[Int] = {

        print("Sending data read request for " + data_to_read + " data from address " + base_addr + "...\n")
        var read_data = new Array[Int](data_to_read)
        var i = 0
        var j = 0
        while(j < data_to_read) {
            if(m_req_interface.ready.peekBoolean() && (i < data_to_read)) {
                m_req_interface.bits.write.poke(false)
                m_req_interface.bits.addr.poke(base_addr + i)
                m_req_interface.bits.dataIn.poke(0)
                m_req_interface.valid.poke(true)
                i += 1
                if((base_addr + i) >= addr_space) {
                  print("!!!WARNING, exceeded address space of " + addr_space + " \n")
                }
            } else {
                m_req_interface.bits.dataIn.poke(44)
                m_req_interface.valid.poke(false)
            }
            dut.clock.step()
            if(m_resp_interface.valid.peekBoolean()) {
                read_data(j) = m_resp_interface.bits.peekInt().toInt
                j += 1
            }
        }
        m_req_interface.valid.poke(false)
        dut.clock.step()
    return read_data
  }

  def read_mem_interface(m_req_interface : DecoupledIO[MemRequestIO], m_resp_interface : DecoupledIO[UInt], 
    data_to_read : Int, base_addr : Int, dut : Module) : Array[Int] = {

        print("Sending data read request for " + data_to_read + " data from address " + base_addr + "...\n")
        var read_data = new Array[Int](data_to_read)
        var i = 0
        var j = 0
        m_resp_interface.ready.poke(true)

        while(j < data_to_read) {
            if(m_req_interface.ready.peekBoolean() && (i < data_to_read)) {
                m_req_interface.bits.write.poke(false)
                m_req_interface.bits.addr.poke(base_addr + i)
                m_req_interface.bits.dataIn.poke(0)
                m_req_interface.valid.poke(true)
                i += 1
                if((base_addr + i) >= addr_space) {
                  print("!!!WARNING, exceeded address space of " + addr_space + "\n")
                }
            } else {
                m_req_interface.bits.dataIn.poke(44)
                m_req_interface.valid.poke(false)
            }
            dut.clock.step()
            if(m_resp_interface.valid.peekBoolean()) {
                read_data(j) = m_resp_interface.bits.peekInt().toInt
                j += 1
            }
        }
        m_req_interface.valid.poke(false)
        m_resp_interface.ready.poke(false)
        dut.clock.step()
        print(read_data.toList)
    return read_data
  }

  def assert_buffer[T, K](read : Array[T], expected : Array[K], read_base_addr : Int = 0, my_cast: T => K = (i:T) => i.asInstanceOf[K], expected_base_addr : Int = 0, until : Int = -1) {
    var to_read = expected.size
    if(until != -1) {
      to_read = until 
    }
    print("Checking buffer of size " + expected.size + " on input of " + to_read + " elements from address " + read_base_addr +  "\n")
    for(i <- 0 until to_read) {
        if(my_cast(read(read_base_addr + i)) != expected(expected_base_addr + i)) {
            print("Expected " + expected(expected_base_addr + i) + " at " + (read_base_addr + i) + " but read " + my_cast(read(read_base_addr + i)) + "\n")
        }
        assert(my_cast(read(read_base_addr + i)) == expected(expected_base_addr + i))
    }
  }
}
