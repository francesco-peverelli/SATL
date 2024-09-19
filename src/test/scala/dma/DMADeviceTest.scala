package dma

import chisel3._
import chiseltest._
import chisel3.util._
import me._
import pe._
import mi._
import controller._
import utils._

import freechips.rocketchip.subsystem.{BaseSubsystem, CacheBlockBytes}
import freechips.rocketchip.config.{Parameters, View, Field, Config}
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.experimental.BundleLiterals._
import chiseltest.experimental.{sanitizeFileName}
import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.prci.ClockSinkParameters
import freechips.rocketchip.rocket._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.tile._
import freechips.rocketchip.tilelink._
import java.io.{ByteArrayOutputStream, PrintWriter}
import org.scalatest._
import org.scalatest.TestSuite
import reflect.runtime._
import scala.collection.JavaConversions._
import scala.reflect.ClassTag
import scala.reflect.io.File
import scala.sys.process._
import universe._
import scala.collection.mutable

class DMAControllerWithBackingLocalMem(addrWidth: Int, localAddrWidth: Int, dataWidth: Int) extends Module {

  val dut_controller = Module(new DMATestController(addrWidth, localAddrWidth, dataWidth, dataWidth, 64))

  // Instantiate backing SRAM an indterface
  val mem = Seq.tabulate[BRAMLikeMem1](1)(n =>
    Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), dataWidth, localAddrWidth)))

  val me_interface = Module(
    new NtoMMemInterface(
      dataWidth, // p_width,
      localAddrWidth, // addr_width,
      1, // n_banks,
      2, // n_queue,
      32 // q_depth
    )
  )

  me_interface.connectMems(mem)

  me_interface.io.inReq(0) <> dut_controller.mem_io.request
  me_interface.io.outData(0) <> dut_controller.mem_io.response
  dut_controller.mem_io.busy := me_interface.io.busy

  // Testing interface
  class TestMemIO extends Bundle {
    val busy = Output(Bool())
    val req = Flipped(Decoupled(new MemRequestIO(dataWidth, localAddrWidth)))
    val resp = Decoupled(UInt(dataWidth.W))
  }

  val test_mem_io = IO(new TestMemIO)

  test_mem_io.busy := me_interface.io.busy

  test_mem_io.req <> me_interface.io.inReq(1)
  test_mem_io.resp <> me_interface.io.outData(1)

  val dma_req_io = IO(Decoupled(new TLAGetReq(addrWidth, 32, dataWidth, 64)))
  dma_req_io <> dut_controller.dma_req_io

  val io = IO(new RoCCControllerIO(1))
  dut_controller.io <> io

}

class DMADeviceTest extends AnyFlatSpec with ChiselScalatestTester {

    "dut" should "process DMA requests" in {
      val addrWidth = 64
      val localAddrWidth = 12
      val dataWidth = 32

      test(new DMATestController(addrWidth, localAddrWidth, dataWidth, dataWidth, 64)) {
          c => c.clock.step()

          // Submit requests for reads from DMA;
          val testUtils = new DMATestUtils(true);
          print("Testing single DMA read req command\n")
          testUtils.pokeDMAReadCommand(8, 12, c.io)
          // Set DMA interface to ready
          c.dma_req_io.ready.poke(true)
          
          for(i <- 0 until 10){
              c.clock.step()
              testUtils.pokeInterfaceReset(c.io)

              c.io.rocc_cmd.resp_rdy.poke(true)

              if(c.io.rocc_cmd.resp_valid.peekBoolean()){
                print("Valid response: " + c.io.rocc_cmd.resp_data.peek() + "\n")
              }
          }
      }
    }

