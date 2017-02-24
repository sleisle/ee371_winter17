#ifndef _HEX_HEADER_
#define _HEX_HEADER_

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <inttypes.h>

#define HW_REGS_BASE ( 0xff200000 )
#define HW_REGS_SPAN ( 0x00200000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )
#define HEX_BASE 0x20
#define HEX_BASE_TWO 0x30

// Struct that represents one of the 7 segment hex displays
struct hex {
	uint32_t *address;
	uint8_t value;
	uint8_t index;
};

typedef struct hex *hex_t;

// Create new hex with given index and virtualBase address
hex_t allocateHex(uint8_t index, void *virtualBase);

// Set value of the hex
void setHexValue(hex_t hex, uint8_t value);

// Return value of the hex
uint8_t getHexValue(hex_t hex);	

#endif // _HEX_HEADER_