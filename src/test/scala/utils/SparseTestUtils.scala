package utils
import scala.io.Source
import scala.reflect.ClassTag
import chisel3.util.log2Floor
import chisel3.util.log2Ceil

class SparseTestUtils {
  def generate_crs_data(nrows: Int, ncols: Int, nz_every_x: Int = 30) : (Array[Int], Array[Int], Array[scala.Float], Array[scala.Float]) = {
    
    print("Generating data...\n")

    val rng = scala.util.Random
    var nnz = 0

    /**
      * Simulating an input matrix
      */
    val denseA = Array.ofDim[Int](nrows,ncols)
    for(i <- 0 until nrows){
      for(j <- 0 until ncols) {
        val is_nz = rng.nextInt(nz_every_x) == 0
        if(is_nz) {
          denseA(i)(j) = rng.nextInt(1000)  
          if(denseA(i)(j) == 0) denseA(i)(j) = 1 
          nnz += 1
        } else {
          denseA(i)(j) = 0
        }
      }
    }

    print("Generated " + nnz + " non zeros...\n")

    var row_idx = Array.ofDim[Int](nrows+1)
    var col_idx = Array.ofDim[Int](nnz)
    var nzA = Array.ofDim[scala.Float](nnz)
    row_idx(0) = 0
    var nnz_seen = 0
    for(i <- 0 until nrows){
      var nnz_row = 0
      for(j <- 0 until ncols) {
        if(denseA(i)(j) > 0){
          col_idx(nnz_seen) = j
          nzA(nnz_seen) = denseA(i)(j).toFloat
          nnz_seen += 1
          nnz_row += 1
        }
      }
      row_idx(i+1) = nnz_seen
      nnz_row = 0
    }

    var x = Array.ofDim[scala.Float](ncols)
    for(i <- 0 until ncols) {
      x(i) = rng.nextInt(100).toFloat
    }
    
    return (row_idx, col_idx, nzA, x)
  }
  def generate_hpcg_problem(nx: Int, ny: Int, nz: Int) : (Array[Int], Array[Int], Array[scala.Float], Array[scala.Float]) = {
    def get1DIndex(x: Int, y: Int, z: Int) : Int = {
      return (z * nx * ny) + (y * nx) + x
    }
    def get3DIndex(flatIdx: Int) : (Int, Int, Int) = {
      var idx = flatIdx
      val z = idx / (nx * ny)
      idx = idx - (z * nx * ny)
      val y = idx / nx
      val x = idx % nx
      return (x, y, z)
    }
    val nrows = nx * ny * nz
    val ncols = nx * ny * nz
    val denseA = Array.fill(nrows,ncols) { 0.0f }

    print("Generating HPCG-like (" + nx + "," + ny + "," + nz + ") problem\n")

    // A cell has a non-zero at 1d(3d(A[i]) - 1[x|y|z]) if in range
    var nnz = 0
    for(i <- 0 until nrows){
      var nnz_row = 0
      var halo = Array.ofDim[(Int,Int,Int)](27)
      val (myx, myy, myz) = get3DIndex(i)
      //print("Elem i=" + i + "  (" + myx + "," + myy + "," + myz + ") \n")
      denseA(i)(i) = 1.0f
      nnz += 1
      for(dx <- -1 until 2){
        for(dy <- -1 until 2) {
          for(dz <- -1 until 2){
            if(!(dx == 0 && dy == 0 && dz == 0)){
              val (neighx, neighy, neighz) = (myx+dx, myy+dy, myz+dz)
              //print("Elem i neigh at (" + neighx + "," + neighy + "," + neighz + ")\n")
              if(neighx >= 0 && neighx < nx && 
                neighy >= 0 && neighy < ny &&
                neighz >= 0 && neighz < nz){
                denseA(i)(get1DIndex(neighx, neighy, neighz)) = 1.0f
                nnz += 1
                nnz_row += 1
                //print("Elem i=" + i + "  (" + myx + "," + myy + "," + myz + ") has nz at (" + neighx + "," + neighy + "," + neighz + ")\n")
              } else {
                //print("Elem i=" + i + "  (" + myx + "," + myy + "," + myz + ") INVALID at (" + neighx + "," + neighy + "," + neighz + ")\n")
              }
            }
          }
        } 
      }
      print("row " + i + " has " + nnz_row + " + 1 nz\n")

    }
    print("Generated " + nnz + " non zeros...\n")

    val rng = scala.util.Random
    var row_idx = Array.ofDim[Int](nrows+1)
    var col_idx = Array.ofDim[Int](nnz)
    var nzA = Array.ofDim[scala.Float](nnz)
    row_idx(0) = 0
    var nnz_seen = 0
    for(i <- 0 until nrows){
      var nnz_row = 0
      for(j <- 0 until ncols) {
        if(denseA(i)(j) > 0){
          col_idx(nnz_seen) = j
          nzA(nnz_seen) = denseA(i)(j).toFloat
          nnz_seen += 1
          nnz_row += 1
        }
      }
      row_idx(i+1) = nnz_seen
      nnz_row = 0
    }

    var x = Array.ofDim[scala.Float](ncols)
    for(i <- 0 until ncols) {
      x(i) = rng.nextInt(10).toFloat
    }
    
    return (row_idx, col_idx, nzA, x)
  }

