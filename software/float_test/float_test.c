#include "sptl_rocc.h"
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

static inline unsigned long read_from_accel_mem(unsigned long addr) {
    // |lmem_id| addr| -   | 1  | 1   |  0   |  res  | CUSTOM_2 |
    unsigned long read_val;
    ROCC_INSTRUCTION_DS(1, read_val, addr, 0);
    return read_val;
}

int main(void) {

    float a, b;

    a = 2.0f;
    b = 1.5f;
    for(int i = 0; i < 5; i++){
        a += a * b;
    }
    //printf("res= %d\n", (int)a);
    return a;
}
