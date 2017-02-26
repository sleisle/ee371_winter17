#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

#define HW_REGS_BASE ( 0xff200000 )
#define HW_REGS_SPAN ( 0x00200000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )
#define LED_BASE 0x0
#define SWITCH_BASE 0x40

int main(void) {
	/* Declare volatile pointers to I/O registers 
	(volatile means that the locations will not be cached, * even in registers) 
	*/
	volatile unsigned int * LED_ptr = NULL;  // red LED address
	volatile unsigned int * SW_switch_ptr = NULL;  // SW slider switch address // pushbutton KEY address
	void *virtual_base;
	int SW_value;
	int fd;
	volatile int delay_count;

	// Open /dev/mem
	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}
    
    // get virtual addr that maps to physical
	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );	
	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return(1);
	}

    // Get the address that maps to the LEDs and other peripherals
	LED_ptr = (unsigned int *)(virtual_base + (( LED_BASE ) & ( HW_REGS_MASK ) ));
	SW_switch_ptr = (unsigned int *)(virtual_base + (( SWITCH_BASE ) & ( HW_REGS_MASK ) ));

	// Scan for input, G to continue
	char input;
	printf("hello world...\n");
	printf("To continue enter \'G\': ");
	scanf("%c", &input);
	getchar();
	while (input != 'G') {
		printf("To continue enter \'G\': ");
		scanf("%c", &input);
		getchar();
	}

	while (1) {
		// Get value of switches
		SW_value = *(SW_switch_ptr);
		// Invert if first switch is on
		if (SW_value % 2 == 1) {
			SW_value = ~SW_value + 1;
		}
		// Set LEDS to the value
		*(LED_ptr) = SW_value;
	}

	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}
	close( fd );
	return 0;
}
