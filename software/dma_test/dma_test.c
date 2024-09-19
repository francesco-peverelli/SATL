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

    // Integer data buffer to read from main memory
    int data[32];
    int read_buffer[32];
    int l = 0;

    //printf("Data address as long was: %ld\n", (long)data);

    // Initialize buffer
    for(int i = 0; i < 32; i++){
        data[i] = i+1;
    }
    //printf("Data init done\n");
    // Simple DMA test:
    //  1. Request some data from DRAM
    int resp_val = -1;
    int data_size = 128;  // Data size must be < 2^16
    int buffer_address = (int)data;
    int scBaseAddr = 0;
    
    //ROCC_INSTRUCTION_DSS(0, resp_val, buffer_address, data_size, 0)
    
    while(data_size){
       
        if((data_size >= 64) && ((buffer_address%64) == 0)) {
            printf("Transfering aligned to 64 bytes...\n");
            int dataLeft = data_size % 64;
            int dataToTransfer = data_size - dataLeft;
            int dataCatScBaseAddr = dataToTransfer + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(0, resp_val, buffer_address, dataCatScBaseAddr, 0)
            data_size = dataLeft;
            buffer_address += dataToTransfer;
            scBaseAddr += (dataToTransfer >> 2);
        } else if((data_size >= 32) && ((buffer_address%32) == 0)) {
            printf("Transfering aligned to 32 bytes...\n");
            int dataCatScBaseAddr = 32 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(0, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 32;
            data_size -= 32;
            scBaseAddr += 8;
        } else if((data_size >= 16) && ((buffer_address%16) == 0)) {
            printf("Transfering aligned to 16 bytes...\n");
            int dataCatScBaseAddr = 16 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(0, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 16;
            data_size -= 16;
            scBaseAddr += 4;
        } else if((data_size >= 8) && ((buffer_address%8) == 0)) {
            printf("Transfering aligned to 8 bytes...\n");
            int dataCatScBaseAddr = 8 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(0, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 8;
            data_size -= 8;
            scBaseAddr += 2;
        } else if((data_size >= 4) && ((buffer_address%4) == 0)) {
            printf("Transfering aligned to 4 bytes...\n");
            int dataCatScBaseAddr = 4 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(0, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 4;
            data_size -= 4;
            scBaseAddr += 1;
        } else if((data_size >= 2) && ((buffer_address%2) == 0)) {
            printf("Transfering aligned to 2 bytes...\n");
            int dataCatScBaseAddr = 2 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(0, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 2;
            data_size -= 2;
            // This may not work with 32 bit scratchpad port
        } else {
            printf("Transfering aligned to 1 byte...\n");
            int dataCatScBaseAddr = 1 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(0, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 1;
            data_size -= 1;
            // This may not work with 32 bit scratchpad port
        }
    }

    // Very rudimentary wait device
    for(int i = 0; i < 300; i++){
        l++;
    }

    //  1. Request write to DRAM
    resp_val = -1;
    data_size = 128;  // Data size must be < 2^16
    buffer_address = (int)read_buffer;
    scBaseAddr = 0;
    
    //ROCC_INSTRUCTION_DSS(0, resp_val, buffer_address, data_size, 0)
    
    while(data_size){
       
        if((data_size >= 64) && ((buffer_address%64) == 0)) {
            printf("Transfering aligned to 64 bytes...\n");
            int dataLeft = data_size % 64;
            int dataToTransfer = data_size - dataLeft;
            int dataCatScBaseAddr = dataToTransfer + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(2, resp_val, buffer_address, dataCatScBaseAddr, 0)
            data_size = dataLeft;
            buffer_address += dataToTransfer;
            scBaseAddr += (dataToTransfer >> 2);
        } else if((data_size >= 32) && ((buffer_address%32) == 0)) {
            printf("Transfering aligned to 32 bytes...\n");
            int dataCatScBaseAddr = 32 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(2, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 32;
            data_size -= 32;
            scBaseAddr += 8;
        } else if((data_size >= 16) && ((buffer_address%16) == 0)) {
            printf("Transfering aligned to 16 bytes...\n");
            int dataCatScBaseAddr = 16 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(2, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 16;
            data_size -= 16;
            scBaseAddr += 4;
        } else if((data_size >= 8) && ((buffer_address%8) == 0)) {
            printf("Transfering aligned to 8 bytes...\n");
            int dataCatScBaseAddr = 8 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(2, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 8;
            data_size -= 8;
            scBaseAddr += 2;
        } else if((data_size >= 4) && ((buffer_address%4) == 0)) {
            printf("Transfering aligned to 4 bytes...\n");
            int dataCatScBaseAddr = 4 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(2, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 4;
            data_size -= 4;
            scBaseAddr += 1;
        } else if((data_size >= 2) && ((buffer_address%2) == 0)) {
            printf("Transfering aligned to 2 bytes...\n");
            int dataCatScBaseAddr = 2 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(2, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 2;
            data_size -= 2;
            // This may not work with 32 bit scratchpad port
        } else {
            printf("Transfering aligned to 1 byte...\n");
            int dataCatScBaseAddr = 1 + (scBaseAddr << 16);
            ROCC_INSTRUCTION_DSS(2, resp_val, buffer_address, dataCatScBaseAddr, 0)
            buffer_address += 1;
            data_size -= 1;
            // This may not work with 32 bit scratchpad port
        }
    }

    // Very rudimentary wait device
    for(int i = 0; i < 300; i++){
        l++;
    }

    for(int i = 0; i < 4; i++){
        printf("read[%d]: %d\n", i, read_buffer[i]);
    }

    return 0;
}
