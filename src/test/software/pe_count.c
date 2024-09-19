#include<stdio.h>
#include"rocc.h"

static inline unsigned long get_n_pe()
{
	unsigned long value;
	ROCC_INSTRUCTION_D(0, value, 0);
	return value;
}

int main(){
    printf("I forgot! How many PEs do I have?\n");
    unsigned long res = 0;

    // PERFORM TEST RISCV INSTRUCTION
    res = get_n_pe();
    //CHECK RESULT
    printf("Oh yes, I have %lu PEs!\n", res);
    return 0;
}
