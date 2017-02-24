#include "hex.h"

hex_t allocateHex(uint8_t index, void *virtualBase) {
	hex_t hex = (hex_t)malloc(sizeof(struct hex));
	if (hex == NULL) {
		return NULL;
	}
	hex->index = index;
	// Index < 4 has different register than index >= 4, gets the virtual address of register
	if (index < 4) {
		uint32_t *hexBase = (unsigned int *)(virtualBase + (( HEX_BASE ) & ( HW_REGS_MASK ) ));
		hex->address = hexBase;
	} else {
		uint32_t *hexBase = (unsigned int *)(virtualBase + (( HEX_BASE_TWO ) & ( HW_REGS_MASK ) ));
		hex->address = hexBase;
	}
	setHexValue(hex, 0);
	return hex;
}

void setHexValue(hex_t hex, uint8_t value) {
	hex->value = value;
	uint32_t bits = 0;
	// Choses correct bit pattern to make the number on the led display
	switch (value) {
		case 0: bits = 0b00111111; break;
		case 1: bits = 0b00000110; break;
		case 2: bits = 0b01011011; break;
		case 3: bits = 0b01001111; break;
		case 4: bits = 0b01100110; break;
		case 5: bits = 0b01101101; break;
		case 6: bits = 0b01111101; break;
		case 7: bits = 0b00000111; break;
		case 8: bits = 0b01111111; break;
		case 9: bits = 0b01101111; break;
		default: bits = 0b00111111; break;
	}
	// Calculate offset in the register
	int offset = (hex->index) % 4;
	// Shift bits to correct offset 
	bits = bits << (offset * 8);
	// Clear the old value at that offset
	uint32_t clearer = 0x000000FF;
	clearer = clearer << (offset * 8);
	clearer = ~clearer;
	*(hex->address) = *(hex->address) & clearer;
	// Add in the bits of the value
	*(hex->address) = *(hex->address) | bits;
}

uint8_t getHexValue(hex_t hex) {
	return hex->value;
}