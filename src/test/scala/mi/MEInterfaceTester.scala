package spatial_templates

import chisel3._
import chiseltest._
import chisel3.util._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random
import mi._
import me._
import pe._
import utils._

class PortSelTesterIO(val p_width: Int, val addr_width: Int, n_inputs: Int)
    extends Bundle {

  // Collection of producers that generate read and write requests for the SRAM
  val inSeq = Vec(n_inputs, new MemPortIO(p_width, addr_width))
  // Ack bits for a completed mem request
  val reqDone = Vec(n_inputs, Output(Bool()))
}

class TBSelTestModule(p_width: Int, addr_width: Int, n_inputs: Int)
    extends Module {

  val io = IO(new PortSelTesterIO(p_width, addr_width, n_inputs))
  val mem = Module(new BRAMLikeMem(new ElemId(1, 0, 0, 0)))
  val selector = Module(new TwoBankSelector(p_width, addr_width, n_inputs))

  // Passthrough the selector IO on the PE side
  io.inSeq <> selector.io.inSeq
  io.reqDone <> selector.io.reqDone

  // Connect the selector IO on the mem side
  mem.io.write_1 := selector.io.portOut_1.write
  mem.io.addr_1 := selector.io.portOut_1.addr
  mem.io.dataIn_1 := selector.io.portOut_1.dataIn
  mem.io.enable_1 := selector.io.portOut_1.valid
  selector.io.portOut_1.dataOut := mem.io.dataOut_1
  mem.io.write_2 := selector.io.portOut_2.write
  mem.io.addr_2 := selector.io.portOut_2.addr
  mem.io.dataIn_2 := selector.io.portOut_2.dataIn
  mem.io.enable_2 := selector.io.portOut_2.valid
  selector.io.portOut_2.dataOut := mem.io.dataOut_2
}
/*
class SelectorWithBRAMTester(c: TBSelTestModule) extends PeekPokeTester(c) {

}
 */
// Test helper module to instantiate memories and connect them to the interface

class NtoMMemInterfaceTesterModuleIO(
    val p_width: Int,
    val addr_width: Int,
    n_banks: Int,
    n_queue: Int
) extends Bundle {
  // Input request before bank selction
  val inReq = Vec(
    n_queue,
    Flipped(Decoupled(new MemRequestIO(p_width, addr_width + log2Up(n_banks))))
  )
  // Outcome of a memory read request
  val outData = Vec(n_queue, Decoupled(Output(UInt(p_width.W))))
}

class NtoMMemInterfaceTesterModule(
    val p_width: Int,
    val addr_width: Int,
    n_banks: Int,
    n_queue: Int,
    q_depth: Int
) extends Module {
  val io = IO(
    new NtoMMemInterfaceTesterModuleIO(p_width, addr_width, n_banks, n_queue)
  )
  val interface = Module(
    new NtoMMemInterface(p_width, addr_width, n_banks, n_queue, q_depth)
  )
  val mems = Seq.tabulate(n_banks)(n =>
    Module(new BRAMLikeMem1(new ElemId(1, n, 0, 0), p_width, addr_width))
  )

  interface.io.inReq <> io.inReq
  interface.io.outData <> io.outData
  interface.connectMems(mems)
}

