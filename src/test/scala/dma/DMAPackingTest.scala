package dma

import chisel3._
import chiseltest._
import chisel3.util._
import me._

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

class DMAPackingTest extends AnyFlatSpec with ChiselScalatestTester {
    val outPktSize = 128
    val bytesToTransfer = 512
  
    "dut" should "correctly pack DMA request" in {
        test(new TLARequestPacker(32, outPktSize, 64)) {
            c => c.clock.step()

            // Submit 128 bytes request
            assert(c.inReq.ready.peekBoolean())

            c.inReq.valid.poke(true)
            c.inReq.bits.baseScAddress.poke(8)
            c.inReq.bits.toAddress.poke(0x8000)
            c.inReq.bits.fromSource.poke(1)
            c.inReq.bits.lgSize.poke(bytesToTransfer) 
            c.outReq.ready.poke(true)

            c.clock.step()

            c.inReq.valid.poke(false)

            var validResp = 0
            var iter = 0
            val maxIter = 100
            while((iter < maxIter) && (validResp < 4)){
                iter += 1
                if(c.outReq.valid.peekBoolean()){
                    c.outReq.ready.poke(true)
                    val source = c.outReq.bits.fromSource.peekInt()
                    val toAddress = c.outReq.bits.toAddress.peekInt()
                    val lgSize = c.outReq.bits.lgSize.peekInt()
                    val baseScAddress = c.outReq.bits.baseScAddress.peekInt()

                    assert(baseScAddress == (8 + validResp * outPktSize))
                    assert(source == 1)
                    assert(toAddress == (0x8000 + validResp * outPktSize))
                    assert(lgSize == 7)

                    validResp += 1
                }
                c.clock.step()
            }
            print("Iter: " + iter + "\n")
            assert(iter < maxIter)
        }
    }

    "dut" should "correctly pack DMA responses" in {
        val inDataWidth = 64
        val inAddrWidth = 32
        val outDataWidth = 32
        val outAddrWidth = 16
        test(new TLDResponsePacker(inDataWidth, inAddrWidth, outDataWidth, outAddrWidth, 64)){
            c => c.clock.step()

            c.outResp.ready.poke(true)

            var addr = 0x8000
            val baseAddr = addr
            val delta = 0x8
            var validResp = 0

            for(i <- 0 until 4){
                val data = 2*i

                c.inResp.valid.poke(true)
                c.inResp.bits.respAddr.poke(addr)
                c.inResp.bits.respData.poke(BigInt(data) + BigInt((data+1L) << 32L))

                c.clock.step()

                addr += delta

                if(c.outResp.valid.peekBoolean()){
                    assert(c.outResp.bits.respAddr.peekInt() == (baseAddr + validResp*delta/2))
                    assert(c.outResp.bits.respData.peekInt() == validResp)
                    validResp += 1
                }
            }
            c.inResp.valid.poke(false)
            c.clock.step() 

            val maxIter = 10
            var iter = 0
            while(c.outResp.valid.peekBoolean() && (iter < maxIter)){
                assert(c.outResp.bits.respAddr.peekInt() == (baseAddr + validResp*delta/2))
                assert(c.outResp.bits.respData.peekInt() == validResp)
                validResp += 1
                c.clock.step() 
                iter += 1   
            }
        }
    }

    "dut" should "align addresses" in {
        test(new TLAGetAddressAligner(64, 64)){
            c => c.clock.step()

            c.inReq.bits.baseScAddress.poke(1)
            c.inReq.bits.fromSource.poke(1)
            c.inReq.bits.lgSize.poke(7) // 128 bytes
            c.inReq.bits.toAddress.poke(8) // address is 8-bytes aligned

            print("testing\n")
            if(c.inReq.ready.peekBoolean()){
                print("Sent valid in\n")
                c.inReq.valid.poke(true)
                c.clock.step()
            }
            c.inReq.valid.poke(false)
            c.outReq.ready.poke(true)
            
            for(i <- 0 until 20){
                if(c.outReq.valid.peekBoolean()){
                    print("out: " + c.outReq.bits.baseScAddress.peekInt() + "\n")
                    print("out: " + c.outReq.bits.fromSource.peekInt() + "\n")
                    print("out: " + c.outReq.bits.lgSize.peekInt() + "\n")
                    print("out: " + c.outReq.bits.toAddress.peekInt() + "\n")
                    print("\n\n")
                }
                c.clock.step()
            }
            c.inReq.bits.baseScAddress.poke(1)
            c.inReq.bits.fromSource.poke(1)
            c.inReq.bits.lgSize.poke(6) // 128 bytes
            c.inReq.bits.toAddress.poke(8) // address is 8-bytes aligned

            print("testing 64\n")
            if(c.inReq.ready.peekBoolean()){
                print("Sent valid in\n")
                c.inReq.valid.poke(true)
                c.clock.step()
            }
            c.inReq.valid.poke(false)
            c.outReq.ready.poke(true)
            
            for(i <- 0 until 20){
                if(c.outReq.valid.peekBoolean()){
                    print("out: " + c.outReq.bits.baseScAddress.peekInt() + "\n")
                    print("out: " + c.outReq.bits.fromSource.peekInt() + "\n")
                    print("out: " + c.outReq.bits.lgSize.peekInt() + "\n")
                    print("out: " + c.outReq.bits.toAddress.peekInt() + "\n")
                    print("\n\n")
                }
                c.clock.step()
            }
        }
    }

    "dut" should " request buffered reads " in {
        test(new TLAGetBufferUnit(32, 32, 64, 32)){
            c => c.clock.step()

            c.ctrl.reset.poke(true)
            c.ctrl.baseAddr.poke(0x800)
            c.ctrl.dataToRead.poke(1024) // Total of 1024 bytes to read

            c.outData.ready.poke(true)

            c.clock.step()

            c.ctrl.reset.poke(false)

            val queue = scala.collection.mutable.Queue[Int]()
            for(i <- 0 until 256){
                queue.enqueue(i)
            }

            var dataSent = BigInt(0)
            var dataRequested = BigInt(0)
            var latencyCycles = 0

            while(dataSent < 256){
                if(latencyCycles > 0){
                    c.outData.ready.poke(false)
                    latencyCycles -= 1
                } else {
                    c.outData.ready.poke(true)
                }
                if(c.outReq.valid.peekBoolean() && (dataRequested < 256)){
                    c.outReq.ready.poke(true)
                    val baseAddr = c.outReq.bits.baseScAddress.peekInt()
                    val bytes = c.outReq.bits.lgSize.peekInt()
                    val address = c.outReq.bits.toAddress.peekInt()
                    print("Requested " + bytes + " bytes from address " + address + "\n")
                    dataRequested += bytes/4
                }else{
                    c.outReq.ready.poke(false)
                }
                if((dataRequested > 0) && queue.nonEmpty && c.inData.ready.peekBoolean()){
                    c.inData.valid.poke(true)
                    c.inData.bits.poke(queue.dequeue())
                    dataRequested -= 1
                } else{
                    c.inData.valid.poke(false)
                }
                if(c.outData.valid.peekBoolean() && c.outData.ready.peekBoolean()){
                    print("Data out: " + c.outData.bits.peekInt() + "\n")
                    dataSent += 1
                }

                c.clock.step()
            }
        }
    }
}
