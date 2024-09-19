package dma

import chisel3._
import chisel3.util._
import spatialtemplates._
import freechips.rocketchip.config.{Config, Parameters}
import freechips.rocketchip.diplomacy.LazyModule
import freechips.rocketchip.tile.{BuildRoCC, OpcodeSet, XLen}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.tile._
import freechips.rocketchip.subsystem.{BaseSubsystem, CacheBlockBytes}
import freechips.rocketchip.config.{Parameters, Field, Config}
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, IdRange}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.tilelink.{TLIdentityNode, TLXbar}
import mi._

class MIReaderRequestIO(miAddrSize: Int, addrBits: Int) extends Bundle {
    val scBaseAddr = UInt(miAddrSize.W)
    val toAddress = UInt(addrBits.W)
    val scNumData = UInt(miAddrSize.W)
}

class MIReaderIO(miDataSize: Int, miAddrSize: Int, addrBits: Int, lgSizeBits: Int, dataBits: Int, inflight: Int) extends Bundle {
    // Output TLA request
    val tlaPutReq = Decoupled(new TLAPutReq(addrBits, lgSizeBits, dataBits, inflight))
    // Input write request
    val writeRequest = Flipped(Decoupled(new MIReaderRequestIO(miAddrSize, addrBits)))
    // MI IO
    val inReq = Decoupled(new MemRequestIO(miDataSize, miAddrSize))
    val outData = Flipped(Decoupled(UInt(miDataSize.W)))
}

class MIReader(miDataSize: Int, miAddrSize: Int, addrBits: Int, lgSizeBits: Int, dataBits: Int, inflight: Int) extends Module {
  
    val io = IO(new MIReaderIO(miDataSize, miAddrSize, addrBits, lgSizeBits, dataBits, inflight))

    val tlAPutBuffer = Module(new Queue(new TLAPutReq(addrBits, lgSizeBits, dataBits, inflight), 32))

    val maskSize = miDataSize/8
    val maskVal = (BigInt(1) << maskSize) - 1
    val bytesPerbBeat = dataBits / 8

    val s_init :: s_write :: Nil = Enum(2)
    val state = RegInit(s_init)

    val dataLeft = Reg(UInt(miAddrSize.W))
    val baseAddr = Reg(UInt(addrBits.W))
    val readOffset = RegInit(0.U.asTypeOf(UInt(miAddrSize.W)))
    val reqSize = RegInit(0.U.asTypeOf(UInt(addrBits.W)))
    val maskReg = RegInit(maskVal.U.asTypeOf(UInt(maskSize.W)))
    val dataReg = Reg(UInt(dataBits.W))

    when(state === s_init) {
        io.writeRequest.ready := true.B
    }.otherwise{
        io.writeRequest.ready := false.B
    }

    when((state === s_init) && io.writeRequest.valid){
        dataLeft := (io.writeRequest.bits.scNumData >> log2Up(miDataSize/8).U) // Go from bytes to entries
        readOffset := io.writeRequest.bits.scBaseAddr
        // Req size grows as padding is added if sizes mismatch
        reqSize := io.writeRequest.bits.scNumData.asTypeOf(UInt(addrBits.W)) << log2Up(dataBits/miDataSize).U
        baseAddr := io.writeRequest.bits.toAddress
        state := s_write
    }.elsewhen((dataLeft === 0.U) && !io.outData.valid) {
        dataLeft := 0.U 
        readOffset := 0.U
        reqSize := 0.U 
        baseAddr := 0.U 
        state := s_init
    }

    when((state ===  s_write) && io.inReq.ready && (dataLeft > 0.U)){
        dataLeft := dataLeft - 1.U
        readOffset := readOffset + 1.U
        io.inReq.valid := true.B
        io.inReq.bits.addr := readOffset
        io.inReq.bits.dataIn := 0.U
        io.inReq.bits.write := false.B
    }.otherwise{
        io.inReq.valid := false.B
        io.inReq.bits.addr := DontCare
        io.inReq.bits.dataIn := DontCare
        io.inReq.bits.write := DontCare
    }

    when(tlAPutBuffer.io.enq.ready) {
        io.outData.ready := true.B
    }.otherwise{
        io.outData.ready := false.B
    }

    dontTouch(tlAPutBuffer.io.enq.bits.giovanni)
    dontTouch(tlAPutBuffer.io.deq.bits.giovanni)
    dontTouch(io.tlaPutReq.bits.giovanni)

    when(io.outData.valid) {
        tlAPutBuffer.io.enq.valid := true.B
        tlAPutBuffer.io.enq.bits.giovanni := io.outData.bits
        tlAPutBuffer.io.enq.bits.fromSource := 0.U
        tlAPutBuffer.io.enq.bits.lgSize := reqSize
        tlAPutBuffer.io.enq.bits.mask := maskReg
        tlAPutBuffer.io.enq.bits.toAddress := baseAddr
    }.otherwise {
        tlAPutBuffer.io.enq.valid := false.B
        tlAPutBuffer.io.enq.bits.giovanni := 1.U
        tlAPutBuffer.io.enq.bits.fromSource := 1.U
        tlAPutBuffer.io.enq.bits.lgSize := 1.U
        tlAPutBuffer.io.enq.bits.mask := 1.U
        tlAPutBuffer.io.enq.bits.toAddress := 1.U
    }

    io.tlaPutReq <> tlAPutBuffer.io.deq
}
