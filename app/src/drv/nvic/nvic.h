#ifndef _NVIC_H_
#define _NVIC_H_

typedef enum {
    NMI = -14,
    HARD_FAULT = -13,
    SV_CALL = -5,
    PEND_SV = -2,
    SYS_TICK = -1,
    IRQ_PIO0_0 = 0,
    IRQ_PIO0_1 = 1,
    IRQ_PIO0_2 = 2,
    IRQ_PIO0_3 = 3,
    IRQ_PIO0_4 = 4,
    IRQ_PIO0_5 = 5,
    IRQ_PIO0_6 = 6,
    IRQ_PIO0_7 = 7,
    IRQ_PIO0_8 = 8,
    IRQ_PIO0_9 = 9,
    IRQ_PIO0_10 = 10,
    IRQ_PIO0_11 = 11,
    IRQ_PIO1_0 = 12,
    IRQ_I2C = 15,
    IRQ_CT16B0 = 16,
    IRQ_CT16B1 = 17,
    IRQ_CT32B0 = 18,
    IRQ_CT32B1 = 19,
    IRQ_SPI_SSP0 = 20,
    IRQ_UART = 21,
    IRQ_ADC = 24,
    IRQ_WDT = 25,
    IRQ_BOD = 26,
    IRQ_GPIO1 = 30,
    IRQ_GPIO0 = 31
} nvic_irq_t;

void nvic_enable_irq(nvic_irq_t irq);
void nvic_disable_irq(nvic_irq_t irq);
void nvic_set_pending(nvic_irq_t irq);
void nvic_clear_pending(nvic_irq_t irq);
uint32_t nvic_get_pending_irq(nvic_irq_t irq);
void nvic_set_priority(nvic_irq_t irq, uint32_t priority);
uint32_t nvic_get_priority(nvic_irq_t irq);

#endif