class TwoBankSelectorTest extends AnyFlatSpec with ChiselScalatestTester {
  val testerArgs = Array[String](
    "--backend-name",
    "treadle",
    "--generate-vcd-output",
    "on",
    "--target-dir",
    "../test/scala"
  )
  it should "select two" in {
    test(new TwoBankSelector(36, 10, 2)) { c =>
      // Valid: 11
      c.io.inSeq(0).write.poke(false)
      c.io.inSeq(0).addr.poke(1)
      c.io.inSeq(0).dataIn.poke(5)
      c.io.inSeq(0).valid.poke(true)

      c.io.inSeq(1).write.poke(false)
      c.io.inSeq(1).addr.poke(2)
      c.io.inSeq(1).dataIn.poke(10)
      c.io.inSeq(1).valid.poke(true)

      c.io.portOut_1.addr.expect(1)
      c.io.portOut_1.dataIn.expect(5)
      c.io.portOut_1.valid.expect(1)

      c.io.portOut_2.addr.expect(2)
      c.io.portOut_2.dataIn.expect(10)
      c.io.portOut_2.valid.expect(1)

      // Valid: 01

      c.io.inSeq(0).write.poke(false)
      c.io.inSeq(0).addr.poke(1)
      c.io.inSeq(0).dataIn.poke(5)
      c.io.inSeq(0).valid.poke(false)

      c.io.inSeq(1).write.poke(false)
      c.io.inSeq(1).addr.poke(2)
      c.io.inSeq(1).dataIn.poke(10)
      c.io.inSeq(1).valid.poke(true)

      c.io.portOut_1.addr.expect(2)
      c.io.portOut_1.dataIn.expect(10)
      c.io.portOut_1.valid.expect(1)

      // Valid 10

      c.io.inSeq(0).write.poke(false)
      c.io.inSeq(0).addr.poke(1)
      c.io.inSeq(0).dataIn.poke(5)
      c.io.inSeq(0).valid.poke(true)
      c.io.inSeq(1).write.poke(false)
      c.io.inSeq(1).addr.poke(2)
      c.io.inSeq(1).dataIn.poke(10)
      c.io.inSeq(1).valid.poke(false)

      c.io.portOut_1.addr.expect(1)
      c.io.portOut_1.dataIn.expect(5)
      c.io.portOut_1.valid.expect(1)

      // Valid: 00

      c.io.inSeq(0).write.poke(false)
      c.io.inSeq(0).addr.poke(1)
      c.io.inSeq(0).dataIn.poke(5)
      c.io.inSeq(0).valid.poke(false)

      c.io.inSeq(1).write.poke(false)
      c.io.inSeq(1).addr.poke(2)
      c.io.inSeq(1).dataIn.poke(10)
      c.io.inSeq(1).valid.poke(false)

      c.io.portOut_1.addr.expect(2)
      c.io.portOut_1.dataIn.expect(10)
      c.io.portOut_1.valid.expect(0)
    }
  }
  it should "select three" in {
    test(new TwoBankSelector(36, 10, 3)) { c =>
      // Valid: 101

      c.io.inSeq(0).write.poke(true)
      c.io.inSeq(0).addr.poke(1)
      c.io.inSeq(0).dataIn.poke(5)
      c.io.inSeq(0).valid.poke(true)

      c.io.inSeq(1).write.poke(true)
      c.io.inSeq(1).addr.poke(2)
      c.io.inSeq(1).dataIn.poke(10)
      c.io.inSeq(1).valid.poke(false)

      c.io.inSeq(2).write.poke(true)
      c.io.inSeq(2).addr.poke(3)
      c.io.inSeq(2).dataIn.poke(15)
      c.io.inSeq(2).valid.poke(true)

      c.io.portOut_1.addr.expect(1)
      c.io.portOut_1.dataIn.expect(5)
      c.io.portOut_1.valid.expect(1)
      c.io.portOut_1.write.expect(1)
      c.io.portOut_2.addr.expect(3)
      c.io.portOut_2.dataIn.expect(15)
      c.io.portOut_2.valid.expect(1)
      c.io.portOut_2.write.expect(1)

      // Valid: 111

      c.io.inSeq(0).write.poke(true)
      c.io.inSeq(0).addr.poke(1)
      c.io.inSeq(0).dataIn.poke(5)
      c.io.inSeq(0).valid.poke(true)

      c.io.inSeq(1).write.poke(true)
      c.io.inSeq(1).addr.poke(2)
      c.io.inSeq(1).dataIn.poke(10)
      c.io.inSeq(1).valid.poke(true)

      c.io.inSeq(2).write.poke(true)
      c.io.inSeq(2).addr.poke(3)
      c.io.inSeq(2).dataIn.poke(15)
      c.io.inSeq(2).valid.poke(true)

      c.io.portOut_1.addr.expect(1)
      c.io.portOut_1.dataIn.expect(5)
      c.io.portOut_1.valid.expect(1)
      c.io.portOut_1.write.expect(1)

      c.io.portOut_2.addr.expect(2)
      c.io.portOut_2.dataIn.expect(10)
      c.io.portOut_2.valid.expect(1)
      c.io.portOut_2.write.expect(1)

      // Valid: 011

      c.io.inSeq(0).write.poke(true)
      c.io.inSeq(0).addr.poke(1)
      c.io.inSeq(0).dataIn.poke(5)
      c.io.inSeq(0).valid.poke(false)

      c.io.inSeq(1).write.poke(true)
      c.io.inSeq(1).addr.poke(2)
      c.io.inSeq(1).dataIn.poke(10)
      c.io.inSeq(1).valid.poke(true)

      c.io.inSeq(2).write.poke(true)
      c.io.inSeq(2).addr.poke(3)
      c.io.inSeq(2).dataIn.poke(15)
      c.io.inSeq(2).valid.poke(true)

      c.io.portOut_1.addr.expect(2)
      c.io.portOut_1.dataIn.expect(10)
      c.io.portOut_1.valid.expect(1)
      c.io.portOut_1.write.expect(1)

      c.io.portOut_2.addr.expect(3)
      c.io.portOut_2.dataIn.expect(15)
      c.io.portOut_2.valid.expect(1)
      c.io.portOut_2.write.expect(1)

      // Valid: 001

      c.io.inSeq(0).write.poke(false)
      c.io.inSeq(0).addr.poke(1)
      c.io.inSeq(0).dataIn.poke(5)
      c.io.inSeq(0).valid.poke(false)

      c.io.inSeq(1).write.poke(false)
      c.io.inSeq(1).addr.poke(2)
      c.io.inSeq(1).dataIn.poke(10)
      c.io.inSeq(1).valid.poke(false)

      c.io.inSeq(2).write.poke(true)
      c.io.inSeq(2).addr.poke(3)
      c.io.inSeq(2).dataIn.poke(15)
      c.io.inSeq(2).valid.poke(true)

      c.io.portOut_1.addr.expect(3)
      c.io.portOut_1.dataIn.expect(15)
      c.io.portOut_1.valid.expect(1)
      c.io.portOut_1.write.expect(1)

      // Valid: 101 - read

      // put some values on the banks output
      c.io.portOut_1.dataOut.poke(9)
      c.io.portOut_2.dataOut.poke(99)

      c.io.inSeq(0).write.poke(false)
      c.io.inSeq(0).addr.poke(1)
      c.io.inSeq(0).dataIn.poke(5)
      c.io.inSeq(0).valid.poke(true)

      c.io.inSeq(1).write.poke(false)
      c.io.inSeq(1).addr.poke(2)
      c.io.inSeq(1).dataIn.poke(10)
      c.io.inSeq(1).valid.poke(false)

      c.io.inSeq(2).write.poke(false)
      c.io.inSeq(2).addr.poke(3)
      c.io.inSeq(2).dataIn.poke(15)
      c.io.inSeq(2).valid.poke(true)

      c.io.portOut_1.addr.expect(1)
      c.io.portOut_1.dataIn.expect(5)
      c.io.portOut_1.valid.expect(1)
      c.io.portOut_1.write.expect(0)

      c.io.portOut_2.addr.expect(3)
      c.io.portOut_2.dataIn.expect(15)
      c.io.portOut_2.valid.expect(1)
      c.io.portOut_2.write.expect(0)

      c.clock.step()

      c.io.inSeq(0).dataOut.expect(9)
      c.io.inSeq(2).dataOut.expect(99)

    }
  }
  it should "work with BRAM" in {
    test(new TBSelTestModule(36, 10, 3)) { c =>
      val test_data_1 = Seq(1, 2, 4, 8, 16, 32)
      val test_data_2 = Seq(1, 3, 9, 27, 81, 243)
      val test_data_3 = Seq(999, 999, 999, 999, 999, 999)
      val width = 36

      // write data to mem, from two ports
      for (i <- 0 until test_data_1.length) {
        c.io.inSeq(0).write.poke(true)
        c.io.inSeq(0).addr.poke(i)
        c.io.inSeq(0).dataIn.poke(test_data_1(i))
        c.io.inSeq(0).valid.poke(true)
        c.io.inSeq(1).write.poke(true)
        c.io.inSeq(1).addr.poke(i + test_data_1.length)
        c.io.inSeq(1).dataIn.poke(test_data_2(i))
        c.io.inSeq(1).valid.poke(true)

        c.io.inSeq(2).write.poke(true)
        c.io.inSeq(2).addr.poke(i + test_data_1.length + test_data_2.length)
        c.io.inSeq(2).dataIn.poke(test_data_3(i))
        c.io.inSeq(2).valid.poke(true)
        c.clock.step()
        c.io.reqDone(0).expect(true)
        c.io.reqDone(1).expect(true)
        c.io.reqDone(2).expect(false)
      }

      c.io.inSeq(0).write.poke(false)
      c.clock.step()

      // read data from mem, serially from one port
      for (i <- 0 until test_data_1.length) {
        c.io.inSeq(i % 3).addr.poke(i)
        c.io.inSeq(i % 3).write.poke(false)
        c.io.inSeq(i % 3).valid.poke(true)
        c.io.inSeq((i + 1) % 3).valid.poke(false)
        c.io.inSeq((i + 2) % 3).valid.poke(false)
        c.clock.step()
        c.io.inSeq(i % 3).dataOut.expect(test_data_1(i))
        c.io.reqDone(i % 3).expect(true)
        c.io.reqDone((i + 1) % 3).expect(false)
        c.io.reqDone((i + 2) % 3).expect(false)
      }

      for (i <- 0 until test_data_2.length) {
        c.io.inSeq(0).addr.poke(i + test_data_1.length)
        c.io.inSeq(0).write.poke(false)
        c.io.inSeq(0).valid.poke(true)
        c.io.inSeq(1).valid.poke(false)
        c.io.inSeq(2).valid.poke(false)
        c.clock.step()
        c.io.inSeq(0).addr.poke(i + test_data_1.length)
        c.io.inSeq(0).write.poke(false)
        c.io.inSeq(0).valid.poke(true)
        c.io.inSeq(1).valid.poke(false)
        c.io.inSeq(2).valid.poke(false)
        c.io.inSeq(0).dataOut.expect(test_data_2(i))
      }
    }
  }
  it should "handle requests" in {
    test(new BankAccessQueue(36, 10, 2, 10)) { c =>
      // 2 banks - enqueue some write requests

      for (i <- 0 until 10) {
        c.io.inReq.bits.write.poke(true)
        c.io.inReq.bits.addr.poke(i)
        c.io.inReq.bits.dataIn.poke(i + 1)
        c.io.inReq.valid.poke(true)
        // Do not dequeue in the meantime!
        c.io.reqDone(0).poke(false)
        c.io.reqDone(1).poke(false)
        c.clock.step()

        c.io.outSeq(0).dataIn.expect(1)
        c.io.outSeq(0).addr.expect(0)
        c.io.outSeq(0).write.expect(true)
      }

      // send done signals expecting the output to change
      for (i <- 0 until 10) {
        c.io.reqDone(0).poke(true)
        c.io.reqDone(1).poke(false)
        // Do not enqueue in the meantime!
        c.io.inReq.valid.poke(false)
        c.io.outSeq(0).dataIn.expect(i + 1)
        c.io.outSeq(0).addr.expect(i)
        c.io.outSeq(0).write.expect(true)
        c.clock.step()

      }

      // Enqueue some write requests

      for (i <- 0 until 10) {
        c.io.inReq.bits.write.poke(true)
        c.io.inReq.bits.addr.poke(i)
        c.io.inReq.bits.dataIn.poke(i + 1)
        c.io.inReq.valid.poke(true)
        // Do not dequeue in the meantime!
        c.io.reqDone(0).poke(false)
        c.io.reqDone(1).poke(false)

        c.clock.step()

        if (i == 0) {
          c.io.outSeq(0).dataIn.expect(i + 1)
          c.io.outSeq(0).addr.expect(i)
          c.io.outSeq(0).write.expect(true)
        }
      }

      // send done signals expecting the output to change
      for (i <- 0 until 10) {
        c.io.reqDone(0).poke(true)
        c.io.reqDone(1).poke(false)
        // Do not enqueue in the meantime!
        c.io.inReq.valid.poke(false)
        c.io.outSeq(0).dataIn.expect(i + 1)
        c.io.outSeq(0).addr.expect(i)
        c.io.outSeq(0).write.expect(true)
        c.clock.step()
      }

      // Enqueue some reads

      for (i <- 0 until 10) {
        c.io.inReq.bits.write.poke(false)
        c.io.inReq.bits.addr.poke(i)
        c.io.inReq.valid.poke(true)
        // Do not dequeue in the meantime!
        c.io.reqDone(0).poke(false)
        c.io.reqDone(1).poke(false)
        c.clock.step()

        c.io.outSeq(0).addr.expect(0)
        c.io.outSeq(0).write.expect(false)

      }

      // send done signals expecting the output to change
      for (i <- 0 until 10) {
        c.io.reqDone(0).poke(true)
        c.io.reqDone(1).poke(false)
        c.io.inReq.valid.poke(false)
        c.io.outSeq(0).dataOut.poke(i)
        c.io.outSeq(1).dataOut.poke(i + 10)

        c.clock.step()

        c.io.outData.bits.expect(i)
        c.io.outData.valid.expect(true)
      }
    }
  }
}

