/*
 *
 *      Author: The crew of K S and J
 */

#include "sys/alt_stdio.h"
#include "sys/unistd.h"

#define readyToTransfer (volatile char *) 0x0009020
#define transfer (volatile char *) 0x0009000
#define startScanning (volatile char *) 0x0009010

int main()
{
  alt_putstr("Scanner Control Ready \n");
  char input = 'i'; // Idle
  char temp = 'i';

  while (1) {
	  alt_putstr("test \n");
	  *startScanning = 0;
	  *transfer = 0;

	  if((*readyToTransfer &= 0x1) == 0x1) {
		  alt_putstr("\n ready to transfer!\n");
	  }

	  input = alt_getchar();

  	  temp = input;

  	  if(temp == 's') {
  		  temp = 'i';
  		  *startScanning = 1;
  		*readyToTransfer = 0;
  		  alt_putstr("\n start scanning...\n");
  	  	  usleep(1000000);
  	  }
  	  if(temp == 't') {
  		  temp = 'i';
  		  *readyToTransfer = 1;
  		  alt_putstr("\n ready to transfer...\n");
  	  	  usleep(5000000);

  	  }
  }
  return 0;
}
