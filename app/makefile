# Name of the resulting elf file
PROJ_NAME = cnc_main

# Placeholders for executables
CC = arm-none-eabi-gcc
OD = arm-none-eabi-objdump
CP = arm-none-eabi-objcopy

# Include paths
INC_PATH = src
INC_PATH += src\drv\gpio
INC_PATH += src\os
INC_PATH += src\sys
INC_PATH += src\drv
INC_PATH += src\drv\nvic

# Sources
SOURCES = src\main.c
SOURCES += src\drv\gpio\gpio.c
SOURCES += src\os\os.c
SOURCES += src\sys\startup.S
SOURCES += src\sys\lib.S
SOURCES += src\drv\nvic\nvic.c

# Clean executables
clean:
	rm -f *.elf
	rm -f *.bin
	rm -f *.lst

# Build all
build:
	$(CC) -Tres/linker.ld $(INC_PATH:%=-I%) -nostartfiles -nostdlib -Wall -Wextra -Wno-main -std=gnu99 -pedantic -O3 -g -mcpu=cortex-m0 -mthumb -mabi=aapcs -fno-builtin $(SOURCES) -o $(PROJ_NAME).elf
	$(CP) -Obinary $(PROJ_NAME).elf $(PROJ_NAME).bin
	$(OD) -S $(PROJ_NAME).elf > $(PROJ_NAME).lst
all: clean build
	