package spatial_templates

import chisel3._
import chiseltest._
import chisel3.util._
import org.scalatest.flatspec.AnyFlatSpec
import dma._
import spmvdma._
import utils._

class AddressedArray[T](val data: Array[T], val baseAddr: Int, val sizeofT: Int) {

    def apply(address: Int) = {
        if(!inRange(address)){
            print("Address " + address + " out of range\n")
        }
        data((address - baseAddr)/sizeofT)
    }
    def set(address: Int, value: T) = {
        if(!inRange(address)){
            print("Address " + address + " out of range\n")
        }
        data((address - baseAddr)/sizeofT) = value
    }
    def inRange(address: Int): Boolean = {
        return (address >= baseAddr) && (address < (baseAddr + data.length * sizeofT))
    }

}

class MockDFEInt(val x_queue: scala.collection.mutable.Queue[Int], val a_queue: scala.collection.mutable.Queue[Int],
    val row_queue: scala.collection.mutable.Queue[Int], val y_queue: scala.collection.mutable.Queue[Int]){

    var nz_count = 0
    var curr_sum = 0
    var valid_sum = false
    var res_to_send = 0

    def eval(a_val: DecoupledIO[UInt], x_val: DecoupledIO[UInt], y_val: DecoupledIO[UInt], row_val: DecoupledIO[UInt]){
        print(nz_count + "\n")
        a_val.ready.poke(true)
        x_val.ready.poke(true)
        if(a_val.valid.peekBoolean()){
            print("Valid A values\n")
            a_queue.enqueue(a_val.bits.peekInt().toInt)
        } 
        if(x_val.valid.peekBoolean()){
            print("Valid x values\n")
            x_queue.enqueue(x_val.bits.peekInt().toInt)
        } 
        if((nz_count == 0) && row_val.valid.peekBoolean()) {
            print("Valid row\n")
            row_val.ready.poke(true)
            nz_count = row_val.bits.peekInt().toInt
            print("Row set to " + nz_count + "\n")
            res_to_send += 1

        } else {
            row_val.ready.poke(false)
        }
        if((nz_count > 0) && !a_queue.isEmpty && !x_queue.isEmpty){
            print("Valid x and A  queues\n")
            curr_sum += a_queue.dequeue() * x_queue.dequeue()
            nz_count -= 1
            valid_sum = true
        }
        if((nz_count == 0) && valid_sum && (res_to_send > 0)){
            print("Enqueue y res\n")
            res_to_send -= 1
            y_queue.enqueue(curr_sum)
            curr_sum = 0
        }
        if(y_val.ready.peekBoolean() && y_queue.nonEmpty){
            print("Forwarding y\n")
            y_val.valid.poke(true)
            y_val.bits.poke(y_queue.dequeue())
        } else {
            y_val.valid.poke(false)
        }
    }
}

class MockDMA(val data: Seq[AddressedArray[Int]], val getQueues: Seq[scala.collection.mutable.Queue[Int]], val putQueue: scala.collection.mutable.Queue[Int]){

    def eval_tla_get_req(req: DecoupledIO[TLAGetReq], dataOut: DecoupledIO[UInt], queueIdx: Int){
        // As a TLA get request arrives, lookup the data and enqueue the responses
        if(req.valid.peekBoolean()) {
            print("Received get request\n")
            req.ready.poke(true)
            val addr = req.bits.toAddress.peekInt()
            val size = req.bits.lgSize.peekInt()
            print("Of size " + size + " from address " + addr + "\n")
            for(d <- data){
                if(d.inRange(address = addr.toInt)){
                    val n = size / d.sizeofT
                    for(i <- 0 until n.toInt){
                        getQueues(queueIdx).enqueue(d(addr.toInt + i.toInt*d.sizeofT))
                    }
                }
            }
        } else {
            req.ready.poke(false)
        }
        // If the corresponding data out is valid and we have data in queue
        if(dataOut.ready.peekBoolean() && getQueues(queueIdx).nonEmpty){
            dataOut.valid.poke(true)
            dataOut.bits.poke(getQueues(queueIdx).dequeue())
        } else {
            dataOut.valid.poke(false)
        }
    }

    def eval_tla_put_req(put_req: DecoupledIO[TLAPutReq]){
        put_req.ready.poke(true)
        if(put_req.valid.peekBoolean()){
            print("Received put request\n")
            val addr = put_req.bits.toAddress.peekInt().toInt
            val data64 = put_req.bits.giovanni.peekInt()
            val mask = put_req.bits.mask.peekInt()
            val size = put_req.bits.lgSize.peekInt()
            val maskedData = (data64).toInt
            for(d <- data){
                if(d.inRange(address = addr)){
                    val n = size / d.sizeofT
                    for(i <- 0 until n.toInt){
                        print("Enqueueing y\n")
                        d.set(addr + i*d.sizeofT, maskedData)
                        putQueue.enqueue(maskedData)
                    }
                } 
            }
        } 
    }
}

class MockSRAM(val nBanks: Int, val bankSize: Int, val data: Array[Int]){

    var d_cpy = data.length
    var msb = 0
    while (d_cpy != 0) {
      d_cpy = d_cpy / 2
      msb += 1
    }
    var d_pow_2 = (1 << msb)
    if(d_pow_2 >= data.length*2){
      d_pow_2 = (d_pow_2 >> 1)
    }