  def get_simple_mem_ptr(nnz : Int, nrows : Int, xsize : Int) : (Int, Int, Int, Int, Int) = {
    //Setup hypotetical problem dimensions
    val x_addr = 0
    var a_addr = xsize
    var col_idx_addr = a_addr + nnz
    var row_ptr = col_idx_addr + nnz
    val y_addr = row_ptr + nrows + 1

    return (a_addr, col_idx_addr, row_ptr, x_addr, y_addr)
  }

  /**
    * Splits the data among PEs equalizing as much as possible the number of rows
    * @return
    *   - a first array containing bank assignments for each PE
    *   - the starting addresses for non-zeros for each PE
    *   - the starting addresses for column index arrays
    *   - the starting addresses for row pointers arrays
    *   - the x vactor starting address
    *   - the y vector starting address
  */
  def get_row_split_mem_ptr(nnz : Int, col_idx : Array[Int], row_ptr : Array[Int], 
    x_chunk_size : Int, npe : Int, nbanks : Int, bank_size : Int) : 
      (Array[Int], Array[Int], Array[Int], Array[Int], 
       Array[Int], Array[Int], Array[Int], Array[Int], Array[Int]) = {
    assert(npe >= nbanks)
    assert(log2Ceil(nbanks) == log2Floor(nbanks)) 
    assert(npe % nbanks == 0)

    val nrows = row_ptr.size - 1
    var banks = Array.ofDim[Int](npe)
    var rows_per_pe = Array.ofDim[Int](npe)
    var row_start_offs = Array.ofDim[Int](npe)
    //Setup hypotetical problem dimensions
    var nz_addr = Array.ofDim[Int](npe)
    var col_addr = Array.ofDim[Int](npe)
    var row_idx = Array.ofDim[Int](npe)
    var y_addr = Array.ofDim[Int](npe)
    var x_addr = Array.ofDim[Int](nbanks)
    var bank_nnz = Array.ofDim[Int](nbanks)
    var bank_rows = Array.ofDim[Int](nbanks)
    
    val pe_per_bank = npe / nbanks
    val row_per_pe = nrows.toFloat / npe.toFloat
    var rem_row =  nrows % npe
    // Offset in the original csr arrays
    var curr_row_offs = 0
    // Offset relative to the current bank
    var mem_ptr = 0
    var bank_offs = 0
    var bank_row_offs = 0 // This running value is redundant
    var bank_nz_offs = 0

    var rows_per_bank = 0
    var rows_seen = 0
    for(i <- 0 until npe) {
      // Determine the number of rows per PE
      if(rem_row > 0) {
        rows_per_pe(i) = Math.ceil(row_per_pe).toInt
        rem_row -= 1
      } else {
        rows_per_pe(i) = Math.floor(row_per_pe).toInt
      }
      rows_per_bank += rows_per_pe(i)
      bank_rows(i/pe_per_bank) += rows_per_pe(i)
      print("rem: " + (i%pe_per_bank) + "\n")
      if(i%pe_per_bank == (pe_per_bank-1)) {
        print("Writing at " + (i/pe_per_bank) + "\n")
        bank_nnz(i/pe_per_bank) = row_ptr(rows_per_bank) - rows_seen
        print("bank nnz as " + row_ptr(rows_per_bank) + " - " + rows_seen + "\n")
        rows_seen += bank_nnz(i/pe_per_bank)
      }
    }
    print("Bank nnz: " + bank_nnz.toList + "\n")
    print("Banks rows: " + bank_rows.toList + "\n")
    print("x_chunk_size: " + x_chunk_size + "\n")

    for(j <- 0 until nbanks) {
      // Initialize the addresses according to the bank
      bank_offs = j * bank_size
      // Rows read at the beginning of this bank
      bank_row_offs = curr_row_offs
      // NZ read at the beginning of this bank
      bank_nz_offs = row_ptr(curr_row_offs)

      x_addr(j) = bank_offs

      for(i <- 0 until pe_per_bank) {
        var pe_idx = j*pe_per_bank + i
        banks(pe_idx) = j
        // Get the index for each row pointer where to start from
        row_start_offs(pe_idx) = curr_row_offs
        curr_row_offs = curr_row_offs + rows_per_pe(pe_idx) 

        nz_addr(pe_idx) = x_chunk_size + row_ptr(row_start_offs(pe_idx)) - bank_nz_offs + bank_offs

        // TODO: this should all be for a given bank
        col_addr(pe_idx) = bank_nnz(j) + nz_addr(pe_idx) 
        row_idx(pe_idx) = x_chunk_size + 2 * bank_nnz(j) + row_start_offs(pe_idx) - bank_row_offs + bank_offs
        y_addr(pe_idx) = x_chunk_size + 2 * bank_nnz(j) + bank_rows(j) + 1 + row_start_offs(pe_idx) - bank_row_offs + bank_offs
        mem_ptr = y_addr(pe_idx) + rows_per_pe(pe_idx)

        print("Rows per pe " + pe_idx + ": " + rows_per_pe(pe_idx) + "\n")
        print("PE " + i + ", bank: " + j + "\n")
        print("nz_addr:" + nz_addr(pe_idx) + "\n")
        print("col_addr:" + col_addr(pe_idx) + "\n")
        print("row_idx: " + row_idx(pe_idx) + "\n")
      }
    }

    return (banks, nz_addr, col_addr, row_idx, x_addr, y_addr, rows_per_pe, bank_nnz, bank_rows)
  }

