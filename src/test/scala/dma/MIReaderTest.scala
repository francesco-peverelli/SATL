package dma

import chisel3._
import chiseltest._
import chisel3.util._
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
import dma._
import me._
import pe._
import mi._

class MIReaderWrapper(miDataSize: Int, miAddrSize: Int, addrBits: Int, lgSizeBits: Int, dataBits: Int) extends Module {
    
  val miReader = Module(new MIReader(miDataSize, miAddrSize, addrBits, lgSizeBits, dataBits, 64))
  val respGatherer = Module(new TLAPutGather(64, miDataSize, dataBits, lgSizeBits, addrBits, 64))
  val tlAPutFragmenter = Module(new TLAPutFragmenter(64, addrBits, dataBits, 3, 64))

  // Instantiate backing SRAM an indterface
  val mem = Seq.tabulate[BRAMLikeMem1](1)(n =>
    Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), miDataSize, miAddrSize)))

  val me_interface = Module(
    new NtoMMemInterface(
      miDataSize, // p_width,
      miAddrSize, // addr_width,
      1, // n_banks,
      3, // n_queue,
      32 // q_depth
    )
  )

  val test_inReq = IO(Flipped(Decoupled(new MemRequestIO(miDataSize, miAddrSize))))
  val testWRequest = IO(Flipped(Decoupled(new MIReaderRequestIO(miAddrSize, addrBits))))
  val testPutReq = IO(Decoupled(new TLAPutReq(addrBits, lgSizeBits, dataBits, 64)))

  me_interface.connectMems(mem)

  miReader.io.inReq <> me_interface.io.inReq(2)
  miReader.io.outData <> me_interface.io.outData(2)
  test_inReq <> me_interface.io.inReq(1)
  me_interface.io.outData(1) := DontCare

  me_interface.io.outData(0) := DontCare
  me_interface.io.inReq(0) := DontCare

  testWRequest <> miReader.io.writeRequest
  respGatherer.inReq <> miReader.io.tlaPutReq
  tlAPutFragmenter.inReq <> respGatherer.outReq
  testPutReq <> tlAPutFragmenter.outReq

}

class MIReaderTest extends AnyFlatSpec with ChiselScalatestTester {

    val addrBits = 32
    val dataBits = 64
    val miDataSize = 32
    val miAddrSize = 12
    val lgSizeBits = 16
    "dut" should "read from SRAM correctly" in {
        test(new MIReaderWrapper(miDataSize, miAddrSize, addrBits, lgSizeBits, dataBits)) {
            c => c.clock.step()

            // Write test sram
            val memUtils = new MemTestUtils(1 << miAddrSize)
            val testData: Array[Int] = Array.tabulate(256)(_ + 1)
            memUtils.write_mem_interface(c.test_inReq, testData, 8, c)

            // Send write request
            c.testWRequest.bits.scBaseAddr.poke(8)
            c.testWRequest.bits.scNumData.poke(128)
            c.testWRequest.bits.toAddress.poke(0x0800)
            c.testWRequest.valid.poke(true)

            c.testPutReq.ready.poke(true)

            var n = 1
            for(i <- 0 until 200) {
              if(c.testPutReq.valid.peekBoolean()) {
                assert(c.testPutReq.bits.giovanni.peekInt() == (BigInt(n+1) << (dataBits/2)) + BigInt((n)))
                assert(c.testPutReq.bits.fromSource.peekInt() == (if(n<=16) 0 else (1)))
                assert(c.testPutReq.bits.toAddress.peekInt() == (if(n<=16) 0x0800 else (0x0800 + 64)))
                assert(c.testPutReq.bits.mask.peekInt() == 255)
                n += 2
              }
              c.clock.step()
              if (n == 33) n = 1
            }
        }
    }
}