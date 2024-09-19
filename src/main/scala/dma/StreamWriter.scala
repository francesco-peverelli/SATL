package dma

import chisel3._
import chisel3.util._
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

class StreamWriterIO(addrBits: Int, dataBits: Int, inflight: Int) extends Bundle {
    val tlAPutReq = Flipped(Decoupled(new TLAPutReq(addrBits, addrBits, dataBits, inflight)))
}

class StreamWriter(dataWidth: Int, localPortWidth: Int, localAddrWidth: Int, inflight: Int)(implicit p: Parameters) extends LazyModule {

    val atlNode = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLMasterParameters.v1(
        name = "stream-writer-device", sourceId = IdRange(0, inflight), //sets number of inflight requests (1)
        // requests that responses arrive in FIFO order w.r.t. requests
        requestFifo = true)))))
    
    lazy val module = new LazyModuleImp(this){

        val (mem, edge) = atlNode.out(0)

        // Width of the address field for this node
        val addrBits = edge.bundle.addressBits
        val dataWidth = chiselTypeOf(mem.a.bits.data).getWidth
        val io = IO(new StreamWriterIO(addrBits, dataWidth, inflight))

        // Bytes in a block; set to CacheBlockBytes (TODO: is this reasonable?)
        val requestPacketBytes = 64
        var requestSizeWidth = 32
        val respGatherer = Module(new TLAPutGather(64, localPortWidth, dataWidth, addrBits, addrBits, inflight))
        val tlAPutFragmenter = Module(new TLAPutFragmenter(dataWidth, addrBits, dataWidth, 3, inflight))
        val tlAPutReqQueue = Module(new Queue(new TLAPutReq(addrBits, 3, dataWidth, inflight), 8))
        
        respGatherer.inReq <> io.tlAPutReq
        respGatherer.outReq <> tlAPutFragmenter.inReq 
        tlAPutFragmenter.outReq <> tlAPutReqQueue.io.enq

        // Valid with at least a request in queue and available entry for base address
        mem.a.valid := tlAPutReqQueue.io.deq.valid
        // Payload is the current head of the queue
        mem.a.bits := edge.Put(
            fromSource = tlAPutReqQueue.io.deq.bits.fromSource,
            toAddress = tlAPutReqQueue.io.deq.bits.toAddress,
            lgSize = tlAPutReqQueue.io.deq.bits.lgSize,
            data = tlAPutReqQueue.io.deq.bits.giovanni,
            mask = tlAPutReqQueue.io.deq.bits.mask
        )._2
        
        when(mem.a.fire) {
            tlAPutReqQueue.io.deq.ready := true.B
        }.otherwise{
            tlAPutReqQueue.io.deq.ready := false.B
        }
        // Ready to receive data 
        mem.d.ready := true.B
    }
}