  /**
    * Splits the data among PEs equalizing as much as possible the NZ per PE, without alterating the 
    * original CRS data structures (thus no row splitting)
    *
    * @param nnz
    * @param col_idx
    * @param row_ptr
    * @param x_chunk_size
    * @param npe
    * @param nbanks
    * @param bank_size
    * @return
    */
  def get_nz_split_mem_ptr(nnz : Int, col_idx : Array[Int], row_ptr : Array[Int], 
    x_chunk_size : Int, npe : Int, nbanks : Int, bank_size : Int) : 
      (Array[Int], Array[Int], Array[Int], Array[Int], 
       Array[Int], Array[Int], Array[Int], Array[Int], Array[Int]) = {

    assert(npe >= nbanks)
    assert(log2Ceil(nbanks) == log2Floor(nbanks)) 
    assert(npe % nbanks == 0)

    // Overall number of rows
    val nrows = row_ptr.size - 1
    // Mapping PE -> Bank
    var banks = Array.ofDim[Int](npe)
    // Mapping PE -> Number of rows of A
    var rows_per_pe = Array.ofDim[Int](npe)
    // Mapping PE -> Index in the row pointer where the PE's rows start
    var row_start_offs = Array.ofDim[Int](npe)

    // Holds for each PE the starting memory address of the respective structure
    var nz_addr = Array.ofDim[Int](npe)
    var col_addr = Array.ofDim[Int](npe)
    var row_idx = Array.ofDim[Int](npe)
    var y_addr = Array.ofDim[Int](npe)
    var x_addr = Array.ofDim[Int](nbanks)
    // Other info needed by the PE:
    // 1. nz for each bank
    // 2. rows of A for each bank? [redundant?]
    var bank_nnz = Array.ofDim[Int](nbanks)
    var bank_rows = Array.ofDim[Int](nbanks)
    // Statically determined PE per bank
    val pe_per_bank = npe / nbanks

    // Offset in the original csr arrays
    var curr_row_offs = 0
    // Offset relative to the current bank
    var mem_ptr = 0
    var bank_offs = 0
    var bank_row_offs = 0 // This running value is redundant
    var bank_nz_offs = 0

    var rows_per_bank = 0

    val nz_per_pe = scala.math.ceil(nnz.toDouble / npe.toDouble).toInt

    var target_nz = nz_per_pe


    var curr_pe = 0
    var tot_nz = 0
    var pe_nz = 0
    for(j <- 0 until nrows){
      pe_nz += row_ptr(j+1) - row_ptr(j)
      bank_rows(curr_pe) += 1
      if((pe_nz >= target_nz) && (curr_pe < (npe-1))){
        bank_nnz(curr_pe) = pe_nz
        tot_nz += pe_nz
        pe_nz = 0
        curr_pe += 1
      }else if(j == (nrows-1)){
        bank_nnz(curr_pe) = pe_nz
      }
    }

    for(j <- 0 until nbanks) {
      // Initialize the addresses according to the bank
      bank_offs = j * bank_size
      // Rows read at the beginning of this bank
      bank_row_offs = curr_row_offs
      // NZ read at the beginning of this bank
      bank_nz_offs = row_ptr(curr_row_offs)

      x_addr(j) = bank_offs

      for(i <- 0 until pe_per_bank) {
        var pe_idx = j*pe_per_bank + i
        banks(pe_idx) = j
        rows_per_pe(pe_idx) = bank_rows(j)
        // Get the index for each row pointer where to start from
        row_start_offs(pe_idx) = curr_row_offs
        curr_row_offs = curr_row_offs + rows_per_pe(pe_idx) 

        nz_addr(pe_idx) = x_chunk_size + row_ptr(row_start_offs(pe_idx)) - bank_nz_offs + bank_offs

        // TODO: this should all be for a given bank
        col_addr(pe_idx) = bank_nnz(j) + nz_addr(pe_idx) 
        row_idx(pe_idx) = x_chunk_size + 2 * bank_nnz(j) + row_start_offs(pe_idx) - bank_row_offs + bank_offs
        y_addr(pe_idx) = x_chunk_size + 2 * bank_nnz(j) + bank_rows(j) + 1 + row_start_offs(pe_idx) - bank_row_offs + bank_offs
        mem_ptr = y_addr(pe_idx) + rows_per_pe(pe_idx)

        print("Rows per pe " + pe_idx + ": " + rows_per_pe(pe_idx) + "\n")
        print("PE " + i + ", bank: " + j + "\n")
        print("nz_addr:" + nz_addr(pe_idx) + "\n")
        print("col_addr:" + col_addr(pe_idx) + "\n")
        print("row_idx: " + row_idx(pe_idx) + "\n")
      }
    }

    return (banks, nz_addr, col_addr, row_idx, x_addr, y_addr, rows_per_pe, bank_nnz, bank_rows)
  }

