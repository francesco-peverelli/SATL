package spatial_templates

import chisel3._
import chiseltest._
import chisel3.util._
import org.scalatest.flatspec.AnyFlatSpec
import java.io.BufferedWriter
import java.io.FileWriter
import scala.collection.JavaConverters._
import scala.collection.mutable.ListBuffer
import java.io.PrintWriter
import java.io.File
import java.nio.file.Files
import java.nio.file.Paths
import dataclass.data
import java.nio.charset.StandardCharsets
import scala.io.Source

import spmv._
import mi._
import me._
import pe._
import controller._
import template._
import utils._

class SpMVTestParams(
    val n_pe: Int,
    val n_banks: Int,
    val nrows: Int,
    val ncols: Int,
    val nz_every_x: Int,
    val respQueueSize: Int,
    val reqQueueSize: Int,
    val rowQueue: Int,
    val bank_size: Int,
    val dataSize: Int
) {}

class TestMEInterfaceIO(data_size: Int) extends Bundle {
  val req = Flipped(Decoupled(new MemRequestIO(data_size, data_size)))
  val resp = Valid(UInt(data_size.W))
}

class SpMVPEAssembler(
    n_banks: Int,
    n_queues: Int,
    n_pe: Int,
    resp_q_size: Int,
    req_q_size: Int,
    bank_size: Int,
    data_size: Int,
    dfe_q_size: Int
) extends Module
    with WithNtoMMemInterface
    with WithDataflowPE
    with WithNToMDataflowToMem
    with WithBRAMLikeMEM {

  val mem = Seq.tabulate[BRAMLikeMem1](n_banks)(n =>
    Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), 36, log2Up(bank_size)))
  )
  val me_interface = Module(
    new NtoMMemInterface(
      data_size, // p_width,
      log2Up(bank_size), // addr_width,
      n_banks, // n_banks,
      n_queues * n_pe + 1, // n_queue,
      req_q_size // q_depth
    )
  )

  me_interface.connectMems(mem)

  val df_pe = Seq.tabulate[SpMVPE](n_pe)(n =>
    Module(
      new SpMVPE(
        new ElemId(3, n, 0, 0),
        new CtrlInterfaceIO(),
        data_size, // p_width
        log2Up(bank_size), // addr_width
        data_size, // data_width
        resp_q_size, // rQueueDepth
        n_banks, // n_banks
        n, // bank_id
        dfe_q_size
      )
    )
  )

  for (i <- 0 until df_pe.size) {
    /*connectDFPEToNtoMMEInterface(
      me_interface,
      df_pe(i),
      1 + i * n_queues,
      (i + 1) * n_queues,
      Array(true, true, true, true, false)
    )*/
    connectDFPEToNtoMMEInterfaceInterleaved(
      me_interface,
      df_pe(i),
      i,
      df_pe.size,
      Array(false, true, true, true, true),
      1
    )
  }

  // Create passthrough mem interface to load data
  val mem_interface_io = IO(new TestMEInterfaceIO(data_size))
  me_interface.io.inReq(0) <> mem_interface_io.req
  mem_interface_io.resp.bits := me_interface.io.outData(0).bits
  mem_interface_io.resp.valid := me_interface.io.outData(0).valid
  me_interface.io.outData(0).ready := true.B

  // Passthrough PE addr_gen ctrl
  val addr_gen_ctrl = IO(
    Vec(
      n_pe,
      new SpMVAddrGenPassthroughIO(log2Up(bank_size), data_size, n_banks)
    )
  )
  for (i <- 0 until n_pe) {
    df_pe(i).addr_gen_ctrl_io <> addr_gen_ctrl(i)
  }

  // Passthrough ControlledPE control
  val ctrl_io = IO(new CtrlInterfaceIO())
  
  ctrl_io.idle := df_pe.map(_.io.idle).reduce(_ & _)
  df_pe.map( ctrl_io.ctrl_cmd <> _.io.ctrl_cmd )
  
}