    "dut" should "process DMA requests consecutive" in {
      val addrWidth = 64
      val localAddrWidth = 12
      val dataWidth = 32

      test(new DMATestController(addrWidth, localAddrWidth, dataWidth, dataWidth, 64)) {
          c => c.clock.step()

          val respQueue: mutable.Queue[Int] = mutable.Queue.empty[Int]
          val dmaDimQueue: mutable.Queue[Int] = mutable.Queue.empty[Int]
          val dmaAddrQueue: mutable.Queue[Int] = mutable.Queue.empty[Int]

          val expectedResp: Seq[Int] = Seq.fill(9)(11)
          val expectedBytes: Seq[Int] = (1 to 9).map(i => i * 8)
          val expectedAddr: Seq[Int] = (1 to 9).map(i => i * 12)

          // Submit requests for reads from DMA;
          val testUtils = new DMATestUtils(true);
          print("Testing single DMA read req command\n")
   
          // Set DMA interface to ready
          c.dma_req_io.ready.poke(true)
          
          for(i <- 1 until 10){
              testUtils.pokeDMAReadCommand(i*8, i*12, c.io)
              c.io.rocc_cmd.resp_rdy.poke(true)

              if(c.io.rocc_cmd.resp_valid.peekBoolean()){
                respQueue.enqueue(c.io.rocc_cmd.resp_data.peekInt().toInt)
              }
              if(c.dma_req_io.valid.peekBoolean()){
                c.dma_req_io.bits.fromSource.expect(0)
                dmaAddrQueue.enqueue(c.dma_req_io.bits.toAddress.peekInt().toInt)
                dmaDimQueue.enqueue(c.dma_req_io.bits.lgSize.peekInt().toInt)
              }
              c.clock.step()
          }
          print("Dealing with remaining responses...\n")

          val maxIter = 10
          var iter = 0
          while((iter < maxIter) && (c.io.rocc_cmd.resp_valid.peekBoolean() || c.dma_req_io.valid.peekBoolean())){
              testUtils.pokeInterfaceReset(c.io)
              c.io.rocc_cmd.resp_rdy.poke(true)
              if(c.io.rocc_cmd.resp_valid.peekBoolean()){
                respQueue.enqueue(c.io.rocc_cmd.resp_data.peekInt().toInt)
              }
              if(c.dma_req_io.valid.peekBoolean()){
                c.dma_req_io.bits.fromSource.expect(0)
                dmaAddrQueue.enqueue(c.dma_req_io.bits.toAddress.peekInt().toInt)
                dmaDimQueue.enqueue(c.dma_req_io.bits.lgSize.peekInt().toInt)
              }
              c.clock.step()
              assert(false == c.io.rocc_cmd.cmd_valid.peekBoolean())
              iter+= 1
          }
          if(iter < maxIter){
            print("Requests completed.\nChecking sizes...\n")
            assert(respQueue.size == expectedResp.size)
            assert(dmaDimQueue.size == expectedBytes.size)
            assert(dmaAddrQueue.size == expectedAddr.size)
            assert(respQueue.size == expectedResp.size)
            print("Checking data\n")
            var idx = 0;
            while(respQueue.nonEmpty){
              val v = respQueue.dequeue()
              assert(v == expectedResp(idx))
              idx += 1
            }
            idx = 0;
            while(dmaAddrQueue.nonEmpty){
              val v = dmaAddrQueue.dequeue()
              assert(v == expectedAddr(idx))
              idx += 1
            }
            idx = 0;
            while(dmaDimQueue.nonEmpty){
              val v = dmaDimQueue.dequeue()
              assert(v == expectedBytes(idx))
              idx += 1
            }
            print("Test complete\n")
        } else {
          print("Max Iter exceeded!\n")
          assert(false)
        }
      }
    }

