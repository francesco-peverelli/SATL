#include "template_constants.h"
#include <stdio.h>
#include <math.h>

static inline unsigned long write_to_accel_mem(int val, unsigned long addr) {
    // |lmem_id| addr| val | 1  | 1   |  1   |ack_reg| CUSTOM_1 |
    unsigned long resp_val;
    ROCC_INSTRUCTION_DSS(1, resp_val, addr, val, 0)
    return resp_val;
}

static inline unsigned long read_from_accel_mem(unsigned long addr) {
    // |lmem_id| addr| -   | 1  | 1   |  0   |  res  | CUSTOM_2 |
    unsigned long read_val;
    ROCC_INSTRUCTION_DS(2, read_val, addr, 0);
    return read_val;
}

static inline unsigned long write_to_accel_mem_float(float val, unsigned long addr) {
    // |lmem_id| addr| val | 1  | 1   |  1   |ack_reg| CUSTOM_1 |
    unsigned long resp_val;
    int fval_as_int = *((int*)(&val));
    ROCC_INSTRUCTION_DSS(1, resp_val, addr, fval_as_int, 0)
    return resp_val;
}

static inline float read_from_accel_mem_float(unsigned long addr) {
    // |lmem_id| addr| -   | 1  | 1   |  0   |  res  | CUSTOM_2 |
    float read_val;
    ROCC_INSTRUCTION_DS(2, read_val, addr, 0);
    return read_val;
}

static inline unsigned long start_exec() {
    // |   -   |  -  | -   | 1  | 0   |  0   |ack_reg| CUSTOM_3 |
    unsigned long resp_val;
    ROCC_INSTRUCTION_D(3, resp_val, 0);
    return resp_val;
}

static inline unsigned long config_reg(int cr_addr, int val, int pe) {
    // |cr_addr| val |  pe  | 1  | 1   |  1   |ack_reg| CUSTOM_0 |
    unsigned long resp_val;
    switch (cr_addr)
    {
    case SPMV_TMPL_A_ADDR_REG:
      ROCC_INSTRUCTION_DSS(0, resp_val, val, pe, SPMV_TMPL_A_ADDR_REG);
      break;
    case SPMV_TMPL_COL_ADDR_REG:
      ROCC_INSTRUCTION_DSS(0, resp_val, val, pe, SPMV_TMPL_COL_ADDR_REG);
      break;
    case SPMV_TMPL_X_ADDR_REG:
      ROCC_INSTRUCTION_DSS(0, resp_val, val, pe, SPMV_TMPL_X_ADDR_REG);
      break;
    case SPMV_TMPL_N_ROWS_REG:
      ROCC_INSTRUCTION_DSS(0, resp_val, val, pe, SPMV_TMPL_N_ROWS_REG);
      break;
    case SPMV_TMPL_X_LEN_REG:
      ROCC_INSTRUCTION_DSS(0, resp_val, val, pe, SPMV_TMPL_X_LEN_REG);
      break;
    case SPMV_TMPL_Y_ADDR_REG:
      ROCC_INSTRUCTION_DSS(0, resp_val, val, pe, SPMV_TMPL_Y_ADDR_REG);
      break;
    case SPMV_TMPL_ROW_START_REG:
      ROCC_INSTRUCTION_DSS(0, resp_val, val, pe, SPMV_TMPL_ROW_START_REG);
      break;
    case SPMV_TMPL_ROW_ADDR_REG:
      ROCC_INSTRUCTION_DSS(0, resp_val, val, pe, SPMV_TMPL_ROW_ADDR_REG);
      break;
    default:
      break;
    }
    return resp_val;
}

static inline void write_chunk(int* src, unsigned long src_addr, unsigned long dest_addr, unsigned long num_elems) {
  for(int i = 0; i < num_elems; i++){
    write_to_accel_mem(src[src_addr+i], dest_addr+i);
  }
}

static inline void write_chunk_float(float* src, unsigned long src_addr, unsigned long dest_addr, unsigned long num_elems) {
  for(int i = 0; i < num_elems; i++){
    write_to_accel_mem_float(src[src_addr+i], dest_addr+i);
  }
}

static inline void read_chunk(int* buf, unsigned long src_addr, unsigned long dest_addr, unsigned long num_elems) {
  for(int i = 0; i < num_elems; i++){
    buf[dest_addr+i] = (int)read_from_accel_mem(src_addr+i);
  }
}

