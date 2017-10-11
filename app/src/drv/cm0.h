#ifndef _CM0_H_
#define _CM0_H_

#include <stdint.h>

/* NVIC */
#define ISER (*(volatile uint32_t *)0xE000E100u)
#define ICER (*(volatile uint32_t *)0xE000E180u)
#define ISPR (*(volatile uint32_t *)0xE000E200u)
#define ICPR (*(volatile uint32_t *)0xE000E280u)
#define IPR  ((volatile uint32_t *)0xE000E400u)

/* SCB */
#define CPUID (*(volatile const uint32_t *)0xE000ED00u)
#define ICSR (*(volatile uint32_t *)0xE000ED04u)
#define AIRCR (*(volatile uint32_t *)0xE000ED0Cu)
#define SCR (*(volatile uint32_t *)0xE000ED10u)
#define CCR (*(volatile const uint32_t *)0xE000ED14u )
#define SHPR2 (*(volatile uint32_t *)0xE000ED1Cu )
#define SHPR3 (*(volatile uint32_t *)0xE000ED20u)

/* SYS TICK */
#define SYST_CSR (*(volatile uint32_t *)0xE000E010u)
#define SYST_RVR (*(volatile uint32_t *)0xE000E014u)
#define SYST_CVR (*(volatile uint32_t *)0xE000E018u)
#define SYST_CALIB (*(volatile const uint32_t *)0xE000E01Cu)

#define TICKINT (1)

#endif