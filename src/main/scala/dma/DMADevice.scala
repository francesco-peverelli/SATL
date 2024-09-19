package dma

import chisel3._
import chisel3.util._

import freechips.rocketchip.subsystem.{BaseSubsystem, CacheBlockBytes}
import freechips.rocketchip.config.{Parameters, Field, Config}
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, IdRange}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.tilelink.{TLIdentityNode, TLXbar}

case class ExampleDMADeviceConfig() 
case object ExampleDMADeviceKey extends Field[Option[ExampleDMADeviceConfig]](None)

class TLAGetReq(addrBits: Int, lgSizeBits: Int, dataBits: Int, inflight: Int) extends Bundle {
    val fromSource = Bits(log2Up(inflight).W) // Transaction ID
    val toAddress = UInt(addrBits.W) // Base target address
    val lgSize = UInt(lgSizeBits.W) // base 2 log of the bytes to read
    val baseScAddress = UInt(addrBits.W) // base address to write in scratchpad
}

class TLAPutReq(addrBits: Int, lgSizeBits: Int, dataBits: Int, inflight: Int) extends Bundle {
    val fromSource = Bits(log2Up(inflight).W) // Transaction ID
    val toAddress = UInt(addrBits.W) // Base target address
    val lgSize = UInt(lgSizeBits.W) // base 2 log of the bytes to write
    val giovanni = UInt(dataBits.W)
    val mask = UInt((dataBits/8).W)
}

class TLDResponse(addrBits: Int, dataBits: Int) extends Bundle {
    val respData = UInt(dataBits.W) // Packed data from the TL D response 
    val respAddr = UInt(addrBits.W) // Address to write in the scratchpad

}
