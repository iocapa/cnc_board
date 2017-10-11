#include <stdint.h>
#include "os.h"

typedef struct {
    const os_task_t * tasks;
    uint32_t count;
} os_internal_t;

static os_internal_t os_data;

void os_init(const os_task_t * const tasks, const uint32_t count)
{
    os_data.tasks = tasks;
    os_data.count = count;
}

void os_main(void)
{

}