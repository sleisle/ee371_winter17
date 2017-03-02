///*
// * "Hello World" example.
// *
// * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
// * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
// * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
// * device in your system's hardware.
// * The memory footprint of this hosted application is ~69 kbytes by default
// * using the standard reference design.
// *
// * For a reduced footprint version of this template, and an explanation of how
// * to reduce the memory footprint for a given application, see the
// * "small_hello_world" template.
// *
// */
//
//#include <stdio.h>
//
//int main()
//{
//  printf("Hello from Nios II!\n");
//
//  return 0;
//}

/*
 * scan.c
 *
 *  Created on: Feb 22, 2017
 *      Author: acf8
 */

#include "sys/alt_stdio.h"
#include "sys/unistd.h"

#define readyToTransfer (volatile char *) 0x0009020
#define transfer (volatile char *) 0x0009000
#define startScanning (volatile char *) 0x0009010

int main()
{
  alt_putstr("SCANNER CONTROL \n");
  char input = 'a';
  char temp = 'a';

  /* Event loop never exits. */
  while (1) {
	  *startScanning = 0;
	  *transfer = 0;

	  if((*readyToTransfer &= 0x1) == 0x1) {
		  alt_putstr("\n ready to transfer!\n");
	  }

  	  input = alt_getchar();

  	  temp = input;

  	  if(temp == 's') {
  		  temp = 'a';
  		  *startScanning = 1;
  		  alt_putstr("\n start scanning...\n");
  	  	  usleep(1000000);
  	  }
  	  if(temp == 't') {
  		  temp = 'a';
  		  *transfer = 1;
  		  alt_putstr("\n transferring...\n");
  	  	  usleep(1000000);
  	  }
  }
  return 0;
}