    def apply(address: Int) = {
        val bank = (address) / bankSize 
        val bankOffs = address % bankSize
        val convertedAddr = (d_pow_2 / nBanks) * bank + bankOffs
        print("Returning " + data(convertedAddr) + " as x\n")
        print("Address: " + address + ", converted to " + convertedAddr + "\n")
        data(convertedAddr)
    }
}

class SpMVVBDMAAddressGeneratorTest extends AnyFlatSpec with ChiselScalatestTester {

    "dut" should "instantiate " in {
        test(new SpMVVBDMAAddressGenerator(32, 10, 32, 2, 0)){
            c => c.clock.step()

            val sputil = new SparseTestUtils()
            val nrows = 20
            val ncols = 20
            val nz_every_x = 3
            
            val (row_idx, col_idx, nzA, x) =
            sputil.generate_crs_data(
              nrows,
              ncols,
              nz_every_x = nz_every_x
            )
            var x_cpy = x.length
            var msb = 0
            while (x_cpy != 0) {
              x_cpy = x_cpy / 2
              msb += 1
            }
            var x_pow_2 = (1 << msb)
            if(x_pow_2 >= x.length*2){
              x_pow_2 = (x_pow_2 >> 1)
            }
            val x_chunk_size = x_pow_2 / 2
            val nzInt: Array[Int] = nzA.map(_.toInt)
            val xInt: Array[Int] = x.map(_.toInt)
            var y = Array.ofDim[Int](x.length)

            val golden_y = sputil.do_spmv[Int](nzInt, xInt, col_idx, row_idx, nrows, ncols)

            print(row_idx.toList + "\n")
            print(col_idx.toList + "\n")
            print(nzInt.toList + "\n")
            print(xInt.toList + "\n")

            val a_array = new AddressedArray[Int](nzInt, 0x800, 4)
            val y_array = new AddressedArray[Int](y, 0x1200, 4)
            val col_array = new AddressedArray[Int](col_idx, 0x1600, 4)
            val row_array = new AddressedArray[Int](row_idx, 0x2400, 4)

            val mockDFE = new MockDFEInt(new scala.collection.mutable.Queue[Int](), new scala.collection.mutable.Queue[Int](),
                new scala.collection.mutable.Queue[Int](), new scala.collection.mutable.Queue[Int]())
            
            val arraysSeq: Seq[AddressedArray[Int]] = Seq(a_array, col_array, row_array, y_array)
            val getQueueSeq: Seq[scala.collection.mutable.Queue[Int]] = Seq(new scala.collection.mutable.Queue[Int](), new scala.collection.mutable.Queue[Int](),
                new scala.collection.mutable.Queue[Int]())
            val mockDMA = new MockDMA(arraysSeq, getQueueSeq, new scala.collection.mutable.Queue[Int]())
            val mockSRAM = new MockSRAM(2, 1024, xInt)
            val xDataQueue = new scala.collection.mutable.Queue[Int]()

            print("Setting up\n")
            // Setup
            c.pe_ctrl_io.reset_setup.poke(true)
            c.pe_ctrl_io.in_A.poke(a_array.baseAddr)
            c.pe_ctrl_io.in_col_idx.poke(col_array.baseAddr)
            c.pe_ctrl_io.in_nnz.poke(nzInt.length)
            c.pe_ctrl_io.in_nrows.poke(row_idx.length-1)
            c.pe_ctrl_io.in_row_ptr.poke(row_array.baseAddr+4)
            c.pe_ctrl_io.in_xlen_pow2.poke(x_pow_2)
            c.pe_ctrl_io.in_y_addr.poke(y_array.baseAddr)

            c.clock.step()

            c.pe_ctrl_io.reset_setup.poke(false)

            while(mockDMA.putQueue.size < nrows){

                mockDFE.eval(c.ctrl_io.a_vals, c.ctrl_io.x_vals, c.ctrl_io.y_vals, c.ctrl_io.row_elem_left)
                for(j <- 0 until 3){
                    mockDMA.eval_tla_get_req(c.dma_get_req_io.tla_get(j), c.dma_get_req_io.tla_data(j), j)
                }
                mockDMA.eval_tla_put_req(c.dma_put_req_io.tla_put(0))

                if(c.mem_io.addressRequests(0).valid.peekBoolean()){
                    c.mem_io.addressRequests(0).ready.poke(true)
                    val xaddr = c.mem_io.addressRequests(0).bits.peekInt().toInt
                    val xval = mockSRAM(xaddr)
                    xDataQueue.enqueue(xval)
                } else {
                    c.mem_io.addressRequests(0).ready.poke(false)
                }
                if(c.mem_io.dataResponses(0).ready.peekBoolean() && xDataQueue.nonEmpty){
                    print("Sending x response\n")
                    c.mem_io.dataResponses(0).valid.poke(true)
                    c.mem_io.dataResponses(0).bits.poke(xDataQueue.dequeue())
                }else{
                    c.mem_io.dataResponses(0).valid.poke(false)
                }

                c.clock.step()
            }
            var idx = 0
            while(mockDMA.putQueue.nonEmpty){
                val yv = mockDMA.putQueue.dequeue()
                if(!(yv == golden_y(idx))){
                    print("Error at " + idx + ": " + yv + ", " + golden_y(idx) + "\n")
                }else{
                    print("Test OK\n")
                }
                idx += 1
            }
            print("Done\n")
        }
    }
}