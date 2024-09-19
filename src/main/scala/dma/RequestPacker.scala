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
import freechips.rocketchip.diplomacy.AddressDecoder

class TLARequestPacker(inPktWidth: Int, outPktSize: BigInt, inflight: Int) extends  Module {

    val inPktSize: BigInt = 1L << inPktWidth
    assert((inPktSize > outPktSize) && ((inPktSize % outPktSize) == 0))
  
    // In packet size is in actual bytes while out size is in log2(bytes)
    val inReq = IO(Flipped(Decoupled(new TLAGetReq(inPktWidth, inPktWidth, inPktWidth, inflight)))) // TODO: remove data bits
    val outReq = IO(Decoupled(new TLAGetReq(inPktWidth, 3, inPktWidth, inflight)))

    val dataToPack = RegInit(0.U.asTypeOf(UInt(inPktWidth.W)))
    val currentAddress = RegInit(0.U.asTypeOf(UInt(inPktWidth.W)))
    val currentScAddress = RegInit(0.U.asTypeOf(UInt(inPktWidth.W)))
    val currentSourceId = RegInit(0.U)
    val packing = RegInit(false.B)

    val currentReq = Module(new Queue(new TLAGetReq(inPktWidth, inPktWidth, inPktWidth, inflight), 1))

    inReq <> currentReq.io.enq

    when((dataToPack =/= 0.U) && packing) {
        outReq.valid := true.B
    }.otherwise{
        outReq.valid := false.B
    }

    // When new request arrives
    val init = currentReq.io.deq.valid && (dataToPack === 0.U)
    when(init){
        dataToPack := currentReq.io.deq.bits.lgSize
        currentAddress := currentReq.io.deq.bits.baseScAddress
        currentScAddress := currentReq.io.deq.bits.toAddress
        currentSourceId := currentReq.io.deq.bits.fromSource
        packing := true.B
        outReq.bits.baseScAddress := DontCare
        outReq.bits.lgSize := DontCare
        outReq.bits.toAddress := DontCare  
        outReq.bits.fromSource := DontCare  
    }.elsewhen((dataToPack =/= 0.U) && packing && outReq.ready){
        val dataLeft = Mux(dataToPack > outPktSize.U, outPktSize.U, dataToPack)
        dataToPack := Mux(dataToPack > outPktSize.U, dataToPack - outPktSize.U, 0.U)
        currentAddress := Mux(dataToPack > outPktSize.U, currentAddress + (outPktSize.U >> 3.U), 0.U)
        currentScAddress := Mux(dataToPack > outPktSize.U, currentScAddress + outPktSize.U, 0.U)
        currentSourceId := Mux(dataToPack > outPktSize.U, currentSourceId + 1.U, 0.U)
        packing := (dataToPack > outPktSize.U)
        outReq.bits.baseScAddress := currentAddress
        outReq.bits.toAddress := currentScAddress
        val lgSizeLeft = PriorityEncoder(dataLeft.asTypeOf(UInt(inReq.bits.lgSize.getWidth.W)))
        outReq.bits.lgSize := lgSizeLeft(2,0)
        outReq.bits.fromSource := currentSourceId
    }.otherwise{
        dataToPack := dataToPack
        currentAddress := currentAddress
        currentScAddress := currentScAddress
        currentSourceId := currentSourceId
        outReq.bits.baseScAddress := DontCare
        outReq.bits.lgSize := DontCare
        outReq.bits.toAddress := DontCare  
        outReq.bits.fromSource := DontCare  
    }
    // Request is done, load next
    when((dataToPack <= outPktSize.U) && packing && outReq.ready){
        currentReq.io.deq.ready := true.B
        packing := false.B
    }.otherwise{
        currentReq.io.deq.ready := false.B
    }
}

// Takes TLA put request with arbitrary packet size (within addrBits width) and outputs requests for
// packets of max outPktSize. Assumes that all expected data given the package size will arrive
class TLAPutFragmenter(outPktSize: BigInt, addrBits: Int, dataBits: Int, outLgSizeWidth: Int, inflight: Int) extends Module {
    val inPktSize: BigInt = 1L << addrBits
    val dataBitsAsBytes = dataBits / 8
    assert((inPktSize > outPktSize) && ((inPktSize % outPktSize) == 0))
  
