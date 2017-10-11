#include <stdint.h>
#include "nvic.h"
#include "cm0.h"

void nvic_enable_irq(nvic_irq_t irq)
{
    if(irq >= 0) {
        ISER |= (1u << irq);
    } else if(irq == SYS_TICK) {
        SYST_CSR |= (1u << TICKINT);
    } else {}
}

void nvic_disable_irq(nvic_irq_t irq)
{
    if(irq >= 0) {
        ICER |= (1u << irq);
    } else if(irq == SYS_TICK) {
        SYST_CSR &= ~(1u << TICKINT);
    } else {}
}

void nvic_set_pending(nvic_irq_t irq)
{

}

void nvic_clear_pending(nvic_irq_t irq)
{

}

uint32_t nvic_get_pending_irq(nvic_irq_t irq)
{

}

void nvic_set_priority(nvic_irq_t irq, uint32_t priority)
{

}

uint32_t nvic_get_priority(nvic_irq_t irq)
{

}