  /**
    * Splits the data among PEs equalizing as much as possible the NZ per PE, without alterating the 
    * original CRS data structures (thus no row splitting)
    *
    * @param nnz
    * @param col_idx
    * @param row_ptr
    * @param x_chunk_size
    * @param npe
    * @param nbanks
    * @param bank_size
    * @return
    */
  def get_nz_split_mem_ptr_x_split(nnz : Int, col_idx : Array[Int], row_ptr : Array[Int], 
    x_chunk_size : Int, npe : Int, nbanks : Int, xnbanks: Int, local_bank_size : Int, x_bank_size: Int) : 
      (Array[Int], Array[Int], Array[Int], Array[Int], 
       Array[Int], Array[Int], Array[Int], Array[Int], Array[Int]) = {

    assert(npe >= nbanks)
    assert(log2Ceil(nbanks) == log2Floor(nbanks)) 
    assert(npe % nbanks == 0)

    val nrows = row_ptr.size - 1
    var banks = Array.ofDim[Int](npe)
    var rows_per_pe = Array.ofDim[Int](npe)
    var row_start_offs = Array.ofDim[Int](npe)
    //Setup hypotetical problem dimensions
    var nz_addr = Array.ofDim[Int](npe)
    var col_addr = Array.ofDim[Int](npe)
    var row_idx = Array.ofDim[Int](npe)
    var y_addr = Array.ofDim[Int](npe)
    var x_addr = Array.ofDim[Int](xnbanks)
    var bank_nnz = Array.ofDim[Int](nbanks)
    var bank_rows = Array.ofDim[Int](nbanks)
    
    val pe_per_bank = npe / nbanks
    val row_per_pe = nrows.toFloat / npe.toFloat
    var rem_row =  nrows % npe

    // Offset in the original csr arrays
    var curr_row_offs = 0
    // Offset relative to the current bank
    var mem_ptr = 0
    var bank_offs = 0
    var bank_row_offs = 0 // This running value is redundant
    var bank_nz_offs = 0
    var x_bank_offs = 0
    var rows_per_bank = 0

    val nz_per_pe = scala.math.ceil(nnz.toDouble / npe.toDouble).toInt

    var target_nz = nz_per_pe


    var curr_pe = 0
    var tot_nz = 0
    var pe_nz = 0
    for(j <- 0 until nrows){
      pe_nz += row_ptr(j+1) - row_ptr(j)
      bank_rows(curr_pe) += 1
      if((pe_nz >= target_nz) && (curr_pe < (npe-1))){
        bank_nnz(curr_pe) = pe_nz
        tot_nz += pe_nz
        pe_nz = 0
        curr_pe += 1
      }else if(j == (nrows-1)){
        bank_nnz(curr_pe) = pe_nz
      }
    }
    for(j <- 0 until xnbanks) {
      x_bank_offs = j * x_bank_size
      x_addr(j) = x_bank_offs
    }
    for(j <- 0 until nbanks) {
      // Initialize the addresses according to the bank
      bank_offs = 0
      // Rows read at the beginning of this bank
      bank_row_offs = curr_row_offs
      // NZ read at the beginning of this bank
      bank_nz_offs = row_ptr(curr_row_offs)

      for(i <- 0 until pe_per_bank) {
        var pe_idx = j*pe_per_bank + i
        banks(pe_idx) = j
        rows_per_pe(pe_idx) = bank_rows(j)
        // Get the index for each row pointer where to start from
        row_start_offs(pe_idx) = curr_row_offs
        curr_row_offs = curr_row_offs + rows_per_pe(pe_idx) 

        nz_addr(pe_idx) = row_ptr(row_start_offs(pe_idx)) - bank_nz_offs + bank_offs

        // TODO: this should all be for a given bank
        col_addr(pe_idx) = bank_nnz(j) + nz_addr(pe_idx) 
        row_idx(pe_idx) = 2 * bank_nnz(j) + row_start_offs(pe_idx) - bank_row_offs + bank_offs
        y_addr(pe_idx) = 2 * bank_nnz(j) + bank_rows(j) + 1 + row_start_offs(pe_idx) - bank_row_offs + bank_offs
        mem_ptr = y_addr(pe_idx) + rows_per_pe(pe_idx)

        print("Rows per pe " + pe_idx + ": " + rows_per_pe(pe_idx) + "\n")
        print("PE " + i + ", bank: " + j + "\n")
        print("nz_addr:" + nz_addr(pe_idx) + "\n")
        print("col_addr:" + col_addr(pe_idx) + "\n")
        print("row_idx: " + row_idx(pe_idx) + "\n")
      }
    }

    return (banks, nz_addr, col_addr, row_idx, x_addr, y_addr, rows_per_pe, bank_nnz, bank_rows)
  }