    // In packet size is in actual bytes while out size is in log2(bytes)
    val inReq = IO(Flipped(Decoupled(new TLAPutReq(addrBits, addrBits, dataBits, inflight)))) // TODO: remove data bits
    val outReq = IO(Decoupled(new TLAPutReq(addrBits, outLgSizeWidth, dataBits, inflight)))

    val dataToPack = RegInit(0.U.asTypeOf(UInt(addrBits.W)))
    val currentPacketSize = RegInit(0.U.asTypeOf(UInt(addrBits.W)))
    val currentAddress = RegInit(0.U.asTypeOf(UInt(addrBits.W)))
    val currentSourceId = RegInit(0.U)
    val packing = RegInit(false.B)

    val maxBeats = outPktSize/dataBitsAsBytes
    // Count the valid beats in a TLA request until we need to get to next address
    val beatsCounter = RegInit(0.U.asTypeOf(UInt(log2Up(maxBeats).W)))

    val currentReq = Module(new Queue(new TLAPutReq(addrBits, addrBits, dataBits, inflight), 2))

    inReq <> currentReq.io.enq

    when((dataToPack =/= 0.U) && packing && currentReq.io.deq.valid) {
        outReq.valid := true.B
    }.otherwise{
        outReq.valid := false.B
    }

    // When new request arrives
    val init = currentReq.io.deq.valid && (dataToPack === 0.U)
    when(init){
        dataToPack := currentReq.io.deq.bits.lgSize
        currentAddress := currentReq.io.deq.bits.toAddress
        currentSourceId := currentReq.io.deq.bits.fromSource
        currentPacketSize := currentReq.io.deq.bits.lgSize
        packing := true.B
        outReq.bits.lgSize := DontCare
        outReq.bits.toAddress := DontCare  
        outReq.bits.fromSource := DontCare  
        outReq.bits.giovanni := DontCare
        outReq.bits.mask := DontCare
    }.elsewhen((dataToPack =/= 0.U) && packing && outReq.ready && currentReq.io.deq.valid){
        val nextAddrCond = (dataToPack > outPktSize.U) && (beatsCounter === (maxBeats.U - 1.U))
        val dataLeft = Mux(nextAddrCond, outPktSize.U, currentPacketSize)
        val pktSize = Mux(dataLeft > outPktSize.U, outPktSize.U, dataLeft)
        
        currentPacketSize := Mux(nextAddrCond, currentPacketSize - outPktSize.U, currentPacketSize)
        // Check if this works for last package
        dataToPack := Mux(dataToPack > dataBitsAsBytes.U, dataToPack - dataBitsAsBytes.U, 0.U)
        // Is toAddress
        currentAddress := Mux(nextAddrCond, currentAddress + outPktSize.U, currentAddress)
        currentSourceId := Mux(nextAddrCond, currentSourceId + 1.U, currentSourceId)
        beatsCounter := beatsCounter + 1.U
        packing := (dataToPack > dataBitsAsBytes.U)
        outReq.bits.toAddress := currentAddress
        val lgSizeLeft = PriorityEncoder(pktSize.asTypeOf(UInt(inReq.bits.lgSize.getWidth.W)))
        outReq.bits.lgSize := lgSizeLeft(2,0)
        outReq.bits.fromSource := currentSourceId
        outReq.bits.giovanni := currentReq.io.deq.bits.giovanni
        outReq.bits.mask := currentReq.io.deq.bits.mask
    }.otherwise{
        dataToPack := dataToPack
        currentAddress := currentAddress
        currentSourceId := currentSourceId
        currentPacketSize := currentPacketSize
        outReq.bits.lgSize := DontCare
        outReq.bits.toAddress := DontCare  
        outReq.bits.fromSource := DontCare  
        outReq.bits.giovanni := DontCare
        outReq.bits.mask := DontCare
    }
    // Request is done, load next (TODO: adapt this to dequeue each cycle to get new data package)
    when(packing && outReq.ready){
        currentReq.io.deq.ready := true.B
    }.otherwise{
        currentReq.io.deq.ready := false.B
    }
}


class TLAPutGather(gatherBufferDepth: Int, inPktWidth: Int, outPktWidth: Int, lgSizeBits: Int, addrBits: Int, inflight: Int) extends Module {
    val inReq = IO(Flipped(Decoupled(new TLAPutReq(addrBits, lgSizeBits, outPktWidth, inflight))))
    val outReq = IO(Decoupled(new TLAPutReq(addrBits, lgSizeBits, outPktWidth, inflight)))

