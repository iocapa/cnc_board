/*
memory areas for the LPC1114FN28
*/  
MEMORY
{
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 32K
	SRAM (rwx) : ORIGIN = 0x10000000, LENGTH = 8K
	ROM (rx) : ORIGIN = 0x1FFF0000, LENGTH = 16K
}

/*
memory sections for the stm32f303CCT6
*/  
SECTIONS
{	
	/* Flash contents */
	flash_contents :
	{
		. = ALIGN(4);
		*(.vector_table)
		*(.startup*)
		*(.startup)
		*(.text*)
		*(.text)
		*(.rodata*)		
		*(.rodata)
	} > FLASH
	
	/* this section contains initialized data in SRAM */
	sram_init :
	{
		. = ALIGN(4);
		_start_sram_init_sec_ = .;
		*(.fastcode*)
		*(.fastcode)
		*(.data*)
		*(.data)
		_end_sram_init_sec_ = .;	
	} > SRAM AT > FLASH
	
	/* this section contains zeroed data in SRAM */
	sram_zero :
	{
		. = ALIGN(4);
		_start_sram_zero_sec_ = .;
		*(.bss*)
		*(.bss)
		_end_sram_zero_sec_ = .;
	} > SRAM
}

/*
symbols used in initalization
*/  
_length_sram_sero_sec_ = (_end_sram_zero_sec_ - _start_sram_zero_sec_);

_start_sram_init_addr_ = LOADADDR(sram_init);
_length_sram_init_sec_ = (_end_sram_init_sec_ - _start_sram_init_sec_);

_end_of_stack_ = ORIGIN(SRAM) + LENGTH(SRAM);
ENTRY(reset_handler)