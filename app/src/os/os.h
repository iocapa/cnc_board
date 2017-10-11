#ifndef _OS_H_
#define _OS_H_

#include <stdint.h>

typedef enum {
    OS_MULT_1,
    OS_MULT_2,
    OS_MULT_4,
    OS_MULT_8,
    OS_MULT_16,
    OS_MULT_32,
    OS_MULT_128,
    OS_MULT_256,
    OS_MULT_512,
    OS_MULT_1024,
    OS_MULT_2048,
    OS_MULT_4096,
    OS_MULT_8192,
    OS_MULT_16384,
    OS_MULT_32768,
    OS_MULT_65536
} os_mult_t;

typedef struct {
    void (* const function)(void);
    const os_mult_t multiplicity;
} os_task_t;

void os_init(const os_task_t * const tasks, uint32_t count);
void os_main(void);

#endif