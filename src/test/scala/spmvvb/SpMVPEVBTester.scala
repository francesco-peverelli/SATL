package spatial_templates

import chisel3._
import chiseltest._
import chisel3.util._
import mi._
import me._
import pe._
import spmvvb._
import template._
import utils._
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
import os.truncate

class SpMVVBTestParams(
    val n_pe: Int,
    val local_n_banks: Int,
    val vb_n_banks: Int,
    val nrows: Int,
    val ncols: Int,
    val nz_every_x: Int,
    val respQueueSize: Int,
    val reqQueueSize: Int,
    val rowQueue: Int,
    val local_bank_size: Int,
    val v_bank_size: Int,
    val dataSize: Int
) {}

class SpMVVBTestMEInterfaceIO(data_size: Int, n_pe: Int) extends Bundle {
  val v_req = Flipped(Decoupled(new MemRequestIO(data_size, data_size)))
  val v_resp = Decoupled(UInt(data_size.W))
  val local_req = Vec(n_pe, Flipped(Decoupled(new MemRequestIO(data_size, data_size))))
  val local_resp = Vec(n_pe, Decoupled(UInt(data_size.W)))
}

class SpMVPEVBAssembler(
    local_n_banks: Int,
    v_n_banks: Int,
    n_queues: Int,
    n_pe: Int,
    resp_q_size: Int,
    local_req_q_size: Int,
    v_req_q_size: Int,
    local_bank_size: Int,
    v_bank_size: Int,
    data_size: Int,
    dfe_q_size: Int
) extends Module
    with WithNtoMMemInterfaceSeq
    with WithDataflowPE
    with WithNToMDataflowToMem
    with With2DBRAMLikeMEM {

    val local_mems = Seq.tabulate[BRAMLikeMem1](local_n_banks)(n =>
    Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), 36, log2Up(local_bank_size))))

    val mems = Seq(Seq.tabulate[BRAMLikeMem1](v_n_banks)(n =>
    Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), 36, log2Up(v_bank_size)))), local_mems)

    val local_mem_interfaces = Seq.tabulate[NtoMMemInterface](local_n_banks)(n =>
      Module(new NtoMMemInterface(
      data_size, // p_width,
      log2Up(local_bank_size), // addr_width,
      1, // n_banks,
      5, // A, col, row, y, test
      local_req_q_size // q_depth
    )))

    // Interface 0 connects VBs, interfaces 1 - n_pe-1 connect to local mems 
    val me_interfaces = Module(
    new NtoMMemInterface(
      data_size, // p_width,
      log2Up(v_bank_size), // addr_width,
      v_n_banks, // n_banks,
      n_pe + 1, // n_queue,
      v_req_q_size // q_depth
    )
  ) +: local_mem_interfaces 

  // !CONNECT INTERFACES
  me_interfaces(0).connectMems(mems(0))
  for(i <- 0 until local_n_banks) {
    me_interfaces(i+1).connectMems(Seq(mems(1)(i)))
  }

  val df_pe = Seq.tabulate[SpMVVBPE](n_pe)(n =>
    Module(
      new SpMVVBPE(
        new ElemId(3, n, 0, 0),
        new CtrlInterfaceIO(),
        data_size, // p_width
        log2Up(local_bank_size), // addr_width
        log2Up(v_bank_size), // x addr width
        data_size, // data_width
        resp_q_size, // rQueueDepth
        local_n_banks, // local_n_banks
        v_n_banks, // vb_n_banks
        n, // bank_id
        dfe_q_size
      )
    )
  )

  // !CONNECT PEs
  for (i <- 0 until df_pe.size) {
    connectDFPEToNtoMMEInterface(
      me_interfaces(0),
      df_pe(i),
      i+1,
      i+1,
      Array(true)
    )
    connectDFPEToNtoMMEInterfaceInterleaved(
      me_interfaces(i+1),
      df_pe(i),
      0, // PE Idx is always zero, is the only PE
      1, // Only one PE connects to each interface
      Array(true, true, true, false),
      1, // start offset (leave room for test channel)
      1  // map_offs: start from the second queue in the PE
    )
  }

  // Connect test channels for each interface
  val me_interface_io = IO(new SpMVVBTestMEInterfaceIO(data_size, n_pe))
  me_interface_io.v_req <> me_interfaces(0).io.inReq(0)
  me_interface_io.v_resp <> me_interfaces(0).io.outData(0)
  for (i <- 0 until df_pe.size) {
    me_interface_io.local_req(i) <> me_interfaces(i+1).io.inReq(0)
    me_interface_io.local_resp(i) <> me_interfaces(i+1).io.outData(0)
  }

  // Additional control 
    // Passthrough PE addr_gen ctrl
  val addr_gen_ctrl = IO(
    Vec(
      n_pe,
      new SpMVVBAddrGenPassthroughIO(log2Up(local_bank_size), log2Up(v_bank_size), data_size, local_n_banks, v_n_banks)
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

class SpMVPEVBTester extends AnyFlatSpec with ChiselScalatestTester {
"DUT" should "instantiate SpMVPEVBAssembler" in {
    val generateVerilog = true
    var filePath =
      "/home/users/francesco.peverelli/chipyard/generators/spatial_templates/test_run_dir/"
    if (generateVerilog) {
            val VerilogEmitter = (new chisel3.stage.ChiselStage).emitVerilog(
              new SpMVPEVBAssembler(
                4, // local_n_banks
                4, // vb_n_banks
                5, // n_queues total
                4, //n_pe,
                32, //resp_q_size,
                32, //local_req_q_size,
                32, //v_req_q_size,
                1024, //local_bank_size,
                512, //v_bank_size,
                32, //data_size,
                32, //dfe_q_size
              )
            )
            Files.write(
              Paths.get(filePath + "SpMVPEAssembler.v"),
              VerilogEmitter.getBytes(StandardCharsets.UTF_8)
            )
          }
    test(
      new SpMVPEVBAssembler(
        4, // local_n_banks
        4, // vb_n_banks
        5, // n_queues total
        4, //n_pe,
        32, //resp_q_size,
        32, //local_req_q_size,
        32, //v_req_q_size,
        1024, //local_bank_size,
        512, //v_bank_size,
        32, //data_size,
        32, //dfe_q_size
      )
    ) { c =>
      c.clock.step()
    }
  }
  "DUT" should "work with M ME and N PEs" in {

    val generateVerilog = false
    val recordResult = true
    val testName = "SingleRow"
    val paramArray = Array(
      new SpMVVBTestParams(
        1, 1, 1, 1, 4095, 1, 16384, 16384, 16, 16384, 16384, 32
      ),
      new SpMVVBTestParams(
        2, 2, 1, 2, 4095, 1, 16384, 16384, 16, 16384, 16384, 32
      ),
      new SpMVVBTestParams(
        4, 4, 2, 4, 4095, 1, 16384, 16384, 16, 16384, 16384, 32
      ),
      new SpMVVBTestParams(
        8, 8, 4, 8, 4095, 1, 16384, 16384, 16, 16384, 16384, 32
      )
    )

    for (pidx <- 0 until paramArray.size) {
      val params = paramArray(pidx)

      val n_pe = params.n_pe
      val local_n_banks = params.local_n_banks
      var filePath =
        "/home/users/francesco.peverelli/chipyard/generators/spatial_templates/test_run_dir/"
      if (generateVerilog) {
        val VerilogEmitter = (new chisel3.stage.ChiselStage).emitVerilog(
          new SpMVPEVBAssembler(
            params.local_n_banks, // n_banks
            params.vb_n_banks,
            5, // n_queues total
            params.n_pe, //n_pe,
            params.respQueueSize, //resp_q_size,
            params.reqQueueSize, //local_req_q_size,
            params.reqQueueSize, //v_req_q_size,
            params.local_bank_size, //local_bank_size,
            params.v_bank_size, //v_bank_size,
            params.dataSize, //data_size,
            params.rowQueue, //dfe_q_size
          )
        )
        Files.write(
          Paths.get(filePath + "SpMVPEAssembler.v"),
          VerilogEmitter.getBytes(StandardCharsets.UTF_8)
        )
      }

      test(
        new SpMVPEVBAssembler(
            params.local_n_banks, // n_banks
            params.vb_n_banks,
            5, // n_queues total
            params.n_pe, //n_pe,
            params.respQueueSize, //resp_q_size,
            params.reqQueueSize, //local_req_q_size,
            params.reqQueueSize, //v_req_q_size,
            params.local_bank_size, //local_bank_size,
            params.v_bank_size, //v_bank_size,
            params.dataSize, //data_size,
            params.rowQueue, //dfe_q_size
        )
      ) { c =>
        c.clock.step()
        c.clock.setTimeout(1000000)
        val max_iter = 500000
        val experimentSchema =
          "PE," + ",BANKS" + ",CYCLES" + ",CYCLES/NNZ" + ",NNZ/CYCLES" + ",ROWS" + ",COLS" + ",NNZ/ROW" + ",DENSITY" + ",REQQ" + ",RESPQ" + ",ROWQ" + ",BANK_SIZE" + ",DATA_SIZE" + ",RUN" + "\n"

        var fileName = "SpMVVBTest.csv"
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

        val local_bank_size =
          params.local_bank_size // refer to the 10 bit address (default in BRAMLikeMem)

        // Generate sample problem
        // Divide sample problem across the available memory banks (in this case 1)
        // For each bank, divide rows assigning them to the available PEs
        //  1. figure out what to do if no rows are available for some
        //  3. compute split addressing for the data
        val nrows = params.nrows
        val ncols = params.ncols
        val sputil = new SparseTestUtils()

        val nrep = if (recordResult) 3 else 1
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
          var x_pow_2 = (1 << msb)
          if(x_pow_2 >= x.length*2){
            x_pow_2 = (x_pow_2 >> 1)
          }
          val x_chunk_size = x_pow_2 / params.vb_n_banks
          print("x_pow_2 = " + x_pow_2 + "\n")

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
            sputil.get_row_split_mem_ptr_x_split(
              nzA.size,
              col_idx,
              row_idx,
              x_chunk_size,
              n_pe,
              params.local_n_banks,
              params.vb_n_banks,
              local_bank_size,
              params.v_bank_size
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

          val mt_utils = new MemTestUtils(local_bank_size * local_n_banks)
          val pe_per_bank = n_pe / local_n_banks
          print("X divided in chunks of " + x_chunk_size + "\n")

          for(b <- 0 until params.vb_n_banks) {
             print("Writing to memory bank " + b + "...\n")
            var x_data_size = x_chunk_size
            if ((b + 1) * x_chunk_size > x.size) {
              x_data_size = x.size - b * x_chunk_size
              x_data_size = Math.max(x_data_size, 0).toInt
            }           
            print("x data size: " + x_data_size + "\n")
            mt_utils.write_mem_interface(
              c.me_interface_io.v_req,
              x,
              x_addr(b),
              c,
              java.lang.Float.floatToIntBits,
              x_data_size,
              write_offset = b * x_chunk_size
            )

            if(!recordResult) {
              var x_read_data = mt_utils.read_mem_interface(
                c.me_interface_io.v_req,
                c.me_interface_io.v_resp,
                x_chunk_size,
                b * params.v_bank_size, // Base address should be relative to bank for x
                c
              )

              mt_utils.assert_buffer[Int, scala.Float](
                x_read_data,
                x,
                x_addr(b) % params.v_bank_size,
                java.lang.Float.intBitsToFloat,
                until = x_data_size,
                expected_base_addr = b * x_chunk_size
              )
            }
          }
          var nz_read = 0
          var rptr_read = 0
          for (b <- 0 until local_n_banks) {
            print("Writing to memory bank " + b + "...\n")
            print("b*pe_per_bank=" + (b * pe_per_bank) + "\n")
            mt_utils.write_mem_interface(
              c.me_interface_io.local_req(b),
              nzA,
              nz_addr(b * pe_per_bank),
              c,
              java.lang.Float.floatToIntBits,
              bank_nnz(b),
              write_offset = nz_read
            )
            mt_utils.write_mem_interface(
              c.me_interface_io.local_req(b),
              col_idx,
              col_addr(b * pe_per_bank),
              c,
              data_to_write = bank_nnz(b),
              write_offset = nz_read
            )
            mt_utils.write_mem_interface(
              c.me_interface_io.local_req(b),
              row_idx,
              row_ptr(b * pe_per_bank),
              c,
              data_to_write = bank_rows(b) + 1,
              write_offset = rptr_read
            )

            print("Reading back written data...\n")

            print("nz_addr:" + nz_addr.toList + "\n")
            print("bank_nnz: " + bank_nnz.toList + "\n")

            val data_to_read = 2 * bank_nnz(b) + bank_rows(b) + 1 

            if (!recordResult) {

              var read_data = mt_utils.read_mem_interface(
                c.me_interface_io.local_req(b),
                c.me_interface_io.local_resp(b),
                data_to_read,
                0, // Base address should be 0 for all banks
                c
              )

              val data_req_per_bank = data_to_read + bank_rows(b)

              print(
                "Requested " + data_req_per_bank + " addresses to bank " + b + "...\n"
              )
              assert(data_req_per_bank <= local_bank_size)

              print("Checking for correctness...\n")

              var check_start = 0
              // TODO: make read addresses bank-relative
              mt_utils.assert_buffer[Int, scala.Float](
                read_data,
                nzA,
                nz_addr(b * pe_per_bank) % local_bank_size,
                java.lang.Float.intBitsToFloat,
                until = bank_nnz(b),
                expected_base_addr = nz_read
              )
              mt_utils.assert_buffer[Int, Int](
                read_data,
                col_idx,
                col_addr(b * pe_per_bank) % local_bank_size,
                until = bank_nnz(b),
                expected_base_addr = nz_read
              )
              mt_utils.assert_buffer[Int, Int](
                read_data,
                row_idx,
                row_ptr(b * pe_per_bank) % local_bank_size,
                until = bank_rows(b) + 1,
                expected_base_addr = rptr_read
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
          for (b <- 0 until local_n_banks) {
            var tmp = mt_utils.read_mem_interface(
              c.me_interface_io.local_req(b),
              c.me_interface_io.local_resp(b),
              bank_rows(b),
              y_addr(b),
              c
            )
            read_y = Array.concat(read_y, tmp)
          }

          var golden_y = Array.ofDim[scala.Double](nrows)
          var k = 0
          for (i <- 0 until nrows) {
            var sum = 0.0
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
              n_pe + "," + local_n_banks + "," + params.vb_n_banks + "," + iter + "," + (iter.toFloat / nzA.size.toFloat) + "," + (nzA.size.toFloat / iter.toFloat) + "," + nrows + "," + ncols + "," + (nzA.size.toFloat / nrows.toFloat) + "," + (1.0f / params.nz_every_x.toFloat) + "," + params.reqQueueSize + "," + params.respQueueSize + "," + params.rowQueue + "," + params.local_bank_size + "," + params.dataSize + "," + testName + "\n"

            fw.append(testLine)
            print("Appending: " + testLine)
          }
        }
        fw.close()
      }
    }
  }
}