  def coo_to_csr(nz_coo: Array[scala.Float], row_idx_coo: Array[Int], col_idx_coo: Array[Int]) 
  : (Array[scala.Float], Array[Int], Array[Int]) = {

    print("Converting data to CRS...\n")
    val nnz = nz_coo.length
    var max_rows = 0
    for(i <- 0 until row_idx_coo.length){
      if(max_rows < row_idx_coo(i))
        max_rows = row_idx_coo(i)
    }
    var crs_row = Array.ofDim[Int](max_rows+2)
    for(i <- 0 until nz_coo.length) {
      crs_row(row_idx_coo(i)+1) = crs_row(row_idx_coo(i)+1)+1
    }
    for(i <- 0 until (crs_row.length-1)){
      crs_row(i+1)=crs_row(i+1)+crs_row(i)
    }
    print("Returning:\n" + nz_coo.size + "\n" + col_idx_coo.size + "\n"  + crs_row.size + "\n")
    return (nz_coo, col_idx_coo, crs_row) 
  }

  def parse_mm_format(filename: String) : (Array[scala.Float], Array[Int], Array[Int]) = {
    print("Parsing mm format matrix...\n")
    var nz_coo = Array.ofDim[scala.Float](1)
    var row_coo = Array.ofDim[Int](1)
    var col_coo = Array.ofDim[Int](1)
    var read_header = false
    var rows = 0
    var cols = 0
    var nnz = 0
    var nz_counter = 0
    for (line <- Source.fromFile(filename).getLines) {
      if(line(0) != '%'){
        if(!read_header){
          var tokens = line.split("\\s+").filter(_.nonEmpty).map( _.toInt)
    
          rows = tokens(0)
          cols = tokens(1)
          nnz = tokens(2)
          read_header = true

          print("reading " + rows + " rows, " + cols + " cols, " + nnz + " nz\n") 
  
          nz_coo = Array.ofDim[scala.Float](nnz)
          row_coo = Array.ofDim[Int](nnz)
          col_coo = Array.ofDim[Int](nnz)
        } else {
          var tokens_str = line.split("\\s+")
          row_coo(nz_counter) = tokens_str(0).toInt - 1
          col_coo(nz_counter) = tokens_str(1).toInt - 1
          //nz_coo(nz_counter) = tokens_str(2).toFloat
          if(tokens_str.length == 2) {
              nz_coo(nz_counter) = 1.0f
          }else{
              nz_coo(nz_counter) = tokens_str(2).toFloat
          }
          nz_counter += 1
        }
      }
    }
    return (nz_coo, row_coo, col_coo)
  }

