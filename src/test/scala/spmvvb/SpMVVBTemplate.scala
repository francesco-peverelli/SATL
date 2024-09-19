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

import spmvvb._
import utils._

class SpMVVBTemplateTest extends AnyFlatSpec with ChiselScalatestTester {
  "DUT" should "instantiate SpMV template" in {
    val dataRows = 494
    val dataCols = 494
    val dataNnz = 1080
    val generateVerilog = true
    val recordResult = true
    val fromFile = true
    val checkData = false
    val split_DFE = true
    val inFileName = "/home/users/francesco.peverelli/testing-chipyard-setup/chipyard/generators/spatial_templates/src/main/resources/datasets/494_bus/494_bus.mtx"
    val testName = "bcsstk01_unbalanced"
    val inX = "/home/users/francesco.peverelli/testing-chipyard-setup/chipyard/generators/spatial_templates/src/main/resources/iofiles/494_bus.mtx-input.txt"
    val paramArray = Array(
      /*new SpMVTestParams(
        1, 1, 1, 4, 1, 32, 32, 16, 16384, 32
      ),
      new SpMVVBTestParams(
        2, 2, 8, 8, 1, 1024, 1024, 16, 16384, 32
      )*/
      new SpMVVBTestParams(
        4, 4, 2, dataRows, dataCols, 1, 16, 16, 8, 2048, 256, 32
      )/*,
      new SpMVTestParams(
        4, 4, 4, 2048, 1, 1024, 1024, 16, 16384, 32
      ),
      new SpMVTestParams(
        8, 8, 8, 2048, 1, 1024, 1024, 16, 16384, 32
      ),
      new SpMVTestParams(
        16, 16, 16, 2048, 1, 1024, 1024, 16, 16384, 32
      ),
      new SpMVTestParams(
        32, 32, 32, 2048, 1, 1024, 1024, 16, 16384, 32
      ),
      new SpMVTestParams(
        64, 64, 64, 2048, 1, 1024, 1024, 16, 16384, 32
      )*/
    )
    for(pidx <- 0 until paramArray.size) {
      val params = paramArray(pidx)
      val generateVerilog = true
      val checkData = false
      var filePath =
        "/home/users/francesco.peverelli/chipyard/generators/spatial_templates/test_run_dir/"
        if (generateVerilog) {
            val VerilogEmitter = (new chisel3.stage.ChiselStage).emitVerilog(
                new SpMVVBTemplate(
                    params.local_n_banks,
                    params.vb_n_banks,
                    5,
                    params.n_pe,
                    params.respQueueSize,
                    params.reqQueueSize,
                    params.reqQueueSize,
                    params.local_bank_size,
                    params.v_bank_size,
                    params.dataSize,
                    params.rowQueue)
            )
            Files.write(
                Paths.get(filePath + "SpMVPETemplate_" + pidx + ".v"),
                VerilogEmitter.getBytes(StandardCharsets.UTF_8)
            )
        }

        test(new SpMVVBTemplate(
            params.local_n_banks,
            params.vb_n_banks,
            5,
            params.n_pe,
            params.respQueueSize,
            params.reqQueueSize,
            params.reqQueueSize,
            params.local_bank_size,
            params.v_bank_size,
            params.dataSize,
            params.rowQueue
        )) {
            c =>
            c.clock.step()
            c.clock.setTimeout(10000)
            val max_iter = 10000

            // 1. Create a test dataset

            print("Generating data...\n")

            val bank_size = params.local_bank_size
            val nrows = params.nrows
            val ncols = params.ncols
            val sputil = new SparseTestUtils()

            var row_idx = Array.emptyIntArray
            var col_idx = Array.emptyIntArray
            var nzA = Array.emptyFloatArray
            var x = Array.emptyFloatArray
            if(!fromFile) {
              val (row_idx_, col_idx_, nzA_, x_) =
                sputil.generate_crs_data(
                  nrows,
                  ncols,
                  nz_every_x = params.nz_every_x
                )
              row_idx = row_idx_
              col_idx = col_idx_
              nzA = nzA_
              x = x_
            } else {
              val (nz_coo, row_coo, col_coo) = sputil.parse_mm_format(inFileName)
              val (nzA_, col_idx_, row_idx_) = sputil.coo_to_csr(nz_coo, row_coo, col_coo)
              row_idx = row_idx_
              col_idx = col_idx_
              nzA = nzA_
              val rng = scala.util.Random
              var xidx = 0
              var x_ = Array.ofDim[scala.Float](ncols)
              for (line <- Source.fromFile(inX).getLines) {
                x_(xidx) = line.toFloat
                xidx += 1
              }
              //for(i <- 0 until ncols) {
              //  x_(i) = 1.0f
              //}   
              row_idx = row_idx_
              col_idx = col_idx_
              nzA = nzA_
              x = x_
            } 
            // 1.5 setup memory pointers

            print("Generating memory layout...\n")

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
            sputil.get_nz_split_mem_ptr_x_split(
              nzA.size,
              col_idx,
              row_idx,
              x_chunk_size,
              params.n_pe,
              params.local_n_banks,
              params.vb_n_banks,
              params.local_bank_size,
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

            // 2. Generate "RoCC Instructions" to setup
            // 2.1 Write local memory

            print("Testing local memory read and write...\n")

            val spmv_utils = new SpMVTemplateUtils()

            print("X divided in chunks of " + x_chunk_size + "\n")

            var nz_read = 0
            var rptr_read = 0
            val n_banks = params.local_n_banks
            val pe_per_bank = params.n_pe / n_banks
            for (b <- 0 until n_banks) {
              print("Writing to memory bank " + b + "...\n")

              spmv_utils.write_chunk[scala.Float](nzA, nz_read, nz_addr(b * pe_per_bank), bank_nnz(b), c.ctrl_io, c, java.lang.Float.floatToIntBits, mem_id = b+1)
              spmv_utils.write_chunk[Int](col_idx, nz_read, col_addr(b * pe_per_bank), bank_nnz(b), c.ctrl_io, c, mem_id = b+1)
              spmv_utils.write_chunk[Int](row_idx, rptr_read, row_ptr(b * pe_per_bank), bank_rows(b) + 1, c.ctrl_io, c, mem_id = b+1)
              //spmv_utils.write_chunk[scala.Float](x, b * x_chunk_size, x_addr(b), x_data_size, c.ctrl_io, c, java.lang.Float.floatToIntBits, mem_id = 0)

              if(checkData) {
              
                print("Reading back written data...\n")

                val data_to_read = 2 * bank_nnz(b) + bank_rows(b) + 1 
                
                var tmp_buffer = Array.ofDim[Int](data_to_read)
                spmv_utils.read_chunk(tmp_buffer, 0, 0, data_to_read, c.ctrl_io, c, mem_id = b+1)

                val data_req_per_bank = data_to_read + bank_rows(b)

                print("Requested " + data_req_per_bank + " addresses to bank " + b + "...\n")
                assert(data_req_per_bank <= bank_size)

                print("Checking for correctness...\n")
                assert(spmv_utils.buffer_cmp[Int, scala.Float](tmp_buffer, nzA, bank_nnz(b), nz_addr(b * pe_per_bank) % bank_size, nz_read, java.lang.Float.intBitsToFloat))
                assert(spmv_utils.buffer_cmp[Int, Int](tmp_buffer, col_idx, bank_nnz(b), col_addr(b * pe_per_bank) % bank_size, nz_read))
                assert(spmv_utils.buffer_cmp[Int, Int](tmp_buffer, row_idx, bank_rows(b) + 1, row_ptr(b * pe_per_bank) % bank_size, rptr_read))
                //assert(spmv_utils.buffer_cmp[Int, scala.Float](tmp_buffer, x, x_data_size, x_addr(b) % bank_size, b * x_chunk_size, java.lang.Float.intBitsToFloat))
              }

              nz_read += bank_nnz(b)
              rptr_read += bank_rows(b)
            }
            val nvb_banks = params.vb_n_banks
            val pe_per_vbbank = params.n_pe / n_banks
            for (b <- 0 until nvb_banks) {
              print("Writing to memory bank " + b + "...\n")
              var x_data_size = x_chunk_size
              if ((b + 1) * x_chunk_size > x.size) {
                x_data_size = x.size - b * x_chunk_size
                x_data_size = Math.max(x_data_size, 0).toInt
              }
              print("x data size: " + x_data_size + "\n")
              print("b*pe_per_bank=" + (b * pe_per_bank) + "\n")
              
              spmv_utils.write_chunk[scala.Float](x, b * x_chunk_size, x_addr(b), x_data_size, c.ctrl_io, c, java.lang.Float.floatToIntBits, mem_id = 0)
            }

            // 2.2 Write PE registers
            var rows_read = 0
            for (i <- 0 until params.n_pe) {
              spmv_utils.writeSpMVReg(CRAddress.A_ADDR_REG.id, nz_addr(i), i, c.ctrl_io, c)
              print("Setting A_ADDR_REG[" + CRAddress.A_ADDR_REG.id +  "][" + i + "]=" + nz_addr(i) + "\n")
              spmv_utils.writeSpMVReg(CRAddress.COL_ADDR_REG.id, col_addr(i), i, c.ctrl_io, c)
              print("Setting COL_ADDR_REG[" + CRAddress.COL_ADDR_REG.id +  "][" + i + "]=" + col_addr(i) + "\n")
              spmv_utils.writeSpMVReg(CRAddress.X_ADDR_REG.id, 0, i, c.ctrl_io, c)
              print("Setting X_ADDR_REG[" + CRAddress.X_ADDR_REG.id +  "][" + i + "]=" + 0 + "\n")
              spmv_utils.writeSpMVReg(CRAddress.X_LEN_REG.id, x_pow_2, i, c.ctrl_io, c)
              print("Setting X_LEN_REG[" + CRAddress.X_LEN_REG.id +  "][" + i + "]=" + x_pow_2 + "\n")
              spmv_utils.writeSpMVReg(CRAddress.ROW_ADDR_REG.id, row_ptr(i), i, c.ctrl_io, c)
              print("Setting ROW_ADDR_REG[" + CRAddress.ROW_ADDR_REG.id +  "][" + i + "]=" + row_ptr(i) + "\n")
              spmv_utils.writeSpMVReg(CRAddress.N_ROWS_REG.id, rows_per_pe(i), i, c.ctrl_io, c)
              print("Setting N_ROWS_REG[" + CRAddress.N_ROWS_REG.id +  "][" + i + "]=" + rows_per_pe(i) + "\n")
              spmv_utils.writeSpMVReg(CRAddress.ROW_START_REG.id, row_idx(rows_read), i, c.ctrl_io, c)
              print("Setting ROW_START_REG[" + CRAddress.ROW_START_REG.id +  "][" + i + "]=" + row_idx(rows_read) + "\n")
              spmv_utils.writeSpMVReg(CRAddress.Y_ADDR_REG.id, y_addr(i), i, c.ctrl_io, c)
              print("Setting Y_ADDR_REG[" + CRAddress.Y_ADDR_REG.id +  "][" + i + "]=" + y_addr(i) + "\n")
              rows_read += rows_per_pe(i)
            }

            // 3. Compute 

            spmv_utils.pokeExecCommand(c.ctrl_io)

            print("Issued exec command...\n")

            c.clock.step()

            spmv_utils.pokeInterfaceReset(c.ctrl_io)

            var iter = 0
            while(c.ctrl_io.rocc_cmd.resp_valid.peekBoolean() && (iter < 10)) {
              print("Dequeueing valid responses to RoCC Commands...\n")
              c.clock.step()
              iter += 1
            }
            print("Finished dequeueing inflight responses, waiting for computation to finish...\n")

            while (!c.ctrl_io.rocc_cmd.resp_valid.peekBoolean() && !(iter > max_iter)) {
              c.clock.step()
              iter += 1
            }
            print("DONE: Iterations: " + iter + "\n")    
            print("Iteration count: " + c.ctrl_io.rocc_cmd.resp_data.peekInt() + "\n")        

            // 4. Generate "Read back" instruction sequence

            var read_y = Array[Int]()
            for (b <- 0 until n_banks) {
              var tmp_buffer = Array.ofDim[Int](bank_rows(b))
              spmv_utils.read_chunk(tmp_buffer, y_addr(b), 0, bank_rows(b), c.ctrl_io, c, mem_id = b+1)
              read_y = Array.concat(read_y, tmp_buffer)
            }

            var golden_y = Array.ofDim[scala.Float](nrows)
            var k = 0
            for (i <- 0 until nrows) {
              var sum_1 = 0.0f
              var sum_2 = 0.0f
              var elem_left = row_idx(i + 1) - row_idx(i)
              if(split_DFE){
              while (elem_left > 0) {
                if(k%2 == 0)
                  sum_1 += nzA(k) * x(col_idx(k))
                else
                  sum_2 += nzA(k) * x(col_idx(k))
                elem_left -= 1
                k += 1
              }
              golden_y(i) = sum_1 + sum_2
              }else{
              while (elem_left > 0) {
                sum_1 += nzA(k) * x(col_idx(k))
                elem_left -= 1
                k += 1
              }
              golden_y(i) = sum_1
              }
            }
            
            print(golden_y(69) + "\n")
            print(golden_y(70) + "\n")
            print(golden_y(71) + "\n")
            var passed = true
            val err_threshold = 1e-07
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
            //print("--" + read_y.map(java.lang.Float.intBitsToFloat(_)).toList + "\n")
            //print("--" + golden_y.toList + "\n")
            assert(passed)

          }
   }
  }
}
