BUILD_DIR=./build
CC=riscv64-unknown-elf-gcc
CFLAGS=-static -fno-common -fno-builtin-printf -specs=htif_nano.specs -std=gnu11 -Wall -nostartfiles
CFLAGS+= -fno-common -g -DENTROPY=0 -DNONSMP_HART=0 
CFLAGS+= -I ./include -I. -I./csr_data
LFLAGS=-static  

PBUS_CLK ?= 1000000 # default to 1MHz but really should be overridden

default: elf 

elf := $(BUILD_DIR)/fw_test.elf
$(elf): float_test.c kprintf.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -DTL_CLK="$(PBUS_CLK)UL" $(LFLAGS) -o $@ float_test.c kprintf.c -lm 

.PHONY: elf
elf: $(elf)

%.o : %.c
	$(CC) -c $(CFLAGS) $(INCLUDE_ROCC) $< -o $@

float_tests: float_test.o
	$(CC) $(OBJ_FLAGS) float_test.o -lm -o float_test.riscv