    val gatherBuffer = Module(new Queue(new TLAPutReq(addrBits, lgSizeBits, outPktWidth, inflight), gatherBufferDepth))
    val beatShift = RegInit(0.U.asTypeOf(UInt(log2Up(outPktWidth/inPktWidth).W)))
    val beatsLeft = RegInit(0.U.asTypeOf(UInt(lgSizeBits.W)))
    val data = Reg(UInt((outPktWidth.W)))
    val dataMask = Reg(UInt((outPktWidth/8).W))
    val source = RegInit(0.U.asTypeOf(UInt(6.W)))
    val reqSize = RegInit(0.U.asTypeOf(UInt(addrBits.W)))
    val baseAddr = Reg(UInt(addrBits.W))

    val partialMask = (BigInt(1) << (inPktWidth/8)) - 1

    val s_init :: s_gather :: Nil = Enum(2)
    val state = RegInit(s_init)
    assert(inPktWidth == 32)
    assert(outPktWidth == 64)
    
    inReq.ready := (state === s_gather)
    val sizeInBeats = inReq.bits.lgSize >> log2Up((outPktWidth/8)).U
    when((state === s_init) && inReq.valid) {
        // From size in bytes get the number of beats
        beatsLeft := sizeInBeats
        source := inReq.bits.fromSource
        reqSize := inReq.bits.lgSize >> log2Up(outPktWidth/inPktWidth).U
        baseAddr := inReq.bits.toAddress
        state := s_gather
    }

    // When gathering, read and pack transaction data
    when((state === s_gather) && (beatsLeft > 0.U) && inReq.valid && gatherBuffer.io.enq.ready){
        beatsLeft := beatsLeft - 1.U
        data := Mux(beatShift === 0.U, inReq.bits.giovanni, (inReq.bits.giovanni << (inPktWidth.U)) + data)
        dataMask := Mux(beatShift === 0.U, partialMask.U, (dataMask << ((inPktWidth/8).U * beatShift)) + partialMask.U)
        beatShift := beatShift + 1.U
    }
    // When gathering and a packet is complete
    when(gatherBuffer.io.enq.ready && (state === s_gather) && (
        ((beatShift === 0.U) && (beatsLeft < sizeInBeats)) || (beatsLeft === 0.U))) {
        gatherBuffer.io.enq.valid := true.B
        gatherBuffer.io.enq.bits.giovanni := data
        gatherBuffer.io.enq.bits.lgSize := reqSize //size of packed 
        gatherBuffer.io.enq.bits.toAddress := baseAddr
        gatherBuffer.io.enq.bits.fromSource := source
        gatherBuffer.io.enq.bits.mask := dataMask
    }.otherwise {
        gatherBuffer.io.enq.valid := false.B
        gatherBuffer.io.enq.bits.giovanni := DontCare
        gatherBuffer.io.enq.bits.lgSize := DontCare //size of packed 
        gatherBuffer.io.enq.bits.toAddress := DontCare
        gatherBuffer.io.enq.bits.fromSource := DontCare
        gatherBuffer.io.enq.bits.mask := DontCare
    }

    when((beatsLeft === 0.U) && (state === s_gather)){
        state := s_init
    }

    gatherBuffer.io.deq <> outReq
}


class TLDResponsePacker(inDataWidth: Int, inAddrWidth: Int, 
    outDataWidth: Int, outAddrWidth: Int, outBuffDepth: Int) extends Module {
    val inResp = IO(Flipped(Decoupled(new TLDResponse(inAddrWidth, inDataWidth))))
    val outResp = IO(Decoupled(new TLDResponse(outAddrWidth, outDataWidth)))

    assert((inDataWidth > outDataWidth) && ((inDataWidth % outDataWidth) == 0))

    val divFactor = inDataWidth / outDataWidth

    val outBuffers = Seq.tabulate[Queue[TLDResponse]](divFactor)(n => 
        Module(new Queue(new TLDResponse(outAddrWidth, outDataWidth), outBuffDepth)))

    for(b <- 0 until divFactor){
        outBuffers(b).io.enq.valid := inResp.valid
        outBuffers(b).io.enq.bits.respAddr := inResp.bits.respAddr + (b).U // Assume scratchpad is addressed to the entry
        outBuffers(b).io.enq.bits.respData := inResp.bits.respData(((b+1)*outDataWidth-1), b*outDataWidth)
    }
    inResp.ready := outBuffers.map{ _.io.enq.ready }.reduce(_ & _)

    val arb = Module(new RRArbiter(new TLDResponse(outAddrWidth, outDataWidth), divFactor))

    for(b <- 0 until divFactor){
        arb.io.in(b) <> outBuffers(divFactor-b-1).io.deq
    } 
    outResp <> arb.io.out
}

