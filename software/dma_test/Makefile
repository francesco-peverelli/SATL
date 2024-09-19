CC= riscv64-unknown-elf-gcc# -Os -s -fno-stack-protector  -fomit-frame-pointer -ffunction-sections -fdata-sections -Wl,--gc-sections -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-unroll-loops -fmerge-all-constants -fno-ident 
CFLAGS= -static -fno-common -fno-builtin-printf -specs=htif_nano.specs
OBJ_FLAGS= -static -fno-builtin-printf -specs=htif_nano.specs
INCLUDE_ROCC= -I. #-I./csr_data

%.o : %.c
	$(CC) -c $(CFLAGS) $(INCLUDE_ROCC) $< -o $@

dma_tests: dma_test.o
	$(CC) $(OBJ_FLAGS) dma_test.o -lm -o dma_test.riscv