  //def add_balancing_rows(nnz : Int, col_idx : Array[Int], row_ptr : Array[Int], npe: Int) : (Array[scala.Int]) = {

  //}
  /**
    * 
    * @return
    *   - a first array containing bank assignments for each PE
    *   - the starting addresses for non-zeros for each PE
    *   - the starting addresses for column index arrays
    *   - the starting addresses for row pointers arrays
    *   - the x vactor starting address
    *   - the y vector starting address
  */
  def get_row_split_mem_ptr_x_split(nnz : Int, col_idx : Array[Int], row_ptr : Array[Int], 
    x_chunk_size : Int, npe : Int, nbanks : Int, xnbanks: Int, local_bank_size : Int, x_bank_size: Int) : 
      (Array[Int], Array[Int], Array[Int], Array[Int], 
       Array[Int], Array[Int], Array[Int], Array[Int], Array[Int]) = {
    assert(npe >= nbanks)
    assert(log2Ceil(nbanks) == log2Floor(nbanks)) 
    assert(npe % nbanks == 0)

    val nrows = row_ptr.size - 1
    var banks = Array.ofDim[Int](npe)
    var rows_per_pe = Array.ofDim[Int](npe)
    var row_start_offs = Array.ofDim[Int](npe)
    //Setup hypotetical problem dimensions
    var nz_addr = Array.ofDim[Int](npe)
    var col_addr = Array.ofDim[Int](npe)
    var row_idx = Array.ofDim[Int](npe)
    var y_addr = Array.ofDim[Int](npe)
    var x_addr = Array.ofDim[Int](xnbanks)
    var bank_nnz = Array.ofDim[Int](nbanks)
    var bank_rows = Array.ofDim[Int](nbanks)
    
    val pe_per_bank = npe / nbanks
    val row_per_pe = nrows.toFloat / npe.toFloat
    var rem_row =  nrows % npe
    // Offset in the original csr arrays
    var curr_row_offs = 0
    // Offset relative to the current bank
    var mem_ptr = 0
    var bank_offs = 0
    var x_bank_offs = 0
    var bank_row_offs = 0 // This running value is redundant
    var bank_nz_offs = 0

    var rows_per_bank = 0
    var rows_seen = 0
    for(i <- 0 until npe) {
      // Determine the number of rows per PE
      if(rem_row > 0) {
        rows_per_pe(i) = Math.ceil(row_per_pe).toInt
        rem_row -= 1
      } else {
        rows_per_pe(i) = Math.floor(row_per_pe).toInt
      }
      rows_per_bank += rows_per_pe(i)
      bank_rows(i/pe_per_bank) += rows_per_pe(i)
      print("rem: " + (i%pe_per_bank) + "\n")
      if(i%pe_per_bank == (pe_per_bank-1)) {
        print("Writing at " + (i/pe_per_bank) + "\n")
        bank_nnz(i/pe_per_bank) = row_ptr(rows_per_bank) - rows_seen
        print("bank nnz as " + row_ptr(rows_per_bank) + " - " + rows_seen + "\n")
        rows_seen += bank_nnz(i/pe_per_bank)
      }
    }
    print("Bank nnz: " + bank_nnz.toList + "\n")
    print("Banks rows: " + bank_rows.toList + "\n")
    print("x_chunk_size: " + x_chunk_size + "\n")

    for(j <- 0 until xnbanks) {
      x_bank_offs = j * x_bank_size
      x_addr(j) = x_bank_offs
    }
    for(j <- 0 until nbanks) {
      // Initialize the addresses according to the bank for x
      // All local banks start from address 0
      bank_offs = 0
      // Rows read at the beginning of this bank
      bank_row_offs = curr_row_offs
      // NZ read at the beginning of this bank
      bank_nz_offs = row_ptr(curr_row_offs)

      for(i <- 0 until pe_per_bank) {
        var pe_idx = j*pe_per_bank + i
        banks(pe_idx) = j
        // Get the index for each row pointer where to start from
        row_start_offs(pe_idx) = curr_row_offs
        curr_row_offs = curr_row_offs + rows_per_pe(pe_idx) 

        nz_addr(pe_idx) = row_ptr(row_start_offs(pe_idx)) - bank_nz_offs + bank_offs

        // TODO: this should all be for a given bank
        col_addr(pe_idx) = bank_nnz(j) + nz_addr(pe_idx) 
        row_idx(pe_idx) = 2 * bank_nnz(j) + row_start_offs(pe_idx) - bank_row_offs + bank_offs
        y_addr(pe_idx) =  2 * bank_nnz(j) + bank_rows(j) + 1 + row_start_offs(pe_idx) - bank_row_offs + bank_offs
        mem_ptr = y_addr(pe_idx) + rows_per_pe(pe_idx)

        print("Rows per pe " + pe_idx + ": " + rows_per_pe(pe_idx) + "\n")
        print("PE " + i + ", bank: " + j + "\n")
        print("nz_addr:" + nz_addr(pe_idx) + "\n")
        print("col_addr:" + col_addr(pe_idx) + "\n")
        print("row_idx: " + row_idx(pe_idx) + "\n")
      }
    }

    return (banks, nz_addr, col_addr, row_idx, x_addr, y_addr, rows_per_pe, bank_nnz, bank_rows)
  }

  def do_spmv[T:ClassTag:Numeric](nzA : Array[T], x: Array[T], col_idx: Array[Int], row_idx: Array[Int], nrows: Int, ncols: Int)(implicit num: Numeric[T]) : Array[T] = {
    import num._
    var golden_y = Array.ofDim[T](nrows)
    var k = 0
    for(i <- 0 until nrows) {
        var sum: T = 0.asInstanceOf[T]
        var elem_left = row_idx(i+1) - row_idx(i)
        while(elem_left > 0) {
            sum = sum + nzA(k) * x(col_idx(k))
            elem_left -= 1
            k += 1
        }
        golden_y(i) = sum
    }
    return golden_y
  }
}