class TLAGetAddressAligner(inPktWidth: Int, inflight: Int) extends Module {
    val inReq = IO(Flipped(Decoupled(new TLAGetReq(inPktWidth, 3, inPktWidth, inflight))))
    val outReq = IO(Decoupled(new TLAGetReq(inPktWidth, 3, inPktWidth, inflight)))

    val currBaseScAddress = Reg(UInt(inReq.bits.baseScAddress.getWidth.W))
    val currFromSource = Reg(UInt(inReq.bits.fromSource.getWidth.W))
    val currSize = Reg(UInt((1 << inReq.bits.lgSize.getWidth).W))
    val currToAddress = Reg(UInt(inReq.bits.toAddress.getWidth.W))

    val lsbPos = PriorityEncoder(currToAddress)
    val reqValid = RegInit(false.B)

    // Aligned out requests
    val outReqQueue = Module(new Queue(new TLAGetReq(inPktWidth, 3, inPktWidth, inflight), 4))

    val reqReady = !reqValid || (outReqQueue.io.enq.ready && (currSize <= (1.U << lsbPos)))
    inReq.ready := reqReady

    // When a new request arrives, update the curr registers
    when(inReq.ready && inReq.valid) {
        reqValid := true.B
        currBaseScAddress := inReq.bits.baseScAddress
        currFromSource := inReq.bits.fromSource
        currSize := 1.U << inReq.bits.lgSize
        currToAddress := inReq.bits.toAddress
    }

    // 8-bytes aligned
    when(outReqQueue.io.enq.ready && reqValid && ((lsbPos === 3.U) || currSize < 16.U)) {
        outReqQueue.io.enq.valid := true.B
        outReqQueue.io.enq.bits.baseScAddress := currBaseScAddress
        outReqQueue.io.enq.bits.fromSource := currFromSource
        outReqQueue.io.enq.bits.toAddress := currToAddress
        outReqQueue.io.enq.bits.lgSize := 3.U

        currSize := currSize - 8.U
        currToAddress := currToAddress + 8.U
        reqValid := currSize > 8.U
    // 16-bytes
    }.elsewhen(outReqQueue.io.enq.ready && reqValid && ((lsbPos === 4.U)  || currSize < 32.U)) {
        outReqQueue.io.enq.valid := true.B
        outReqQueue.io.enq.bits.baseScAddress := currBaseScAddress
        outReqQueue.io.enq.bits.fromSource := currFromSource
        outReqQueue.io.enq.bits.toAddress := currToAddress
        outReqQueue.io.enq.bits.lgSize := 4.U

        currSize := currSize - 16.U
        currToAddress := currToAddress + 16.U
        reqValid := currSize > 16.U

    // 32-bytes
    }.elsewhen(outReqQueue.io.enq.ready && reqValid && ((lsbPos === 5.U)  || currSize < 64.U)) {
        outReqQueue.io.enq.valid := true.B
        outReqQueue.io.enq.bits.baseScAddress := currBaseScAddress
        outReqQueue.io.enq.bits.fromSource := currFromSource
        outReqQueue.io.enq.bits.toAddress := currToAddress
        outReqQueue.io.enq.bits.lgSize := 5.U

        currSize := currSize - 32.U
        currToAddress := currToAddress + 32.U
        reqValid := currSize > 32.U
    // 64-bytes or greater
    }.elsewhen(outReqQueue.io.enq.ready && reqValid) {
        outReqQueue.io.enq.valid := true.B
        outReqQueue.io.enq.bits.baseScAddress := currBaseScAddress
        outReqQueue.io.enq.bits.fromSource := currFromSource
        outReqQueue.io.enq.bits.toAddress := currToAddress
        outReqQueue.io.enq.bits.lgSize := 6.U
        currSize := currSize - 64.U
        currToAddress := currToAddress + 64.U
        reqValid := currSize > 64.U
    }.otherwise{
        outReqQueue.io.enq.valid := false.B
        outReqQueue.io.enq.bits.baseScAddress := DontCare
        outReqQueue.io.enq.bits.fromSource := DontCare
        outReqQueue.io.enq.bits.toAddress := DontCare
        outReqQueue.io.enq.bits.lgSize := DontCare

    }

