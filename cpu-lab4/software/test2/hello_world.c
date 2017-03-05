/*
 * scan.c
 *
 *  Created on: Feb 22, 2017
 *      Author: Fiesta in my ass
 */

#include "sys/alt_stdio.h"
#include "sys/unistd.h"

#define readyToTransfer (volatile char *) 0x0005000
#define trans (volatile char *) 0x0005010
#define startScanning (volatile char *) 0x0005020

int main()
{
  alt_putstr("SCANNER CONTROL \n");
  char input = 'a';
  char temp = 'a';

  /* Event loop never exits. */
  while (1) {
	  *startScanning = 0;
	  *trans = 0;

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
  		  *trans = 1;
  		  alt_putstr("\n transferring...\n");
  	  	  usleep(1000000);
  	  }
  }
  return 0;
}


