.syntax unified
.cpu cortex-m0
.thumb

/*
Startup vector 
Vector table residing in FLASH
lpc1114fn28
*/
.align   4
.section	.vector_table, "a"
.type 		vector_table, %object
.size		vector_table, .-vector_table
	
vector_table:
  .word  _end_of_stack_
  .word  reset_handler
  .word  nmi_handler
  .word  hard_fault_handler
  .word  0
  .word  0
  .word  0
  .word  0xEFFFFBBD
  .word  0
  .word  0
  .word  0
  .word  svc_handler
  .word  0
  .word  0
  .word  pend_sv_handler
  .word  sys_tick_handler
  .word  PIO0_0_irq_handler
  .word  PIO0_1_irq_handler
  .word  PIO0_2_irq_handler
  .word  PIO0_3_irq_handler
  .word  PIO0_4_irq_handler
  .word  PIO0_5_irq_handler
  .word  PIO0_6_irq_handler
  .word  PIO0_7_irq_handler
  .word  PIO0_8_irq_handler
  .word  PIO0_9_irq_handler
  .word  PIO0_10_irq_handler
  .word  PIO0_11_irq_handler
  .word  PIO1_0_irq_handler
  .word  0
  .word  0
  .word  I2C_irq_handler
  .word  CT16B0_irq_handler
  .word  CT16B1_irq_handler
  .word  CT32B0_irq_handler
  .word  CT32B1_irq_handler
  .word  SPI_SSP0_irq_handler
  .word  UART_irq_handler
  .word  0
  .word  0
  .word  ADC_irq_handler
  .word  WDT_irq_handler
  .word  BOD_irq_handler
  .word  0
  .word  0
  .word  0
  .word  GPIO1_irq_handler
  .word  GPIO0_irq_handler
     
/*
Weak aliases for IRQ vector that default to the
default_handler function in case of an unexpected IRQ
*/
  .weak      nmi_handler
  .thumb_set nmi_handler, default_handler

  .weak      hard_fault_handler
  .thumb_set hard_fault_handler, default_handler

  .weak      svc_handler
  .thumb_set svc_handler, default_handler

  .weak      pend_sv_handler
  .thumb_set pend_sv_handler, default_handler

  .weak      sys_tick_handler
  .thumb_set sys_tick_handler, default_handler

  .weak      PIO0_0_irq_handler
  .thumb_set PIO0_0_irq_handler, default_handler
  
  .weak      PIO0_1_irq_handler
  .thumb_set PIO0_1_irq_handler, default_handler
  
  .weak      PIO0_2_irq_handler
  .thumb_set PIO0_2_irq_handler, default_handler
  
  .weak      PIO0_3_irq_handler
  .thumb_set PIO0_3_irq_handler, default_handler
  
  .weak      PIO0_4_irq_handler
  .thumb_set PIO0_4_irq_handler, default_handler
  
  .weak      PIO0_5_irq_handler
  .thumb_set PIO0_5_irq_handler, default_handler
  
  .weak      PIO0_6_irq_handler
  .thumb_set PIO0_6_irq_handler, default_handler
  
  .weak      PIO0_7_irq_handler
  .thumb_set PIO0_7_irq_handler, default_handler
  
  .weak      PIO0_8_irq_handler
  .thumb_set PIO0_8_irq_handler, default_handler
  
  .weak      PIO0_9_irq_handler
  .thumb_set PIO0_9_irq_handler, default_handler
  
  .weak      PIO0_10_irq_handler
  .thumb_set PIO0_10_irq_handler, default_handler
  
  .weak      PIO0_11_irq_handler
  .thumb_set PIO0_11_irq_handler, default_handler
  
  .weak      PIO1_0_irq_handler
  .thumb_set PIO1_0_irq_handler, default_handler
  
  .weak      I2C_irq_handler
  .thumb_set I2C_irq_handler, default_handler
  
  .weak      CT16B0_irq_handler
  .thumb_set CT16B0_irq_handler, default_handler
  
  .weak      CT16B1_irq_handler
  .thumb_set CT16B1_irq_handler, default_handler
  
  .weak      CT32B0_irq_handler
  .thumb_set CT32B0_irq_handler, default_handler
  
  .weak      CT32B1_irq_handler
  .thumb_set CT32B1_irq_handler, default_handler
  
  .weak      SPI_SSP0_irq_handler
  .thumb_set SPI_SSP0_irq_handler, default_handler
  
  .weak      UART_irq_handler
  .thumb_set UART_irq_handler, default_handler
  
  .weak      ADC_irq_handler
  .thumb_set ADC_irq_handler, default_handler
  
  .weak      WDT_irq_handler
  .thumb_set WDT_irq_handler, default_handler
  
  .weak      BOD_irq_handler
  .thumb_set BOD_irq_handler, default_handler
  
  .weak      GPIO3_irq_handler
  .thumb_set GPIO3_irq_handler, default_handler
  
  .weak      GPIO2_irq_handler
  .thumb_set GPIO2_irq_handler, default_handler
  
  .weak      GPIO1_irq_handler
  .thumb_set GPIO1_irq_handler, default_handler
  
  .weak      GPIO0_irq_handler
  .thumb_set GPIO0_irq_handler, default_handler
 
/*
This gets called first on reset and it initializes 
the sections and other data, then it jumps to main().
*/
.align      4
.section	.startup, "x"
.weak		reset_handler
.type		reset_handler, %function
.size		reset_handler, .-reset_handler	

reset_handler:
	ldr r0, =_start_sram_init_sec_
	ldr r1, =_start_sram_init_addr_
  ldr r2, =_length_sram_init_sec_	
	bl 	memcpy
	
	ldr r0, =_start_sram_zero_sec_
	ldr r1, =0x00000000
	ldr r2, =_length_sram_sero_sec_
	bl 	memset	
	
	bl main				/* Call main() */
	b 	default_handler

/*
default handler
loops forever if code gets here
*/

.align    4
.section	.startup
.weak		default_handler
.type		default_handler, %function
.size		default_handler, .-default_handler

default_handler:
	b	default_handler	
	