    outReqQueue.io.deq <> outReq
}

class TLABufferCtrl extends Bundle {
    val reset = Input(Bool())
    val dataToRead = Input(UInt(32.W))
    val baseAddr = Input(UInt(32.W))
}

class TLAGetBufferUnit(addrBits: Int, dataBits: Int, inflight: Int, bufferDepth: Int) extends Module {

    val inData = IO(Flipped(Decoupled(UInt(dataBits.W))))
    val outData = IO(Decoupled(UInt(dataBits.W)))
    val outReq = IO(Decoupled(new TLAGetReq(addrBits, addrBits, dataBits, inflight)))
    val ctrl = IO(new TLABufferCtrl())
    val counter = RegInit(0.U.asTypeOf(UInt(log2Up(bufferDepth).W)))

    val dataBuffer = Module(new Queue(UInt(dataBits.W), bufferDepth))
    val dataToRead = RegInit(0.U.asTypeOf(UInt(32.W)))
    val baseAddr = RegInit(0.U.asTypeOf(UInt(32.W)))

    when(ctrl.reset){
        dataToRead := ctrl.dataToRead
        baseAddr := ctrl.baseAddr
    }

    val bufferEntries = counter

    val halfBufferSize = bufferDepth.U >> 1.U
    val halfBufferBytes = halfBufferSize << log2Up((dataBits/8)).U
    when(!ctrl.reset && (bufferEntries < halfBufferSize) && (dataToRead > 0.U)){
        outReq.bits.baseScAddress := 0.U
        outReq.bits.fromSource := 0.U
        outReq.bits.lgSize := Mux(dataToRead > halfBufferBytes, halfBufferBytes, dataToRead)
        outReq.bits.toAddress := baseAddr
        outReq.valid := true.B
        baseAddr := baseAddr + halfBufferBytes // Add the corresponding bytes to the base address
        dataToRead := dataToRead - Mux(dataToRead > halfBufferBytes, halfBufferBytes, dataToRead)
    }.otherwise{
        outReq.valid := false.B
        outReq.bits.baseScAddress := DontCare 
        outReq.bits.fromSource := DontCare 
        outReq.bits.lgSize := DontCare 
        outReq.bits.toAddress := DontCare 
    }

    when(!ctrl.reset && (bufferEntries < halfBufferSize) && (dataToRead > 0.U)){
        counter := counter + halfBufferSize
    }.elsewhen(dataBuffer.io.deq.valid && dataBuffer.io.deq.ready){
        counter := counter - 1.U
    }.otherwise{
        counter := counter 
    }

    dataBuffer.io.enq <> inData
    outData <> dataBuffer.io.deq

}

class TLAPutForwarder(dataBits: Int, addrBits: Int, inflight: Int) extends Module {
    val outReq = IO(Decoupled(new TLAPutReq(addrBits, addrBits, dataBits, inflight)))
    val inData = IO(Flipped(Decoupled(UInt(dataBits.W))))
    val inBaseAddr = IO(Input(UInt(addrBits.W)))
    val inToWrite = IO(Input(UInt(addrBits.W)))
    val resetCount = IO(Input(Bool()))

    val toWrite = RegInit(0.U.asTypeOf(UInt(addrBits.W)))
    val count = RegInit(0.U.asTypeOf(UInt(addrBits.W)))

    when(resetCount) {
        toWrite := inToWrite
    }

    inData.ready := outReq.ready

    when(!resetCount && inData.ready && inData.valid && (toWrite > 0.U)){
        outReq.valid := true.B
        outReq.bits.fromSource := 0.U
        outReq.bits.giovanni := inData.bits
        outReq.bits.lgSize := 4.U // 4 bytes
        outReq.bits.mask := 0x00FF.U
        outReq.bits.toAddress := inBaseAddr + (count << log2Up(dataBits/8).U)
        toWrite := toWrite - 1.U
        count := count + 1.U
    }.otherwise{
        outReq.valid := false.B
        outReq.bits.fromSource := DontCare
        outReq.bits.giovanni := DontCare
        outReq.bits.lgSize := DontCare 
        outReq.bits.mask := DontCare
        outReq.bits.toAddress := DontCare
    }
}