class SpMVPETester extends AnyFlatSpec with ChiselScalatestTester {
  "DUT" should "instantiate SpMVPE" in {
    test(
      new SpMVPE(
        new ElemId(3, 0, 0, 0),
        new CtrlInterfaceIO(),
        32, // p_width
        10, // addr_width
        32, // data_width
        32, // rQueueDepth
        4, // n_banks
        0, // bank_id
        16
      )
    ) { c =>
      c.clock.step()
    }
  }
  "DUT" should "instantiate SpMVPEAssembler" in {
    val generateVerilog = true
    var filePath =
      "/home/users/francesco.peverelli/chipyard/generators/spatial_templates/test_run_dir/"
    if (generateVerilog) {
            val VerilogEmitter = (new chisel3.stage.ChiselStage).emitVerilog(
              new SpMVPEAssembler(
                1,//n_banks,
                5,
                1,//n_pe,
                32,//params.respQueueSize,
                32,//params.reqQueueSize,
                1024,//params.bank_size,
                32,//params.dataSize,
                32 //params.rowQueue
              )
            )
            Files.write(
              Paths.get(filePath + "SpMVPEAssembler.v"),
              VerilogEmitter.getBytes(StandardCharsets.UTF_8)
            )
          }
    test(new SpMVPEAssembler(1, 5, 1, 32, 32, 1024, 32, 16)) { c =>
      c.clock.step()
    }
  }
  "DUT" should "work with 1 ME and N PEs" in {
    val n_pe = 4
    val n_banks = 4
    val bank_size = 131072
    test(new SpMVPEAssembler(n_banks, 5, n_pe, 32, 32, bank_size, 32, 16)) { c =>
      c.clock.step()
      c.clock.setTimeout(0)
      val max_iter = 4000000

      // Generate sample problem
      // Divide sample problem across the available memory banks (in this case 1)
      // For each bank, divide rows assigning them to the available PEs
      //  1. figure out what to do if no rows are available for some
      //  2. compute split addressing for the data
      val nrows = 600
      val ncols = 600
      val sputil = new SparseTestUtils()
      val (row_idx, col_idx, nzA, x) =
        sputil.generate_crs_data(nrows, ncols, nz_every_x = 100)

      var x_cpy = x.length
      var msb = 0
      while (x_cpy != 0) {
        x_cpy = x_cpy / 2
        msb += 1
      }
      val x_pow_2 = (1 << msb)
      val x_chunk_size = x_pow_2 / n_banks
      val (
        banks,
        nz_addr,
        col_addr,
        row_ptr,
        x_addr,
        y_addr,
        rows_per_pe,
        bank_nnz,
        bank_rows
      ) =
        sputil.get_row_split_mem_ptr(
          nzA.size,
          col_idx,
          row_idx,
          x_chunk_size,
          n_pe,
          n_banks,
          bank_size
        )

          val mt_utils = new MemTestUtils(bank_size * n_banks)
          val pe_per_bank = n_pe / n_banks
          print("X divided in chunks of " + x_chunk_size + "\n")

          var nz_read = 0
          var rptr_read = 0
          for (b <- 0 until n_banks) {
            print("Writing to memory bank " + b + "...\n")
            var x_data_size = x_chunk_size
            if ((b + 1) * x_chunk_size > x.size) {
              x_data_size = x.size - b * x_chunk_size
              x_data_size = Math.max(x_data_size, 0).toInt
            }
            print("x data size: " + x_data_size + "\n")
            print("b*pe_per_bank=" + (b * pe_per_bank) + "\n")
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              nzA,
              nz_addr(b * pe_per_bank),
              c,
              java.lang.Float.floatToIntBits,
              bank_nnz(b),
              write_offset = nz_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              col_idx,
              col_addr(b * pe_per_bank),
              c,
              data_to_write = bank_nnz(b),
              write_offset = nz_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              row_idx,
              row_ptr(b * pe_per_bank),
              c,
              data_to_write = bank_rows(b) + 1,
              write_offset = rptr_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              x,
              x_addr(b),
              c,
              java.lang.Float.floatToIntBits,
              x_data_size,
              write_offset = b * x_chunk_size
            )

            print("Reading back written data...\n")

            val data_to_read = 2 * bank_nnz(b) + bank_rows(b) + 1 + x_chunk_size
            var read_data = mt_utils.read_mem_interface(
              c.mem_interface_io.req,
              c.mem_interface_io.resp,
              data_to_read,
              b * bank_size,
              c
            )

            val data_req_per_bank = data_to_read + bank_rows(b)

            print(
              "Requested " + data_req_per_bank + " addresses to bank " + b + "...\n"
            )
            assert(data_req_per_bank <= bank_size)

            print("Checking for correctness...\n")

            var check_start = 0
            // TODO: make read addresses bank-relative
            mt_utils.assert_buffer[Int, scala.Float](
              read_data,
              nzA,
              nz_addr(b * pe_per_bank) % bank_size,
              java.lang.Float.intBitsToFloat,
              until = bank_nnz(b),
              expected_base_addr = nz_read
            )
            mt_utils.assert_buffer[Int, Int](
              read_data,
              col_idx,
              col_addr(b * pe_per_bank) % bank_size,
              until = bank_nnz(b),
              expected_base_addr = nz_read
            )
            mt_utils.assert_buffer[Int, Int](
              read_data,
              row_idx,
              row_ptr(b * pe_per_bank) % bank_size,
              until = bank_rows(b) + 1,
              expected_base_addr = rptr_read
            )
            mt_utils.assert_buffer[Int, scala.Float](
              read_data,
              x,
              x_addr(b) % bank_size,
              java.lang.Float.intBitsToFloat,
              until = x_data_size,
              expected_base_addr = b * x_chunk_size
            )
            

            nz_read += bank_nnz(b)
            rptr_read += bank_rows(b)
          }

          var rows_read = 0
          for (i <- 0 until n_pe) {
            print("Setting up problem dimensions to PE " + i + "...\n")
            c.addr_gen_ctrl(i).reset_setup.poke(true)
            print("A address set to " + nz_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_A.poke(nz_addr(i))
            print("Col idx address set to " + col_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_col_idx.poke(col_addr(i))
            print("X address set to " + x_addr(banks(i)) + "\n")
            c.addr_gen_ctrl(i).in_x_addr.poke(x_addr(banks(i)))
            print("Row ptr address set to " + row_ptr(i) + "\n")
            c.addr_gen_ctrl(i).in_row_ptr.poke(row_ptr(i))
            print("Number of rows: " + rows_per_pe(i) + "\n")
            c.addr_gen_ctrl(i).in_nrows.poke(rows_per_pe(i))
            print("X length to nearest power of 2: " + x_pow_2 + "\n")
            c.addr_gen_ctrl(i).in_xlen_pow2.poke(x_pow_2)
            print("Y address set to " + y_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_y_addr.poke(y_addr(i))
            print("Row start set to " + row_idx(rows_read) + "...\n")
            c.addr_gen_ctrl(i).in_row_start.poke(row_idx(rows_read))
            rows_read += rows_per_pe(i)
          }
          c.clock.step()

          for (i <- 0 until n_pe) {
            c.addr_gen_ctrl(i).reset_setup.poke(false)
          }
          print(
            "Should be generating requests: idle=" + c.ctrl_io.idle
              .peekBoolean() + "\n"
          )

          var iter = 0

          while (!c.ctrl_io.idle.peekBoolean() && !(iter > max_iter)) {
            c.clock.step()
            iter += 1
          }
          print("Iterations: " + iter + "\n")

          if (iter >= max_iter) {
            print("Max iter exceeded!\n")
            // assert(false)
          }
          print("Done generating requests...\n")

          var read_y = Array[Int]()
          for (b <- 0 until n_banks) {
            var tmp = mt_utils.read_mem_interface(
              c.mem_interface_io.req,
              c.mem_interface_io.resp,
              bank_rows(b),
              y_addr(b),
              c
            )
            read_y = Array.concat(read_y, tmp)
          }

          var golden_y = Array.ofDim[scala.Float](nrows)
          var k = 0
          for (i <- 0 until nrows) {
            var sum = 0.0f
            var elem_left = row_idx(i + 1) - row_idx(i)
            while (elem_left > 0) {
              sum += nzA(k) * x(col_idx(k))
              elem_left -= 1
              k += 1
            }
            golden_y(i) = sum
          }
          var passed = true
          val err_threshold = 1e-05
          for (i <- 0 until read_y.size) {
            val rerr = if(golden_y(i) != 0) scala.math.abs(java.lang.Float.intBitsToFloat(read_y(i)) - golden_y(i))/golden_y(i) 
            else { scala.math.abs(java.lang.Float.intBitsToFloat(read_y(i)) - golden_y(i)) }
            if (rerr > err_threshold) {
              print(
                "out(" + i + ")=" + java.lang.Float.intBitsToFloat(
                  read_y(i)
                ) + "\n"
              )
              print("golden_y(" + i + ")=" + golden_y(i) + "\n")
              print("Relative error: " + rerr + "\n")
              passed = false
            }
          }
          assert(passed)
        
        }
  }
}
class SpMVPEDatasetTester extends AnyFlatSpec with ChiselScalatestTester {
  "DUT" should "work with M ME and N PEs record" in {

    def toNearestPow2(i: Int) : Int = {
          var n = i
          var msb = 0
          while (n != 0) {
            n = n / 2
            msb += 1
          }
          var n_pow_2 = (1 << msb)
          if(n_pow_2 >= i*2){
            n_pow_2 = (n_pow_2 >> 1)
          }
          return n_pow_2
    }

    def getBankSizeRequired(dataNnz: Int, dataRows: Int, dataCols: Int, nbanks: Int) : Int = {
      return toNearestPow2(2*dataNnz + 2*dataRows+1 + toNearestPow2(dataCols)/nbanks)/nbanks
    }
    import scala.collection.JavaConverters._
    import java.nio.file.{FileSystems, Files}


    //val dataRows = 15435
    //val dataCols = 15435
    //val dataNnz = 86854
    val generateVerilog = true
    val recordResult = true
    val fromFile = true
    //val dir = FileSystems.getDefault.getPath("/home/users/francesco.peverelli/testing-chipyard-setup/chipyard/generators/spatial_templates/src/main/resources/datasets/small_tests/") 
    //Files.list(dir).iterator().asScala.foreach(println)
    val inFileName = "/home/users/francesco.peverelli/testing-chipyard-setup/chipyard/generators/spatial_templates/src/main/resources/datasets/fs_760_1/fs_760_1.mtx"
    val testName = "aaa"
    val inX = "/home/users/francesco.peverelli/testing-chipyard-setup/chipyard/generators/spatial_templates/src/main/resources/iofiles/fs_760_1.mtx-input.txt"
    //print("Bank size computed: " + getBankSizeRequired(dataNnz, dataRows, dataCols, 1) + "\n")
    val paramArray = Array(
      new SpMVTestParams(
        2, 2, 0, 0, 1, 16, 16, 8, 262144, 32
      )/*,
      new SpMVTestParams(
        2, 2, dataRows, dataCols, 1, 256, 256, 128, 2*getBankSizeRequired(dataNnz, dataRows, dataCols, 2), 32
      ),
      new SpMVTestParams(
        4, 4, dataRows, dataCols, 1, 256, 256, 128, 2*getBankSizeRequired(dataNnz, dataRows, dataCols, 4), 32
      ),
      new SpMVTestParams(
        8, 8, dataRows, dataCols, 1, 256, 256, 128, getBankSizeRequired(dataNnz, dataRows, dataCols, 8), 32
      ),
      new SpMVTestParams(
        8, 8, 8, 2048, 1, 1024, 1024, 16, 16384, 32
      ),
      new SpMVTestParams(
        1, 1, 1, 2048, 1, 32, 32, 16, 16384, 32
      ),
      new SpMVTestParams(
        2, 2, 2, 2048, 1, 32, 32, 16, 16384, 32
      ),
      new SpMVTestParams(
        4, 4, 4, 2048, 1, 32, 32, 16, 16384, 32
      ),
      new SpMVTestParams(
        8, 8, 8, 2048, 1, 32, 32, 16, 16384, 32
      )*/
    )

    for (pidx <- 0 until paramArray.size) {
      val params = paramArray(pidx)

      val n_pe = params.n_pe
      val n_banks = params.n_banks
      var filePath =
        "/home/users/francesco.peverelli/chipyard/generators/spatial_templates/test_run_dir/"
      if (generateVerilog) {
        val VerilogEmitter = (new chisel3.stage.ChiselStage).emitVerilog(
          new SpMVPEAssembler(
            n_banks,
            5,
            n_pe,
            params.respQueueSize,
            params.reqQueueSize,
            params.bank_size,
            params.dataSize,
            params.rowQueue
          )
        )
        Files.write(
          Paths.get(filePath + "SpMVPEAssembler.v"),
          VerilogEmitter.getBytes(StandardCharsets.UTF_8)
        )
      }

      test(
        new SpMVPEAssembler(
          n_banks,
          5,
          n_pe,
          params.respQueueSize,
          params.reqQueueSize,
          params.bank_size,
          params.dataSize,
          params.rowQueue
        )
      ) { c =>
        c.clock.step()
        c.clock.setTimeout(0)
        val max_iter = 50000
        val experimentSchema =
          "PE," + ",BANKS" + ",CYCLES" + ",CYCLES/NNZ" + ",NNZ/CYCLES" + ",ROWS" + ",COLS" + ",NNZ/ROW" + ",DENSITY" + ",REQQ" + ",RESPQ" + ",ROWQ" + ",BANK_SIZE" + ",DATA_SIZE" + ",RUN" + "\n"

        var fileName = "SpMVDatasetTest.csv"
        var filePath =
          "/home/users/francesco.peverelli/chipyard/generators/spatial_templates/test_run_dir/"
        var newFile = false
        if (!Files.exists(Paths.get(filePath + fileName))) {
          newFile = true
        }
        val fw = if (Files.exists(Paths.get(filePath + fileName))) {
          new FileWriter(new File(filePath + fileName), true)
        } else {
          new FileWriter(filePath + fileName, true)
        }
        if (newFile) {
          fw.append(experimentSchema)
        }

        val bank_size =
          params.bank_size // refer to the 10 bit address (default in BRAMLikeMem)

        // Generate sample problem
        // Divide sample problem across the available memory banks (in this case 1)
        // For each bank, divide rows assigning them to the available PEs
        //  1. figure out what to do if no rows are available for some
        //  3. compute split addressing for the data
        var nrows = 0
        var ncols = 0
        val sputil = new SparseTestUtils()

        val nrep = if (recordResult) 1 else 1
        for (rep <- 0 until nrep) {

          var row_idx = Array.emptyIntArray
          var col_idx = Array.emptyIntArray
          var nzA = Array.emptyFloatArray
          var x = Array.emptyFloatArray
          if(!fromFile) {
            //val (row_idx_, col_idx_, nzA_, x_) =
            //  sputil.generate_crs_data(
            //    nrows,
            //    ncols,
            //    nz_every_x = params.nz_every_x
            //  )
            //row_idx = row_idx_
            //col_idx = col_idx_
            //nzA = nzA_
            //x = x_
          } else {
            val (nz_coo, row_coo, col_coo) = sputil.parse_mm_format(inFileName)
            val (nzA_, col_idx_, row_idx_) = sputil.coo_to_csr(nz_coo, row_coo, col_coo)
            nrows = row_coo.reduceLeft(_ max _) + 1
            ncols = col_coo.reduceLeft(_ max _) + 1
            row_idx = row_idx_
            col_idx = col_idx_
            nzA = nzA_

            val rng = scala.util.Random
            var x_ = Array.ofDim[scala.Float](ncols)
            //for(i <- 0 until ncols) {
            //  x_(i) = 100.0f// (rng.nextInt(10).toFloat) / 10f
            //}  
            var xidx = 0
            for (line <- Source.fromFile(inX).getLines) {
              x_(xidx) = line.toFloat
              xidx += 1
            } 
            row_idx = row_idx_
            col_idx = col_idx_
            nzA = nzA_
            //for(i <- 0 until nzA.size){
            //  nzA(i) = 1.0f
            //}
            x = x_
          }
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
          val x_chunk_size = x_pow_2 / n_banks

          print("nrows=" + nrows + "\n")
          print("ncols=" + ncols + "\n")

          val (
            banks,
            nz_addr,
            col_addr,
            row_ptr,
            x_addr,
            y_addr,
            rows_per_pe,
            bank_nnz,
            bank_rows
          ) =
            sputil.get_row_split_mem_ptr(
              nzA.size,
              col_idx,
              row_idx,
              x_chunk_size,
              n_pe,
              n_banks,
              bank_size
            )
          
          //print("NZ: " + nzA.toList + "\n")
          //print("x: " + x.toList + "\n")
          //print("col_idx: " + col_idx.toList + "\n")
          //print("row_idx: " + row_idx.toList + "\n")

          //print("Banks: " + banks.toList + "\n")
          //print("NZ addr: " + nz_addr.toList + "\n")
          //print("col_addr: " + col_addr.toList + "\n")
          //print("Row ptr: " + row_ptr.toList + "\n")
          //print("Y addr: " + y_addr.toList + "\n")
          //print("X addr: " + x_addr.toList + "\n")

          val mt_utils = new MemTestUtils(bank_size * n_banks)
          val pe_per_bank = n_pe / n_banks
          print("X divided in chunks of " + x_chunk_size + "\n")

          var nz_read = 0
          var rptr_read = 0
          for (b <- 0 until n_banks) {
            print("Writing to memory bank " + b + "...\n")
            var x_data_size = x_chunk_size
            if ((b + 1) * x_chunk_size > x.size) {
              x_data_size = x.size - b * x_chunk_size
              x_data_size = Math.max(x_data_size, 0).toInt
            }
            print("x data size: " + x_data_size + "\n")
            print("b*pe_per_bank=" + (b * pe_per_bank) + "\n")
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              nzA,
              nz_addr(b * pe_per_bank),
              c,
              java.lang.Float.floatToIntBits,
              bank_nnz(b),
              write_offset = nz_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              col_idx,
              col_addr(b * pe_per_bank),
              c,
              data_to_write = bank_nnz(b),
              write_offset = nz_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              row_idx,
              row_ptr(b * pe_per_bank),
              c,
              data_to_write = bank_rows(b) + 1,
              write_offset = rptr_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              x,
              x_addr(b),
              c,
              java.lang.Float.floatToIntBits,
              x_data_size,
              write_offset = b * x_chunk_size
            )

            //print("Reading back written data...\n")
            /*
            print("nz_addr:" + nz_addr.toList + "\n")
            print("bank_nnz: " + bank_nnz.toList + "\n")*/

            val data_to_read = 2 * bank_nnz(b) + bank_rows(b) + 1 + x_chunk_size

            if (!recordResult) {

              var read_data = mt_utils.read_mem_interface(
                c.mem_interface_io.req,
                c.mem_interface_io.resp,
                data_to_read,
                b * bank_size,
                c
              )

              val data_req_per_bank = data_to_read + bank_rows(b)

              print(
                "Requested " + data_req_per_bank + " addresses to bank " + b + "...\n"
              )
              assert(data_req_per_bank <= bank_size)

              print("Checking for correctness...\n")

              var check_start = 0
              // TODO: make read addresses bank-relative
              mt_utils.assert_buffer[Int, scala.Float](
                read_data,
                nzA,
                nz_addr(b * pe_per_bank) % bank_size,
                java.lang.Float.intBitsToFloat,
                until = bank_nnz(b),
                expected_base_addr = nz_read
              )
              mt_utils.assert_buffer[Int, Int](
                read_data,
                col_idx,
                col_addr(b * pe_per_bank) % bank_size,
                until = bank_nnz(b),
                expected_base_addr = nz_read
              )
              mt_utils.assert_buffer[Int, Int](
                read_data,
                row_idx,
                row_ptr(b * pe_per_bank) % bank_size,
                until = bank_rows(b) + 1,
                expected_base_addr = rptr_read
              )
              mt_utils.assert_buffer[Int, scala.Float](
                read_data,
                x,
                x_addr(b) % bank_size,
                java.lang.Float.intBitsToFloat,
                until = x_data_size,
                expected_base_addr = b * x_chunk_size
              )
            }

            nz_read += bank_nnz(b)
            rptr_read += bank_rows(b)
          }

          var rows_read = 0
          for (i <- 0 until n_pe) {
            print("Setting up problem dimensions to PE " + i + "...\n")
            c.addr_gen_ctrl(i).reset_setup.poke(true)
            print("A address set to " + nz_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_A.poke(nz_addr(i))
            print("Col idx address set to " + col_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_col_idx.poke(col_addr(i))
            print("X address set to " + x_addr(banks(i)) + "\n")
            c.addr_gen_ctrl(i).in_x_addr.poke(x_addr(banks(i)))
            print("Row ptr address set to " + row_ptr(i) + "\n")
            c.addr_gen_ctrl(i).in_row_ptr.poke(row_ptr(i))
            print("Number of rows: " + rows_per_pe(i) + "\n")
            c.addr_gen_ctrl(i).in_nrows.poke(rows_per_pe(i))
            print("X length to nearest power of 2: " + x_pow_2 + "\n")
            c.addr_gen_ctrl(i).in_xlen_pow2.poke(x_pow_2)
            print("Y address set to " + y_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_y_addr.poke(y_addr(i))
            print("Row start set to " + row_idx(rows_read) + "...\n")
            c.addr_gen_ctrl(i).in_row_start.poke(row_idx(rows_read))
            rows_read += rows_per_pe(i)
          }
          c.clock.step()

          for (i <- 0 until n_pe) {
            c.addr_gen_ctrl(i).reset_setup.poke(false)
          }
          print(
            "Should be generating requests: idle=" + c.ctrl_io.idle
              .peekBoolean() + "\n"
          )

          var iter = 0

          while (!c.ctrl_io.idle.peekBoolean() && !(iter > max_iter)) {
            c.clock.step()
            iter += 1
          }
          print("Iterations: " + iter + "\n")

          if (iter >= max_iter) {
            print("Max iter exceeded!\n")
            // assert(false)
          }
          print("Done generating requests...\n")

          var read_y = Array[Int]()
          for (b <- 0 until n_banks) {
            var tmp = mt_utils.read_mem_interface(
              c.mem_interface_io.req,
              c.mem_interface_io.resp,
              bank_rows(b),
              y_addr(b),
              c
            )
            read_y = Array.concat(read_y, tmp)
          }

          var golden_y = Array.ofDim[scala.Float](nrows)
          var k = 0
          for (i <- 0 until nrows) {
            var sum = 0.0f
            var elem_left = row_idx(i + 1) - row_idx(i)
            while (elem_left > 0) {
              sum += nzA(k) * x(col_idx(k))
              elem_left -= 1
              k += 1
            }
            golden_y(i) = sum
          }
          var passed = true
          val err_threshold = 1e-05
          for (i <- 0 until read_y.size) {
            val rerr = if(golden_y(i) != 0) scala.math.abs(java.lang.Float.intBitsToFloat(read_y(i)) - golden_y(i))/golden_y(i) 
            else { scala.math.abs(java.lang.Float.intBitsToFloat(read_y(i)) - golden_y(i)) }
            if (rerr > err_threshold) {
              print(
                "out(" + i + ")=" + java.lang.Float.intBitsToFloat(
                  read_y(i)
                ) + "\n"
              )
              print("golden_y(" + i + ")=" + golden_y(i) + "\n")
              print("Relative error: " + rerr + "\n")
              passed = false
            }
          }
          //print("--" + read_y.toList + "\n")
          //print("--" + golden_y.toList + "\n")
          assert(passed)
          if (passed && recordResult) {
            val testLine =
              n_pe + "," + n_banks + "," + iter + "," + (iter.toFloat / nzA.size.toFloat) + "," + (nzA.size.toFloat / iter.toFloat) + "," + nrows + "," + ncols + "," + (nzA.size.toFloat / nrows.toFloat) + "," + (1.0f / params.nz_every_x.toFloat) + "," + params.reqQueueSize + "," + params.respQueueSize + "," + params.rowQueue + "," + bank_size + "," + params.dataSize + "," + testName + "\n"

            fw.append(testLine)
            print("Appending: " + testLine)
          }
        }
        fw.close()
      }
    }
  }
}
class SpMVPERecordTester extends AnyFlatSpec with ChiselScalatestTester {
  "DUT" should "work with M ME and N PEs" in {

    val generateVerilog = false
    val recordResult = false
    val testName = "UniformSquare"
    /*val paramArray = Array(
      new SpMVTestParams(
        1, 1, 60, 60, 10, 32, 32, 16, 16384, 32
      )/*,
      new SpMVTestParams(
        2, 2, 80, 80, 10, 32, 32, 16, 1024, 32
      ),
      new SpMVTestParams(
        4, 4, 120, 120, 10, 32, 32, 16, 1024, 32
      ),
      new SpMVTestParams(
        8, 8, 180, 180, 10, 32, 32, 16, 16384, 32
      )*/
    )*/
    //val num_pe_vals = Array(1, 2, 4, 8)
    //val matrix_sizes = Array(60, 80, 120, 180)
    //val bank_size = 1024
    //val req_resp_queue_sizes = Array(8, 16, 32, 64, 128)
    //val dfe_queue_sizes = Array(8, 16, 32, 64, 128)

    val num_pe_vals = Array(2)
    val matrix_sizes = Array(10)
    val bank_size = 1024
    val req_resp_queue_sizes = Array(16)
    val dfe_queue_sizes = Array(16)

    val paramArray = Array.ofDim[SpMVTestParams](num_pe_vals.size * req_resp_queue_sizes.size * dfe_queue_sizes.size)
    var el = 0
    for(i <- 0 until num_pe_vals.size)
      for(j <- 0 until req_resp_queue_sizes.size)
      for(k <- 0 until dfe_queue_sizes.size) {
        paramArray(el) = new SpMVTestParams(
          num_pe_vals(i), 
          num_pe_vals(i), 
          matrix_sizes(i), 
          matrix_sizes(i), 
          2, 
          req_resp_queue_sizes(j), 
          req_resp_queue_sizes(j), 
          dfe_queue_sizes(k), 
          bank_size, 
          32)
        el += 1
      }

    for (pidx <- 0 until paramArray.size) {
      val params = paramArray(pidx)

      val n_pe = params.n_pe
      val n_banks = params.n_banks
      var filePath =
        "/home/users/francesco.peverelli/chipyard/generators/spatial_templates/test_run_dir/"
      if (generateVerilog) {
        val VerilogEmitter = (new chisel3.stage.ChiselStage).emitVerilog(
          new SpMVPEAssembler(
            n_banks,
            5,
            n_pe,
            params.respQueueSize,
            params.reqQueueSize,
            params.bank_size,
            params.dataSize,
            params.rowQueue
          )
        )
        Files.write(
          Paths.get(filePath + "SpMVPEAssembler.v"),
          VerilogEmitter.getBytes(StandardCharsets.UTF_8)
        )
      }

      test(
        new SpMVPEAssembler(
          n_banks,
          5,
          n_pe,
          params.respQueueSize,
          params.reqQueueSize,
          params.bank_size,
          params.dataSize,
          params.rowQueue
        )
      ) { c =>
        c.clock.step()

        val experimentSchema =
          "PE," + ",BANKS" + ",CYCLES" + ",CYCLES/NNZ" + ",NNZ/CYCLES" + ",ROWS" + ",COLS" + ",NNZ/ROW" + ",DENSITY" + ",REQQ" + ",RESPQ" + ",ROWQ" + ",BANK_SIZE" + ",DATA_SIZE" + ",RUN" + "\n"

        var fileName = "SpMVTestAutomated_v2.csv"
        var filePath =
          "/home/users/francesco.peverelli/chipyard/generators/spatial_templates/test_run_dir/"
        var newFile = false
        if (!Files.exists(Paths.get(filePath + fileName))) {
          newFile = true
        }
        val fw = if (Files.exists(Paths.get(filePath + fileName))) {
          new FileWriter(new File(filePath + fileName), true)
        } else {
          new FileWriter(filePath + fileName, true)
        }
        if (newFile) {
          fw.append(experimentSchema)
        }

        val bank_size =
          params.bank_size // refer to the 10 bit address (default in BRAMLikeMem)

        // Generate sample problem
        // Divide sample problem across the available memory banks (in this case 1)
        // For each bank, divide rows assigning them to the available PEs
        //  1. figure out what to do if no rows are available for some
        //  3. compute split addressing for the data
        val nrows = params.nrows
        val ncols = params.ncols
        val sputil = new SparseTestUtils()

        val nrep = if (recordResult) 30 else 1
        for (rep <- 0 until nrep) {

          val (row_idx, col_idx, nzA, x) =
            sputil.generate_crs_data(
              nrows,
              ncols,
              nz_every_x = params.nz_every_x
            )

          var x_cpy = x.length
          var msb = 0
          while (x_cpy != 0) {
            x_cpy = x_cpy / 2
            msb += 1
          }
          val x_pow_2 = (1 << msb)
          val x_chunk_size = x_pow_2 / n_banks

          val (
            banks,
            nz_addr,
            col_addr,
            row_ptr,
            x_addr,
            y_addr,
            rows_per_pe,
            bank_nnz,
            bank_rows
          ) =
            sputil.get_nz_split_mem_ptr(
              nzA.size,
              col_idx,
              row_idx,
              x_chunk_size,
              n_pe,
              n_banks,
              bank_size
            )

          print("NZ: " + nzA.toList + "\n")
          print("x: " + x.toList + "\n")
          print("col_idx: " + col_idx.toList + "\n")
          print("row_idx: " + row_idx.toList + "\n")

          print("Banks: " + banks.toList + "\n")
          print("NZ addr: " + nz_addr.toList + "\n")
          print("col_addr: " + col_addr.toList + "\n")
          print("Row ptr: " + row_ptr.toList + "\n")
          print("Y addr: " + y_addr.toList + "\n")
          print("X addr: " + x_addr.toList + "\n")

          val mt_utils = new MemTestUtils(bank_size * n_banks)
          val pe_per_bank = n_pe / n_banks
          print("X divided in chunks of " + x_chunk_size + "\n")

          var nz_read = 0
          var rptr_read = 0
          for (b <- 0 until n_banks) {
            print("Writing to memory bank " + b + "...\n")
            var x_data_size = x_chunk_size
            if ((b + 1) * x_chunk_size > x.size) {
              x_data_size = x.size - b * x_chunk_size
              x_data_size = Math.max(x_data_size, 0).toInt
            }
            print("x data size: " + x_data_size + "\n")
            print("b*pe_per_bank=" + (b * pe_per_bank) + "\n")
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              nzA,
              nz_addr(b * pe_per_bank),
              c,
              java.lang.Float.floatToIntBits,
              bank_nnz(b),
              write_offset = nz_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              col_idx,
              col_addr(b * pe_per_bank),
              c,
              data_to_write = bank_nnz(b),
              write_offset = nz_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              row_idx,
              row_ptr(b * pe_per_bank),
              c,
              data_to_write = bank_rows(b) + 1,
              write_offset = rptr_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              x,
              x_addr(b),
              c,
              java.lang.Float.floatToIntBits,
              x_data_size,
              write_offset = b * x_chunk_size
            )

            print("Reading back written data...\n")

            print("nz_addr:" + nz_addr.toList + "\n")
            print("bank_nnz: " + bank_nnz.toList + "\n")

            val data_to_read = 2 * bank_nnz(b) + bank_rows(b) + 1 + x_chunk_size

            if (!recordResult) {

              var read_data = mt_utils.read_mem_interface(
                c.mem_interface_io.req,
                c.mem_interface_io.resp,
                data_to_read,
                b * bank_size,
                c
              )

              val data_req_per_bank = data_to_read + bank_rows(b)

              print(
                "Requested " + data_req_per_bank + " addresses to bank " + b + "...\n"
              )
              assert(data_req_per_bank <= bank_size)

              print("Checking for correctness...\n")

              var check_start = 0
              // TODO: make read addresses bank-relative
              mt_utils.assert_buffer[Int, scala.Float](
                read_data,
                nzA,
                nz_addr(b * pe_per_bank) % bank_size,
                java.lang.Float.intBitsToFloat,
                until = bank_nnz(b),
                expected_base_addr = nz_read
              )
              mt_utils.assert_buffer[Int, Int](
                read_data,
                col_idx,
                col_addr(b * pe_per_bank) % bank_size,
                until = bank_nnz(b),
                expected_base_addr = nz_read
              )
              mt_utils.assert_buffer[Int, Int](
                read_data,
                row_idx,
                row_ptr(b * pe_per_bank) % bank_size,
                until = bank_rows(b) + 1,
                expected_base_addr = rptr_read
              )
              mt_utils.assert_buffer[Int, scala.Float](
                read_data,
                x,
                x_addr(b) % bank_size,
                java.lang.Float.intBitsToFloat,
                until = x_data_size,
                expected_base_addr = b * x_chunk_size
              )
            }

            nz_read += bank_nnz(b)
            rptr_read += bank_rows(b)
          }

          var rows_read = 0
          for (i <- 0 until n_pe) {
            print("Setting up problem dimensions to PE " + i + "...\n")
            c.addr_gen_ctrl(i).reset_setup.poke(true)
            print("A address set to " + nz_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_A.poke(nz_addr(i))
            print("Col idx address set to " + col_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_col_idx.poke(col_addr(i))
            print("X address set to " + x_addr(banks(i)) + "\n")
            c.addr_gen_ctrl(i).in_x_addr.poke(x_addr(banks(i)))
            print("Row ptr address set to " + row_ptr(i) + "\n")
            c.addr_gen_ctrl(i).in_row_ptr.poke(row_ptr(i))
            print("Number of rows: " + rows_per_pe(i) + "\n")
            c.addr_gen_ctrl(i).in_nrows.poke(rows_per_pe(i))
            print("X length to nearest power of 2: " + x_pow_2 + "\n")
            c.addr_gen_ctrl(i).in_xlen_pow2.poke(x_pow_2)
            print("Y address set to " + y_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_y_addr.poke(y_addr(i))
            print("Row start set to " + row_idx(rows_read) + "...\n")
            c.addr_gen_ctrl(i).in_row_start.poke(row_idx(rows_read))
            rows_read += rows_per_pe(i)
          }
          c.clock.step()

          for (i <- 0 until n_pe) {
            c.addr_gen_ctrl(i).reset_setup.poke(false)
          }
          print(
            "Should be generating requests: idle=" + c.ctrl_io.idle
              .peekBoolean() + "\n"
          )

          c.clock.setTimeout(20000)
          val max_iter = 10000
          var iter = 0

          while (!c.ctrl_io.idle.peekBoolean() && !(iter > max_iter)) {
            c.clock.step()
            iter += 1
          }
          print("Iterations: " + iter + "\n")

          if (iter >= max_iter) {
            print("Max iter exceeded!\n")
            // assert(false)
          }
          print("Done generating requests...\n")

          var read_y = Array[Int]()
          for (b <- 0 until n_banks) {
            var tmp = mt_utils.read_mem_interface(
              c.mem_interface_io.req,
              c.mem_interface_io.resp,
              bank_rows(b),
              y_addr(b),
              c
            )
            read_y = Array.concat(read_y, tmp)
          }

          var golden_y = Array.ofDim[scala.Float](nrows)
          var k = 0
          for (i <- 0 until nrows) {
            var sum = 0.0f
            var elem_left = row_idx(i + 1) - row_idx(i)
            while (elem_left > 0) {
              sum += nzA(k) * x(col_idx(k))
              elem_left -= 1
              k += 1
            }
            golden_y(i) = sum
          }
          var passed = true
          for (i <- 0 until read_y.size) {
            if (java.lang.Float.intBitsToFloat(read_y(i)) != golden_y(i)) {
              print(
                "out(" + i + ")=" + java.lang.Float.intBitsToFloat(
                  read_y(i)
                ) + "\n"
              )
              print("golden_y(" + i + ")=" + golden_y(i) + "\n")
              passed = false
            }
          }
          print("--" + read_y.toList + "\n")
          print("--" + golden_y.toList + "\n")
          assert(passed)
          if (passed && recordResult) {
            val testLine =
              n_pe + "," + n_banks + "," + iter + "," + (iter.toFloat / nzA.size.toFloat) + "," + (nzA.size.toFloat / iter.toFloat) + "," + nrows + "," + ncols + "," + (nzA.size.toFloat / nrows.toFloat) + "," + (1.0f / params.nz_every_x.toFloat) + "," + params.reqQueueSize + "," + params.respQueueSize + "," + params.rowQueue + "," + params.bank_size + "," + params.dataSize + "," + testName + "\n"

            fw.append(testLine)
            print("Appending: " + testLine)
          }
        }
        fw.close()
      }
    }
  }
}
class SpMVPERecordHPCGTester extends AnyFlatSpec with ChiselScalatestTester {
  "DUT" should "work with M ME and N PEs on HPCG matrices" in {

    val generateVerilog = false
    val recordResult = true
    val testName = "HPCG-like"
    val num_pe_vals = Array(8)
    val matrix_sizes = Array(1728)
    val bank_size = 32768
    val req_resp_queue_sizes = Array(64)
    val dfe_queue_sizes = Array(64)

    val paramArray = Array.ofDim[SpMVTestParams](num_pe_vals.size * req_resp_queue_sizes.size * dfe_queue_sizes.size)
    var el = 0
    for(i <- 0 until num_pe_vals.size)
      for(j <- 0 until req_resp_queue_sizes.size)
      for(k <- 0 until dfe_queue_sizes.size) {
        paramArray(el) = new SpMVTestParams(
          num_pe_vals(i), 
          num_pe_vals(i), 
          matrix_sizes(i), 
          matrix_sizes(i), 
          10, 
          req_resp_queue_sizes(j), 
          req_resp_queue_sizes(j), 
          dfe_queue_sizes(k), 
          bank_size, 
          32)
        el += 1
      }

    for (pidx <- 0 until paramArray.size) {
      val params = paramArray(pidx)

      val n_pe = params.n_pe
      val n_banks = params.n_banks
      var filePath =
        "/home/users/francesco.peverelli/chipyard/generators/spatial_templates/test_run_dir/"
      if (generateVerilog) {
        val VerilogEmitter = (new chisel3.stage.ChiselStage).emitVerilog(
          new SpMVPEAssembler(
            n_banks,
            5,
            n_pe,
            params.respQueueSize,
            params.reqQueueSize,
            params.bank_size,
            params.dataSize,
            params.rowQueue
          )
        )
        Files.write(
          Paths.get(filePath + "SpMVPEAssembler.v"),
          VerilogEmitter.getBytes(StandardCharsets.UTF_8)
        )
      }

      test(
        new SpMVPEAssembler(
          n_banks,
          5,
          n_pe,
          params.respQueueSize,
          params.reqQueueSize,
          params.bank_size,
          params.dataSize,
          params.rowQueue
        )
      ) { c =>
        c.clock.step()
        c.clock.setTimeout(0)
        val max_iter = 10000000
        val experimentSchema =
          "PE," + ",BANKS" + ",CYCLES" + ",CYCLES/NNZ" + ",NNZ/CYCLES" + ",ROWS" + ",COLS" + ",NNZ/ROW" + ",DENSITY" + ",REQQ" + ",RESPQ" + ",ROWQ" + ",BANK_SIZE" + ",DATA_SIZE" + ",RUN" + "\n"

        var fileName = "SpMVTestAutomated_hpcg-like.csv"
        var filePath =
          "/home/users/francesco.peverelli/chipyard/generators/spatial_templates/test_run_dir/"
        var newFile = false
        if (!Files.exists(Paths.get(filePath + fileName))) {
          newFile = true
        }
        val fw = if (Files.exists(Paths.get(filePath + fileName))) {
          new FileWriter(new File(filePath + fileName), true)
        } else {
          new FileWriter(filePath + fileName, true)
        }
        if (newFile) {
          fw.append(experimentSchema)
        }

        val bank_size =
          params.bank_size // refer to the 10 bit address (default in BRAMLikeMem)

        // Generate sample problem
        // Divide sample problem across the available memory banks (in this case 1)
        // For each bank, divide rows assigning them to the available PEs
        //  1. figure out what to do if no rows are available for some
        //  3. compute split addressing for the data
        val nrows = params.nrows
        val ncols = params.ncols
        val sputil = new SparseTestUtils()
        val nx = scala.math.cbrt(nrows.toDouble).toInt
        val ny = nx
        val nz = nx

        val nrep = if (recordResult) 2 else 1
        for (rep <- 0 until nrep) {

          val (row_idx, col_idx, nzA, x) =
            sputil.generate_hpcg_problem(
              nx, ny, nz
            )

          var x_cpy = x.length
          var msb = 0
          while (x_cpy != 0) {
            x_cpy = x_cpy / 2
            msb += 1
          }
          val x_pow_2 = (1 << msb)
          val x_chunk_size = x_pow_2 / n_banks

          val (
            banks,
            nz_addr,
            col_addr,
            row_ptr,
            x_addr,
            y_addr,
            rows_per_pe,
            bank_nnz,
            bank_rows
          ) =
            sputil.get_row_split_mem_ptr(
              nzA.size,
              col_idx,
              row_idx,
              x_chunk_size,
              n_pe,
              n_banks,
              bank_size
            )

          print("NZ: " + nzA.toList + "\n")
          print("x: " + x.toList + "\n")
          print("col_idx: " + col_idx.toList + "\n")
          print("row_idx: " + row_idx.toList + "\n")

          print("Banks: " + banks.toList + "\n")
          print("NZ addr: " + nz_addr.toList + "\n")
          print("col_addr: " + col_addr.toList + "\n")
          print("Row ptr: " + row_ptr.toList + "\n")
          print("Y addr: " + y_addr.toList + "\n")
          print("X addr: " + x_addr.toList + "\n")

          val mt_utils = new MemTestUtils(bank_size * n_banks)
          val pe_per_bank = n_pe / n_banks
          print("X divided in chunks of " + x_chunk_size + "\n")

          var nz_read = 0
          var rptr_read = 0
          for (b <- 0 until n_banks) {
            print("Writing to memory bank " + b + "...\n")
            var x_data_size = x_chunk_size
            if ((b + 1) * x_chunk_size > x.size) {
              x_data_size = x.size - b * x_chunk_size
              x_data_size = Math.max(x_data_size, 0).toInt
            }
            print("x data size: " + x_data_size + "\n")
            print("b*pe_per_bank=" + (b * pe_per_bank) + "\n")
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              nzA,
              nz_addr(b * pe_per_bank),
              c,
              java.lang.Float.floatToIntBits,
              bank_nnz(b),
              write_offset = nz_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              col_idx,
              col_addr(b * pe_per_bank),
              c,
              data_to_write = bank_nnz(b),
              write_offset = nz_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              row_idx,
              row_ptr(b * pe_per_bank),
              c,
              data_to_write = bank_rows(b) + 1,
              write_offset = rptr_read
            )
            mt_utils.write_mem_interface(
              c.mem_interface_io.req,
              x,
              x_addr(b),
              c,
              java.lang.Float.floatToIntBits,
              x_data_size,
              write_offset = b * x_chunk_size
            )

            print("Reading back written data...\n")

            print("nz_addr:" + nz_addr.toList + "\n")
            print("bank_nnz: " + bank_nnz.toList + "\n")

            val data_to_read = 2 * bank_nnz(b) + bank_rows(b) + 1 + x_chunk_size

            if (!recordResult) {

              var read_data = mt_utils.read_mem_interface(
                c.mem_interface_io.req,
                c.mem_interface_io.resp,
                data_to_read,
                b * bank_size,
                c
              )

              val data_req_per_bank = data_to_read + bank_rows(b)

              print(
                "Requested " + data_req_per_bank + " addresses to bank " + b + "...\n"
              )
              assert(data_req_per_bank <= bank_size)

              print("Checking for correctness...\n")

              var check_start = 0
              // TODO: make read addresses bank-relative
              mt_utils.assert_buffer[Int, scala.Float](
                read_data,
                nzA,
                nz_addr(b * pe_per_bank) % bank_size,
                java.lang.Float.intBitsToFloat,
                until = bank_nnz(b),
                expected_base_addr = nz_read
              )
              mt_utils.assert_buffer[Int, Int](
                read_data,
                col_idx,
                col_addr(b * pe_per_bank) % bank_size,
                until = bank_nnz(b),
                expected_base_addr = nz_read
              )
              mt_utils.assert_buffer[Int, Int](
                read_data,
                row_idx,
                row_ptr(b * pe_per_bank) % bank_size,
                until = bank_rows(b) + 1,
                expected_base_addr = rptr_read
              )
              mt_utils.assert_buffer[Int, scala.Float](
                read_data,
                x,
                x_addr(b) % bank_size,
                java.lang.Float.intBitsToFloat,
                until = x_data_size,
                expected_base_addr = b * x_chunk_size
              )
            }

            nz_read += bank_nnz(b)
            rptr_read += bank_rows(b)
          }

          var rows_read = 0
          for (i <- 0 until n_pe) {
            print("Setting up problem dimensions to PE " + i + "...\n")
            c.addr_gen_ctrl(i).reset_setup.poke(true)
            print("A address set to " + nz_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_A.poke(nz_addr(i))
            print("Col idx address set to " + col_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_col_idx.poke(col_addr(i))
            print("X address set to " + x_addr(banks(i)) + "\n")
            c.addr_gen_ctrl(i).in_x_addr.poke(x_addr(banks(i)))
            print("Row ptr address set to " + row_ptr(i) + "\n")
            c.addr_gen_ctrl(i).in_row_ptr.poke(row_ptr(i))
            print("Number of rows: " + rows_per_pe(i) + "\n")
            c.addr_gen_ctrl(i).in_nrows.poke(rows_per_pe(i))
            print("X length to nearest power of 2: " + x_pow_2 + "\n")
            c.addr_gen_ctrl(i).in_xlen_pow2.poke(x_pow_2)
            print("Y address set to " + y_addr(i) + "\n")
            c.addr_gen_ctrl(i).in_y_addr.poke(y_addr(i))
            print("Row start set to " + row_idx(rows_read) + "...\n")
            c.addr_gen_ctrl(i).in_row_start.poke(row_idx(rows_read))
            rows_read += rows_per_pe(i)
          }
          c.clock.step()

          for (i <- 0 until n_pe) {
            c.addr_gen_ctrl(i).reset_setup.poke(false)
          }
          print(
            "Should be generating requests: idle=" + c.ctrl_io.idle
              .peekBoolean() + "\n"
          )

          var iter = 0

          while (!c.ctrl_io.idle.peekBoolean() && !(iter > max_iter)) {
            c.clock.step()
            iter += 1
          }
          print("Iterations: " + iter + "\n")

          if (iter >= max_iter) {
            print("Max iter exceeded!\n")
            // assert(false)
          }
          print("Done generating requests...\n")

          var read_y = Array[Int]()
          for (b <- 0 until n_banks) {
            var tmp = mt_utils.read_mem_interface(
              c.mem_interface_io.req,
              c.mem_interface_io.resp,
              bank_rows(b),
              y_addr(b),
              c
            )
            read_y = Array.concat(read_y, tmp)
          }

          var golden_y = Array.ofDim[scala.Float](nrows)
          var k = 0
          for (i <- 0 until nrows) {
            var sum = 0.0f
            var elem_left = row_idx(i + 1) - row_idx(i)
            while (elem_left > 0) {
              sum += nzA(k) * x(col_idx(k))
              elem_left -= 1
              k += 1
            }
            golden_y(i) = sum
          }
          var passed = true
          for (i <- 0 until read_y.size) {
            if (java.lang.Float.intBitsToFloat(read_y(i)) != golden_y(i)) {
              print(
                "out(" + i + ")=" + java.lang.Float.intBitsToFloat(
                  read_y(i)
                ) + "\n"
              )
              print("golden_y(" + i + ")=" + golden_y(i) + "\n")
              passed = false
            }
          }
          print("--" + read_y.toList + "\n")
          print("--" + golden_y.toList + "\n")
          assert(passed)
          if (passed && recordResult) {
            val testLine =
              n_pe + "," + n_banks + "," + iter + "," + (iter.toFloat / nzA.size.toFloat) + "," + (nzA.size.toFloat / iter.toFloat) + "," + nrows + "," + ncols + "," + (nzA.size.toFloat / nrows.toFloat) + "," + (1.0f / params.nz_every_x.toFloat) + "," + params.reqQueueSize + "," + params.respQueueSize + "," + params.rowQueue + "," + params.bank_size + "," + params.dataSize + "," + testName + "\n"

            fw.append(testLine)
            print("Appending: " + testLine)
          }
        }
        fw.close()
      }
    }
  }
}