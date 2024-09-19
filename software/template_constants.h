#ifndef TEMPLATE_CONSTANTS_H
#define TEMPLATE_CONSTANTS_H

#define NUM_PE 2 
#define NUM_BANKS NUM_PE
#define BANK_SIZE 16384
#define ERR_THRESHOLD 1.0e-4
//#define DEBUG 0
#define CHECK_DATA 1

#define SPMV_TMPL_OP_WCREG 11
#define SPMV_TMPL_OP_WMEM32_1 43
#define SPMV_TMPL_OP_RMEM32_1 91
#define SPMV_TMPL_OP_EXEC 123

#define SPMV_TMPL_A_ADDR_REG 0
#define SPMV_TMPL_COL_ADDR_REG 1
#define SPMV_TMPL_X_ADDR_REG 2
#define SPMV_TMPL_ROW_ADDR_REG 3
#define SPMV_TMPL_N_ROWS_REG 4
#define SPMV_TMPL_X_LEN_REG 5
#define SPMV_TMPL_Y_ADDR_REG 6
#define SPMV_TMPL_ROW_START_REG 7

#endif // TEMPLATE_CONSTANTS_H