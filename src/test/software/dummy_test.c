#include<stdio.h>
#include"rocc.h"

static inline unsigned long do_sum(unsigned in)
{
	unsigned long value;
	ROCC_INSTRUCTION_DS(0, value, in, 0);
	return value;
}

int main(){
    printf("DUMMY ROCC ACCELERATOR TEST 1 (ADDER) START\n");
    unsigned long val = 10;
    unsigned long res = 0;

    // PERFORM TEST RISCV INSTRUCTION
    res = do_sum(val);
    //CHECK RESULT
    printf("RESULT=%lu...\n", res);
    return 0;
}
