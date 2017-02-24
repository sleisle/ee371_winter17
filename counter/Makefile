HexCount: hexCounting.o hex.o
	arm-linux-gnueabihf-gcc -Wall -g -o HexCount hexCounting.o hex.o
hexCounting.o: hexCounting.c
	arm-linux-gnueabihf-gcc -Wall -g -c -o hexCounting.o hexCounting.c
hex.o: hex.c hex.h
	arm-linux-gnueabihf-gcc -Wall -g -c -o hex.o hex.c