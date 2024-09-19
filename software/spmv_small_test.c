#include "sptl_rocc.h"
#include "spmv_utils.h"
#include "template_constants.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>

static inline void print_array(int* a, int n){
    printf("Array: ");
    for(int i = 0; i < n; i++){
        printf(" %d", a[i]);
    }
    printf("\n");
}

static inline void print_array_float(float* a, int n){
    printf("Array: ");
    for(int i = 0; i < n; i++){
        printf(" %f", a[i]);
    }
    printf("\n");
}

static inline int buffer_cmp(int* buff_1, int* buff_2, int n, int start_1, int start_2){
    for(int i = 0; i < n; i++) {
        if(buff_1[start_1+i] != buff_2[start_2+i]){
            return 0;
        }
    }
    return 1;
}

int main(void) {

    int banks[NUM_PE]; 
    int nz_addr[NUM_PE]; 
    int col_addr[NUM_PE]; 
    int row_idx[NUM_PE]; 
    int x_addr[NUM_PE]; 
    int y_addr[NUM_PE];
    int rows_per_pe[NUM_PE]; 
    int row_start_offs[NUM_PE]; 
    int bank_nnz[NUM_PE]; 
    int bank_rows[NUM_PE];

    #include "csr_data/csr_data_allocation.h"
    #include "csr_data/csr_nz_values.h"
    #include "csr_data/csr_col_idx_values.h"
    #include "csr_data/csr_row_ptr_values.h"

    int x_pow_2 = nearest_pow2(ncols);
    int x_chunk_size = x_pow_2 / NUM_BANKS;

#ifdef DEBUG
    printf("col_idx: ");
    print_array(col_idx, nnz);
    printf("row_ptr: ");
    print_array(row_ptr, nrows+1);
#endif

    get_row_split_mem_ptr(nnz, nrows, col_idx, row_ptr, x_chunk_size,
        banks, nz_addr, col_addr, row_idx, x_addr, y_addr,
        rows_per_pe, row_start_offs, bank_nnz, bank_rows);
    
    printf("Preprocessing done!\n");

#ifdef DEBUG

    printf("banks: ");
    print_array(banks, NUM_PE);
    printf("nz_addr: ");
    print_array(nz_addr, NUM_PE);
    printf("col_addr: ");
    print_array(col_addr, NUM_PE);
    printf("row_idx: ");
    print_array(row_idx, NUM_PE);
    printf("x_addr: ");
    print_array(x_addr, NUM_PE);
    printf("y_addr: ");
    print_array(y_addr, NUM_PE);
#endif

    int nz_read = 0;
    int rptr_read = 0;
    for (int b = 0; b < NUM_BANKS; b++) {
        int x_data_size = x_chunk_size;
        if ((b + 1) * x_chunk_size > ncols) {
            x_data_size = ncols - b * x_chunk_size;
            x_data_size = (x_data_size > 0) ? x_data_size : 0;
        }
        
        write_chunk_float(nz, nz_read, nz_addr[b], bank_nnz[b]);
        write_chunk(col_idx, nz_read, col_addr[b], bank_nnz[b]);
        write_chunk(row_ptr, rptr_read, row_idx[b], bank_rows[b] + 1);
        write_chunk_float(x, b * x_chunk_size, x_addr[b], x_data_size);

#ifdef CHECK_DATA
        
        printf("Reading back written data...\n");

        int data_to_read = 2 * bank_nnz[b] + bank_rows[b] + 1 + x_chunk_size;
        
        int* tmp_buffer = (int*) malloc(sizeof(int)*(data_to_read));
        read_chunk(tmp_buffer, b * BANK_SIZE, 0, data_to_read);

        printf("Checking for correctness...\n");

        //printf("Y_acc: ");
        //print_array(tmp_buffer, data_to_read);

        assert(buffer_cmp(tmp_buffer, (int*)nz, bank_nnz[b], nz_addr[b] % BANK_SIZE, nz_read));
        assert(buffer_cmp(tmp_buffer, col_idx, bank_nnz[b], col_addr[b] % BANK_SIZE, nz_read));
        assert(buffer_cmp(tmp_buffer, row_ptr, bank_rows[b] + 1, row_idx[b] % BANK_SIZE, rptr_read));
        assert(buffer_cmp(tmp_buffer, (int*)x, x_data_size, x_addr[b] % BANK_SIZE, b * x_chunk_size));
#endif

        nz_read += bank_nnz[b];
        rptr_read += bank_rows[b];
    }
    printf("Reg setup...\n");
    int rows_read = 0;
    for(int i = 0; i < NUM_PE; i++) {
        config_reg(SPMV_TMPL_A_ADDR_REG, nz_addr[i], i);
        config_reg(SPMV_TMPL_COL_ADDR_REG, col_addr[i], i);
        config_reg(SPMV_TMPL_X_ADDR_REG, x_addr[banks[i]], i);
        config_reg(SPMV_TMPL_X_LEN_REG, x_pow_2, i);
        config_reg(SPMV_TMPL_ROW_ADDR_REG, row_idx[i], i);
        config_reg(SPMV_TMPL_N_ROWS_REG, rows_per_pe[i], i);
        config_reg(SPMV_TMPL_ROW_START_REG, row_ptr[rows_read], i);
        config_reg(SPMV_TMPL_Y_ADDR_REG, y_addr[i], i);
        rows_read += rows_per_pe[i];
    }

    printf("Start compute...\n");

    clock_t start = clock();
    start_exec();
    clock_t end = clock();

    printf("Computation time: = %ld\n", ((long) (end - start))  / CLOCKS_PER_SEC);

    float* y = (float*) malloc(sizeof(float)*nrows);
    float* y_acc = (float*) malloc(sizeof(float)*nrows);

    for(int i = 0; i < nrows; i++){
        int n_vals_row = row_ptr[i+1]-row_ptr[i];
        for(int j = 0; j < n_vals_row; j++){
            int nz_offset = row_ptr[i]+j;
            y[i] = nz[nz_offset] * x[col_idx[nz_offset]];
        }
    }
    printf("Check results...\n");

    rows_read = 0;
    for(int i = 0; i < NUM_BANKS; i++){
        read_chunk_float(y_acc, y_addr[i], rows_read, rows_per_pe[i]);
        rows_read += rows_per_pe[i];
    }
   
    for(int i = 0; i < nrows; i++){
        assert((abs(y[i] - y_acc[i]) / y[i]) < ERR_THRESHOLD);
    }
    printf("ALL_OK\n");

    return 0;
}