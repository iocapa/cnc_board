#include "os.h"
#include "gpio.h"
#include "lib.h"
#include "cm0.h"

void main(void)
{
	ISER = 0u;
	IPR[2] = 2;
	while(1);
}