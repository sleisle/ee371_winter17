#include "hex.h"

#define LED_BASE 0x0
#define DELAY 10000000
#define MAX_NUM 421

int main(int argc, char **argv) {
	void *virtual_base;
	uint32_t *leds;
	int fd;
    
    // Open /dev/mem
	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}
    
    // Get virtual base address that maps to physical
	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );	
	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return(1);
	}
	
	// Get address of the LED register
	leds = (unsigned int *)(virtual_base + (( LED_BASE ) & ( HW_REGS_MASK ) ));
	
	// Initialize hexes
    hex_t hexes[6];
	int i;
	for (i = 0; i < 6; i++) {
		hexes[i] = allocateHex(i, virtual_base);
		if (hexes[i] == NULL) {
			return 1;
		}
	}

	int number = 0;
	int counter = 0;
	
	// Keeps counting in binary on the LEDs, and in decimal on the hex displays
	while (number < MAX_NUM) {
		counter = (counter + 1) % DELAY;
		if (counter == 0) {
			number = (number + 1) % MAX_NUM;
			setHexValue(hexes[0], number % 10);
			setHexValue(hexes[1], (number / 10) % 10);
			setHexValue(hexes[2], (number / 100) % 10);
			*leds = number;
		}
	}
    
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}
	
	// Free the hex structs
	for (i = 0; i < 6; i++) {
		free(hexes[i]);
	}
	
	close( fd );
	return 0;
}