class NtoMMemInterfaceTest extends AnyFlatSpec with ChiselScalatestTester {
  val testerArgs = Array[String](
    "--backend-name",
    "treadle",
    "--generate-vcd-output",
    "on",
    "--target-dir",
    "../test/scala"
  )
  var a_p_width = 32
  var a_addr_width = 10
  var a_n_banks = 1
  var a_n_queues = 1
  var a_q_depth = 16
  it should "handle requests" in {
    test(
      new NtoMMemInterfaceTesterModule(
        a_p_width,
        a_addr_width,
        a_n_banks,
        a_n_queues,
        a_q_depth
      )
    ).withAnnotations(Seq(VerilatorBackendAnnotation)) { c =>
      print("Testing NtoM mem: [" + a_n_banks + " " + a_n_queues + " " + a_q_depth + "]\n")

      def log2(x: Double) = scala.math.log(x) / scala.math.log(2)

      // Generate random addresses and random data from a pool

      val numAddresses = 10//800
      var count = 0
      var addressesSet = Set.empty[Int]
      var dataIn = Seq.empty[Int]
      
      val maxAddress =
        scala.math.pow(2, addr_width + scala.math.ceil(log2(a_n_banks))).toInt
      while (count < numAddresses) {
        val n = Random.nextInt(maxAddress)
        if (!(addressesSet contains n)) {
          addressesSet += n
          dataIn = dataIn :+ Random.nextInt(16384)
          count += 1
        }
      }
      dataIn = Seq.tabulate(numAddresses)(n => n)
      var addresses = Seq.tabulate(numAddresses)(n => n)
      //var addresses = addressesSet toSeq
      // var addresses = Seq(0,1024,1,1025,2,1026,3,1027,4,1028)
      // var addresses = Seq(0,1,2,3,4,5, 6, 7, 8, 9)
      // var addresses = Seq(1024,1025,1026,1027,1028, 0, 1, 2, 3, 4)
      // var addresses = Seq(1024,1025, 0, 1, 1026,1027, 2, 3, 1028, 1029)
      var addrQueues = Seq.fill(a_n_queues)(scala.collection.mutable.Queue[Int]())
      var dataQueues = Seq.fill(a_n_queues)(scala.collection.mutable.Queue[Int]())

      // Fill 6 queues with addresses and data
      for (i <- 0 until numAddresses) {
        addrQueues(i % a_n_queues).enqueue(addresses(i))
        dataQueues(i % a_n_queues).enqueue(dataIn(i))
      }

      print("Starting hardware test...\n")
      for (q <- 0 until a_n_queues) {
        c.io.outData(q).ready.poke(true)
      }
      c.clock.step()

      var iter = 0
      var failed = false
      // Start test: for each queue, if ready, send a write request
      while (count != 0) {
        for (q <- 0 until a_n_queues) {
          if (dataQueues(q).isEmpty) {
            c.io.inReq(q).valid.poke(false)
          } else {
            c.io.inReq(q).bits.write.poke(true)
            c.io.inReq(q).bits.dataIn.poke(dataQueues(q).front)
            c.io.inReq(q).bits.addr.poke(addrQueues(q).front)
            c.io.inReq(q).valid.poke(true)
            // Firing happens this cycle, dequeue the element
            if (c.io.inReq(q).ready.peekBoolean()) {
              dataQueues(q).dequeue()
              addrQueues(q).dequeue()
              count -= 1
            }
          }
        }
        c.clock.step()
      }

      if (!failed) {

        print("Starting read requests...\n")

        var goldenDataQueues =
          Seq.fill(a_n_queues)(scala.collection.mutable.Queue[Int]())

        // Fill address queues once again
        for (i <- 0 until numAddresses) {
          addrQueues(i % a_n_queues).enqueue(addresses(i))
          goldenDataQueues(i % a_n_queues).enqueue(dataIn(i))
        }

        var reqCount = 0
        var deqPerQueue = Array.fill(a_n_queues)(0)
        var enqPerQueue = Array.fill(a_n_queues)(0)
        // For each queue, send a read request
        while (count < numAddresses) {
          for (q <- 0 until a_n_queues) {
            if (addrQueues(q).isEmpty) {
              c.io.inReq(q).valid.poke(false)
            } else {
              c.io.inReq(q).valid.poke(true)
              c.io.inReq(q).bits.write.poke(false)
              c.io.inReq(q).bits.addr.poke(addrQueues(q).front)
            }
            if (dataQueues(q).size < numAddresses / a_n_queues)
              // Firing happens this cycle, dequeue the element
              if (c.io.inReq(q).ready.peekBoolean() && !addrQueues(q).isEmpty) {
                addrQueues(q).dequeue()
                reqCount += 1
                deqPerQueue(q) = deqPerQueue(q) + 1
              }
            // If output data is valid, enqueue it
            if (c.io.outData(q).valid.peekBoolean) {
              dataQueues(q).enqueue(c.io.outData(q).bits.peekInt.toInt)
              count += 1
              enqPerQueue(q) = enqPerQueue(q) + 1
            }
          }
          c.clock.step()
        }

        print("Evaluating output...\n")
        var testOk = true

        for (i <- 0 until numAddresses) {
          val myData = dataQueues(i % a_n_queues).front
          val goldenData = goldenDataQueues(i % a_n_queues).front
          if (myData != goldenData) {
            print("Expected: " + goldenData + ", got " + myData + "\n")
            testOk = false
          }
          dataQueues(i % a_n_queues).dequeue()
          goldenDataQueues(i % a_n_queues).dequeue()
        }
        if (testOk) {
          print("--->---> All good!! <---<---\n")
        }
      }
    }
  }
  var p_width = 32
  var addr_width = 10
  var n_banks = 1
  var n_queues = 2
  var q_depth = 16
  it should "work with read latency" in {
    test(
      new NtoMMemInterfaceTesterModule(
        p_width,
        addr_width,
        n_banks,
        n_queues,
        q_depth
      )
    ) { c =>
      // Send some data to memory...
      val mt_utils = new MemTestUtils(1024)

      val dataSize = 256
      val startingAddress = 32
      val testData = Seq.tabulate(dataSize)(n => n)
      print("Test data: " + testData + "\n")

      mt_utils.write_mem_interface(
        c.io.inReq(0),
        testData.toArray,
        startingAddress,
        c
      )
      print("Checking that data has been correctly written...\n")
      var readData = mt_utils.read_mem_interface(
        c.io.inReq(0),
        c.io.outData(0),
        dataSize,
        startingAddress,
        c
      )
      mt_utils.assert_buffer[Int, Int](readData, testData.toArray)

      val testResult = Array.ofDim[Int](dataSize)

      val latencyRate = 4
      var testResIndex = 0
      var dataRequested = 0
      // Request sequential accesses with ready-latency
      for (i <- 0 until ((dataSize + 1) * latencyRate)) {
        if (dataRequested < dataSize) {
          // Each cycle request a read on interface 0
          if (c.io.inReq(0).ready.peekBoolean() /*&& c.io.inReq(0).valid.peekBoolean()*/) {
            c.io.inReq(0).bits.addr.poke(startingAddress+dataRequested)
            c.io.inReq(0).bits.write.poke(false)
            c.io.inReq(0).bits.dataIn.poke(0)
            c.io.inReq(0).valid.poke(true)
            dataRequested += 1
          }
        }
        if(c.io.outData(0).valid.peekBoolean() && c.io.outData(0).ready.peekBoolean()) {
          testResult(testResIndex) = c.io.outData(0).bits.peekInt().toInt
          testResIndex += 1
        }
        // Alternate ready interface...
        if (i % latencyRate == 0) {
          c.io.outData(0).ready.poke(true)
        } else {
          c.io.outData(0).ready.poke(false)
        }
        c.clock.step()
      }
      var allOk = true
      // Check matching responses
      for(i <- 0 until dataSize) {
        if(testResult(i) != testData(i)) { 
          print("Mismatch at " + i + ": res: " + testResult(i) + ", expected: " + testData(i) + "\n")
          allOk = false
        }
      }

      assert(allOk)
    }
  }
  p_width = 32
  addr_width = 10
  n_banks = 2
  n_queues = 4
  q_depth = 16
  it should "work with multi-bank and latency" in {
    test(
      new NtoMMemInterfaceTesterModule(
        p_width,
        addr_width,
        n_banks,
        n_queues,
        q_depth
      )
    ) { c =>
      // Send some data to memory...
      val mt_utils = new MemTestUtils(1 << (addr_width+1))

      val dataSize = 128
      val startingAddress = 0
      val testB1Data = Seq.tabulate(dataSize)(n => n) 
      val testB2Data = Seq.tabulate(dataSize)(n => n + dataSize)
      val testB3Data = Seq.tabulate(dataSize)(n => n + 2*dataSize)
      val testB4Data = Seq.tabulate(dataSize)(n => n + 3*dataSize)
      print("Test data: " + testB1Data + "\n")
      print("Test data: " + testB2Data + "\n")
      print("Test data: " + testB3Data + "\n")
      print("Test data: " + testB4Data + "\n")
      val dataAddress1 = startingAddress
      val dataAddress2 = (1 << addr_width) + startingAddress
      val dataAddress3 = startingAddress + dataSize
      val dataAddress4 = (1 << addr_width) + startingAddress + dataSize

      mt_utils.write_mem_interface(
        c.io.inReq(0),
        testB1Data.toArray,
        dataAddress1,
        c
      )
      mt_utils.write_mem_interface(
        c.io.inReq(1),
        testB2Data.toArray,
        dataAddress2,
        c
      )
      mt_utils.write_mem_interface(
        c.io.inReq(2),
        testB3Data.toArray,
        dataAddress3,
        c
      )
      mt_utils.write_mem_interface(
        c.io.inReq(3),
        testB4Data.toArray,
        dataAddress4,
        c
      )
      print("Checking that data has been correctly written...\n")
      var readB1Data = mt_utils.read_mem_interface(
        c.io.inReq(0),
        c.io.outData(0),
        dataSize,
        dataAddress1,
        c
      )
      var readB2Data = mt_utils.read_mem_interface(
        c.io.inReq(1),
        c.io.outData(1),
        dataSize,
        dataAddress2,
        c
      )
      var readB3Data = mt_utils.read_mem_interface(
        c.io.inReq(2),
        c.io.outData(2),
        dataSize,
        dataAddress3,
        c
      )
      var readB4Data = mt_utils.read_mem_interface(
        c.io.inReq(3),
        c.io.outData(3),
        dataSize,
        dataAddress4,
        c
      )
      mt_utils.assert_buffer[Int, Int](readB1Data, testB1Data.toArray)
      mt_utils.assert_buffer[Int, Int](readB2Data, testB2Data.toArray)
      mt_utils.assert_buffer[Int, Int](readB3Data, testB3Data.toArray)
      mt_utils.assert_buffer[Int, Int](readB4Data, testB4Data.toArray)

      val testB1Result = Array.ofDim[Int](dataSize)
      val testB2Result = Array.ofDim[Int](dataSize)
      val testB3Result = Array.ofDim[Int](dataSize)
      val testB4Result = Array.ofDim[Int](dataSize)

      val latencyRate = 1
      var testResB1Index = 0
      var testResB2Index = 0
      var testResB3Index = 0
      var testResB4Index = 0
      var dataB1Requested = 0
      var dataB2Requested = 0
      var dataB3Requested = 0
      var dataB4Requested = 0
      var i = 0
      // Request sequential accesses with ready-latency
      while ((testResB1Index < dataSize) || (testResB2Index < dataSize) ||
             (testResB3Index < dataSize) || (testResB4Index < dataSize)) {
        if (dataB1Requested < dataSize) {
          // Each cycle request a read on interface 0
          if (c.io.inReq(0).ready.peekBoolean()) {
            c.io.inReq(0).bits.addr.poke(dataAddress1+dataB1Requested)
            c.io.inReq(0).bits.write.poke(false)
            c.io.inReq(0).bits.dataIn.poke(0)
            c.io.inReq(0).valid.poke(true)
            dataB1Requested += 1
          }
        } else {
          c.io.inReq(0).valid.poke(false)
        }
        if (dataB2Requested < dataSize) {
          if (c.io.inReq(1).ready.peekBoolean()) {
            c.io.inReq(1).bits.addr.poke(dataAddress2 + dataB2Requested)
            c.io.inReq(1).bits.write.poke(false)
            c.io.inReq(1).bits.dataIn.poke(1)
            c.io.inReq(1).valid.poke(true)
            dataB2Requested += 1
          }
        } else {
          c.io.inReq(1).valid.poke(false)
        }
        if (dataB3Requested < dataSize) {
          if (c.io.inReq(2).ready.peekBoolean()) {
            c.io.inReq(2).bits.addr.poke(dataAddress3 + dataB3Requested)
            c.io.inReq(2).bits.write.poke(false)
            c.io.inReq(2).bits.dataIn.poke(2)
            c.io.inReq(2).valid.poke(true)
            dataB3Requested += 1
          }
        } else {
          c.io.inReq(2).valid.poke(false)
        }
        if (dataB4Requested < dataSize) {
          if (c.io.inReq(3).ready.peekBoolean()) {
            c.io.inReq(3).bits.addr.poke(dataAddress4 + dataB4Requested)
            c.io.inReq(3).bits.write.poke(false)
            c.io.inReq(3).bits.dataIn.poke(3)
            c.io.inReq(3).valid.poke(true)
            dataB4Requested += 1
          }
        } else {
          c.io.inReq(3).valid.poke(false)
        }

        if(c.io.outData(0).valid.peekBoolean() && c.io.outData(0).ready.peekBoolean()) {
          if(testResB1Index >= testB1Result.size) {
            print("idx: " + testResB1Index + ", val: " + c.io.outData(0).bits.peekInt().toInt + "\n")
          } else {
            testB1Result(testResB1Index) = c.io.outData(0).bits.peekInt().toInt
            testResB1Index += 1
          }
        }
        if(c.io.outData(1).valid.peekBoolean() && c.io.outData(1).ready.peekBoolean()) {
          if(testResB2Index >= testB2Result.size) {
            print("idx: " + testResB2Index + ", val: " + c.io.outData(1).bits.peekInt().toInt + "\n")
          } else {
            testB2Result(testResB2Index) = c.io.outData(1).bits.peekInt().toInt
            testResB2Index += 1
          }
        }
        if(c.io.outData(2).valid.peekBoolean() && c.io.outData(2).ready.peekBoolean()) {
          if(testResB3Index >= testB3Result.size) {
            print("idx: " + testResB3Index + ", val: " + c.io.outData(2).bits.peekInt().toInt + "\n")
          } else {
            testB3Result(testResB3Index) = c.io.outData(2).bits.peekInt().toInt
            testResB3Index += 1
          }
        }
        if(c.io.outData(3).valid.peekBoolean() && c.io.outData(3).ready.peekBoolean()) {
          if(testResB4Index >= testB4Result.size) {
            print("idx: " + testResB4Index + ", val: " + c.io.outData(3).bits.peekInt().toInt + "\n")
          } else {
            testB4Result(testResB4Index) = c.io.outData(3).bits.peekInt().toInt
            testResB4Index += 1
          }
        }
        // Alternate ready interface...
        if (i % latencyRate == 0) {
          c.io.outData(0).ready.poke(true)
        } else {
          c.io.outData(0).ready.poke(false)
        }
        if (i % latencyRate == 0) {
          c.io.outData(1).ready.poke(true)
        } else {
          c.io.outData(1).ready.poke(false)
        }
        if (i % latencyRate == 0) {
          c.io.outData(2).ready.poke(true)
        } else {
          c.io.outData(2).ready.poke(false)
        }
        if (i % latencyRate == 0) {
          c.io.outData(3).ready.poke(true)
        } else {
          c.io.outData(3).ready.poke(false)
        }
        c.clock.step()
        i += 1
      }
      var allOk = true
      // Check matching responses
      for(i <- 0 until dataSize) {
        if(testB1Result(i) != testB1Data(i)) { 
          print("B0: Mismatch at " + i + ": res: " + testB1Result(i) + ", expected: " + testB1Data(i) + "\n")
          allOk = false
        }
        if(testB2Result(i) != testB2Data(i)) { 
          print("B1: Mismatch at " + i + ": res: " + testB2Result(i) + ", expected: " + testB2Data(i) + "\n")
          allOk = false
        }
        if(testB3Result(i) != testB3Data(i)) { 
          print("B3: Mismatch at " + i + ": res: " + testB3Result(i) + ", expected: " + testB3Data(i) + "\n")
          allOk = false
        }
        if(testB4Result(i) != testB4Data(i)) { 
          print("B4: Mismatch at " + i + ": res: " + testB4Result(i) + ", expected: " + testB4Data(i) + "\n")
          allOk = false
        }
      }
      assert(allOk)
    }
  }
}
