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
import mi._

class StreamReaderIO(addrBits: Int, dataWidth: Int, localPortWidth: Int, localAddrWidth: Int, inflight: Int) extends Bundle {
    val tlAReq = Flipped(Decoupled(new TLAGetReq(addrBits, 32, dataWidth, inflight)))

    // FLIPPED: inReq is the read data
    val inReq = Decoupled(new MemRequestIO(localPortWidth, localAddrWidth))
    val outData = Flipped(Decoupled(UInt(localPortWidth.W)))
}

class StreamReader(dataWidth: Int, localPortWidth: Int, localAddrWidth: Int, inflight: Int)(implicit p: Parameters) extends LazyModule {

    val atlNode = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLMasterParameters.v1(
        name = "stream-reader-device", sourceId = IdRange(0, inflight), //sets number of inflight requests (1)
        // requests that responses arrive in FIFO order w.r.t. requests
        requestFifo = true)))))
    
    lazy val module = new LazyModuleImp(this){

        val (mem, edge) = atlNode.out(0)

        // Width of the address field for this node
        val addrBits = edge.bundle.addressBits
        val dataWidth = chiselTypeOf(mem.a.bits.data).getWidth
        val io = IO(new StreamReaderIO(addrBits, dataWidth, localPortWidth, localAddrWidth, inflight))

        // Bytes in a block; set to CacheBlockBytes (TODO: is this reasonable?)
        val requestPacketBytes = 64
        var requestSizeWidth = 32

        // Register holding the current address to write in scratchpad
        val addr = Reg(UInt(addrBits.W))
        // Queue of incoming TLA requests
        val tlAPacker = Module(new TLARequestPacker(requestSizeWidth, requestPacketBytes, inflight)) // Use 64 bytes packets (max 2^32 request size)
        val tlAligner = Module(new TLAGetAddressAligner(requestPacketBytes, inflight)) // Ensure address alignment
        val tlAReqQueue = Module(new Queue(new TLAGetReq(addrBits, requestSizeWidth, dataWidth, inflight), 32))
        val tlAUnpackedQueue = Module(new Queue(new TLAGetReq(addrBits, 3, dataWidth, inflight), 32))
        tlAReqQueue.io.enq <> io.tlAReq
        tlAPacker.inReq <> tlAReqQueue.io.deq
        tlAligner.inReq <>  tlAPacker.outReq
        tlAUnpackedQueue.io.enq <> tlAligner.outReq

        val baseAddrQueue = Module(new Queue(UInt(addrBits.W), 32))
        // Queue of outgoing memory (scratchpad) write requests
        val memDataQueue = Module(new Queue(new TLDResponse(addrBits, dataWidth), 32))
        // Valid with at least a request in queue and available entry for base address
        mem.a.valid := tlAUnpackedQueue.io.deq.valid && baseAddrQueue.io.enq.ready
        // Payload is the current head of the queue
        mem.a.bits := edge.Get(
            fromSource = tlAUnpackedQueue.io.deq.bits.fromSource,
            toAddress = tlAUnpackedQueue.io.deq.bits.toAddress,
            lgSize = tlAUnpackedQueue.io.deq.bits.lgSize
        )._2
        
        // When last(mem.a), dequeue
        when(edge.done(mem.a)) {
            tlAUnpackedQueue.io.deq.ready := true.B
            baseAddrQueue.io.enq.valid := true.B
            baseAddrQueue.io.enq.bits :=  tlAUnpackedQueue.io.deq.bits.baseScAddress
        }.otherwise{
            tlAUnpackedQueue.io.deq.ready := false.B
            baseAddrQueue.io.enq.valid := false.B
            baseAddrQueue.io.enq.bits := DontCare
        }

        when(edge.done(mem.d)){
            baseAddrQueue.io.deq.ready := true.B
        }.otherwise{
            baseAddrQueue.io.deq.ready := false.B   
        }

        val d_sane = !(mem.d.bits.denied || mem.d.bits.corrupt)
        val d_hasData = edge.hasData(mem.d.bits)

        // Ready to receive data if we have space in the buffer
        mem.d.ready := memDataQueue.io.enq.ready

        // Multiplicative factor to beat address (based on the number of local data per beat)
        val localAddrShift = log2Up(dataWidth / localPortWidth)
        // If valid data is available and the buffer is not full, enqueue the data with correct address
        when(d_sane && d_hasData && mem.d.ready && mem.d.valid){
            memDataQueue.io.enq.bits.respData := mem.d.bits.data
            memDataQueue.io.enq.bits.respAddr := baseAddrQueue.io.deq.bits + (edge.count(mem.d)._4 << localAddrShift.U)
            memDataQueue.io.enq.valid := true.B
        }.otherwise{
            memDataQueue.io.enq.bits.respData := DontCare
            memDataQueue.io.enq.bits.respAddr := DontCare
            memDataQueue.io.enq.valid := false.B 
        }

        val tlDPacker = Module(new TLDResponsePacker(
            memDataQueue.io.deq.bits.respData.getWidth,
            memDataQueue.io.deq.bits.respAddr.getWidth,
            io.inReq.bits.dataIn.getWidth,
            io.inReq.bits.addr.getWidth,
            64
        ))

        tlDPacker.inResp <> memDataQueue.io.deq
        // Connect second MI to DMA
        io.inReq.bits.write := true.B
        io.inReq.bits.addr := tlDPacker.outResp.bits.respAddr
        io.inReq.bits.dataIn := tlDPacker.outResp.bits.respData
        io.inReq.valid := tlDPacker.outResp.valid
        tlDPacker.outResp.ready := io.inReq.ready
        // Assume we only write from DMA 
        io.outData := DontCare
    }

}
