#ifndef CSR_DATA_ALLOCATION_H
#define CSR_DATA_ALLOCATION_H
int nnz = 7337;
int nrows = 841;
int ncols = 841;
float* nz = (float*) malloc(sizeof(float)*7337);
float* x = (float*) malloc(sizeof(float)*841);
int* col_idx = (int*) malloc(sizeof(int)*7337);
int* row_ptr = (int*) malloc(sizeof(int)*842);
#endif //CSR_DATA_ALLOCATION_H