    "dut" should "process DMA requests delayed" in {
      val addrWidth = 64
      val localAddrWidth = 12
      val dataWidth = 32

      test(new DMATestController(addrWidth, localAddrWidth, dataWidth, dataWidth, 64)) {
          c => c.clock.step()

          val respQueue: mutable.Queue[Int] = mutable.Queue.empty[Int]
          val dmaDimQueue: mutable.Queue[Int] = mutable.Queue.empty[Int]
          val dmaAddrQueue: mutable.Queue[Int] = mutable.Queue.empty[Int]

          val expectedResp: Seq[Int] = Seq.fill(9)(11)
          val expectedBytes: Seq[Int] = (1 to 9).map(i => i * 8)
          val expectedAddr: Seq[Int] = (1 to 9).map(i => i * 12)

          // Submit requests for reads from DMA;
          val testUtils = new DMATestUtils(true);
          print("Testing single DMA read req command\n")
   
          // Set DMA interface to ready
          c.dma_req_io.ready.poke(true)
          
          for(i <- 1 until 100){
              if(i%10 == 0)
                testUtils.pokeDMAReadCommand((i/10)*8, (i/10)*12, c.io)
              else
                testUtils.pokeInterfaceReset(c.io)
              c.io.rocc_cmd.resp_rdy.poke(true)

              if(c.io.rocc_cmd.resp_valid.peekBoolean()){
                respQueue.enqueue(c.io.rocc_cmd.resp_data.peekInt().toInt)
              }
              if(c.dma_req_io.valid.peekBoolean()){
                c.dma_req_io.bits.fromSource.expect(0)
                dmaAddrQueue.enqueue(c.dma_req_io.bits.toAddress.peekInt().toInt)
                dmaDimQueue.enqueue(c.dma_req_io.bits.lgSize.peekInt().toInt)
              }
              c.clock.step()
          }
          print("Dealing with remaining responses...\n")

          val maxIter = 100
          var iter = 0
          while((iter < maxIter) && (c.io.rocc_cmd.resp_valid.peekBoolean() || c.dma_req_io.valid.peekBoolean())){
              testUtils.pokeInterfaceReset(c.io)
              c.io.rocc_cmd.resp_rdy.poke(true)
              if(c.io.rocc_cmd.resp_valid.peekBoolean()){
                respQueue.enqueue(c.io.rocc_cmd.resp_data.peekInt().toInt)
              }
              if(c.dma_req_io.valid.peekBoolean()){
                c.dma_req_io.bits.fromSource.expect(0)
                dmaAddrQueue.enqueue(c.dma_req_io.bits.toAddress.peekInt().toInt)
                dmaDimQueue.enqueue(c.dma_req_io.bits.lgSize.peekInt().toInt)
              }
              c.clock.step()
              assert(false == c.io.rocc_cmd.cmd_valid.peekBoolean())
              iter+= 1
          }
          if(iter < maxIter){
            print("Requests completed.\nChecking sizes...\n")
            assert(respQueue.size == expectedResp.size)
            assert(dmaDimQueue.size == expectedBytes.size)
            assert(dmaAddrQueue.size == expectedAddr.size)
            assert(respQueue.size == expectedResp.size)
            print("Checking data\n")
            var idx = 0;
            while(respQueue.nonEmpty){
              val v = respQueue.dequeue()
              assert(v == expectedResp(idx))
              idx += 1
            }
            idx = 0;
            while(dmaAddrQueue.nonEmpty){
              val v = dmaAddrQueue.dequeue()
              assert(v == expectedAddr(idx))
              idx += 1
            }
            idx = 0;
            while(dmaDimQueue.nonEmpty){
              val v = dmaDimQueue.dequeue()
              assert(v == expectedBytes(idx))
              idx += 1
            }
            print("Test complete\n")
        } else {
          print("Max Iter exceeded!\n")
          assert(false)
        }
      }
    }

    "dut" should "Read from local memory" in {
      val addrWidth = 64
      val localAddrWidth = 12
      val dataWidth = 32

      test(new DMAControllerWithBackingLocalMem(addrWidth, localAddrWidth, dataWidth)) {
         c => c.clock.step()
         // Write the local SRAM
         val memUtils = new MemTestUtils(4096)
         val testData: Array[Int] = (0 to 255).toArray
         print("Writing backing SRAM\n")
         memUtils.write_mem_interface[Int](c.test_mem_io.req, testData, 0, c)
         // Read back data with DMA controller
         val testUtils = new DMATestUtils(true)
         val buffer: Array[Int] = new Array[Int](256)
         print("Reading back SRAM\n")
         testUtils.read_chunk(buffer, 0, 0, 256, c.io, c)

         memUtils.assert_buffer[Int,Int](buffer, testData)
      }
    }
}