static inline void read_chunk_float(float* buf, unsigned long src_addr, unsigned long dest_addr, unsigned long num_elems) {
  for(int i = 0; i < num_elems; i++){
    int read_val = read_from_accel_mem(src_addr+i);
    float fval = *((float*)(&read_val));
    buf[dest_addr+i] = fval;
  }
}

static inline int nearest_pow2(int a) {
  int msb = 0;
  int a_cpy = a;
  while(a != 0){
    a = a >> 1;
    msb++;
  }
  int a_pow2 = (1 << msb);
  if(a_pow2 >= a_cpy){
    a_pow2 = (a_pow2 >> 1);
  }
  return a_pow2;
}

static inline void get_row_split_mem_ptr(int nnz, int nrows, int* col_idx, int* row_ptr, int x_chunk_size,
    int* banks, int* nz_addr, int* col_addr, int* row_idx, int* x_addr, int* y_addr,
    int* rows_per_pe, int* row_start_offs, int* bank_nnz, int* bank_rows) {
    
    int pe_per_bank = NUM_PE / NUM_BANKS;
    float row_per_pe = (float)nrows / (float)NUM_PE;
    int rem_row =  nrows % NUM_PE;
    // Offset in the original csr arrays
    int curr_row_offs = 0;
    // Offset relative to the current bank
    int mem_ptr = 0;
    int bank_offs = 0;
    int bank_row_offs = 0; // This running value is redundant
    int bank_nz_offs = 0;

    int rows_per_bank = 0;
    int rows_seen = 0;
    for(int i = 0; i < NUM_PE; i++) {
      // Determine the number of rows per PE
      if(rem_row > 0) {
        rows_per_pe[i] = (int)ceil(row_per_pe);
        rem_row -= 1;
      } else {
        rows_per_pe[i] = (int)floor(row_per_pe);
      }
      rows_per_bank += rows_per_pe[i];
      bank_rows[i/pe_per_bank] += rows_per_pe[i];

      if(i%pe_per_bank == (pe_per_bank-1)) {
        bank_nnz[i/pe_per_bank] = row_ptr[rows_per_bank] - rows_seen;
        rows_seen += bank_nnz[i/pe_per_bank];
      }
    }

    for(int j = 0; j < NUM_BANKS; j++) {
      // Initialize the addresses according to the bank
      bank_offs = j * BANK_SIZE;
      // Rows read at the beginning of this bank
      bank_row_offs = curr_row_offs;
      // NZ read at the beginning of this bank
      bank_nz_offs = row_ptr[curr_row_offs];

      x_addr[j] = bank_offs;

      for(int i = 0; i < pe_per_bank; i++) {
        int pe_idx = j*pe_per_bank + i;
        banks[pe_idx] = j;
        // Get the index for each row pointer where to start from
        row_start_offs[pe_idx] = curr_row_offs;
        curr_row_offs = curr_row_offs + rows_per_pe[pe_idx];

        nz_addr[pe_idx] = x_chunk_size + row_ptr[row_start_offs[pe_idx]] - bank_nz_offs + bank_offs;

        // TODO: this should all be for a given bank
        col_addr[pe_idx] = bank_nnz[j] + nz_addr[pe_idx]; 
        row_idx[pe_idx] = x_chunk_size + 2 * bank_nnz[j] + row_start_offs[pe_idx] - bank_row_offs + bank_offs;
        y_addr[pe_idx] = x_chunk_size + 2 * bank_nnz[j] + bank_rows[j] + 1 + row_start_offs[pe_idx] - bank_row_offs + bank_offs;
        mem_ptr = y_addr[pe_idx] + rows_per_pe[pe_idx];
#ifdef DEBUG
        printf("Rows per pe %d: %d\n", pe_idx, rows_per_pe[pe_idx]);
        printf("PE %d, bank: %d\n", i, j);
        printf("nz_addr: %d\n", nz_addr[pe_idx]);
        printf("col_addr: %d\n", col_addr[pe_idx]);
        printf("row_idx: %d\n", row_idx[pe_idx]);
#endif
      }
    }

    return;
  }
/*
  void generate_crs_data(int nrows, int ncols, int nz_every_x,
    int* row_idx, int* col_odx, float* nz, float* x) {

    int nnz = 0

    val denseA = Array.ofDim[Int](nrows,ncols)
    for(i <- 0 until nrows){
      for(j <- 0 until ncols) {
        val is_nz = rng.nextInt(nz_every_x) == 0
        if(is_nz) {
          denseA(i)(j) = rng.nextInt(100)  
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
      x(i) = rng.nextInt(10).toFloat
    }
    
    return (row_idx, col_idx, nzA, x)
  }*/