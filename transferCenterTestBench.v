// transferCenter Top Level file for 
// testing and simulation
`include "transferCenter.v"
module transferCenterTestBench;
	wire clk, rst, readyForTransferIn, dataIn;
	wire [1:0] localTransferInput;
	wire readyForTransferOut;
	wire [1:0] localScannerOut;
	wire [7:0] dataBuffer;
	wire readData;
	// Debugging internals
	wire [7:0] byteIn;
	wire [2:0] byteCounter;

	// declare an instance of the transferCenter module
	transferCenter dut(byteCounter, clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	// declare an instance of the Tester module
	Tester aTester (byteCounter, clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	// file for gtkwave
	initial
		begin
		// file for gtkwave signals
		$dumpfile("transferCenter.vcd");
		$dumpvars(1,dut);
	end
endmodule 

module Tester(byteCounter, clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	output reg clk, rst, readyForTransferIn, dataIn;
	output reg [1:0] localTransferInput;
	input wire readyForTransferOut;
	input wire [1:0] localScannerOut;
	input wire [7:0] dataBuffer;
	input wire readData;
	input wire [7:0] byteIn;
	input wire [2:0] byteCounter;

	// Clock speed
	parameter stimDelay = 10;
	integer i;
	initial begin
		// Begin running instructions
		clk = 0;
		readyForTransferIn = 1'b0;
		dataIn = 1'b0;		
		#stimDelay;
		// Reset system
		#stimDelay rst = 1'b0;
		#stimDelay rst = 1'b1;
		#stimDelay rst = 1'b0;
		// Because the clock is active 
		// we begin reading in 8 bits
		// then read the byte to decide
		// what state to enter next
		for (i=0; i<12; i=i+1) begin
			#stimDelay;
		end 
		// This will result in the
		// byte being read as 0x7
		// which means binary data is
		// following
		dataIn = 1'b1;
		for (i=0; i<3; i=i+1) begin
			#stimDelay;
		end 
		// Procede to read the next byte
		// which will be 0xFF
		for (i=0; i<20; i=i+1) begin
			#stimDelay;
		end
		// At this point we will have transfered
		// the data byte we read into our systems
		// data buffer so the transfer was successful 
		// Now we go through our other protocol cases
		// from 0x1 to 0x8 (excluding 0x7 since it was
		// already tested earlier)		
		// Test 0x1 (Buffer 50%)		
		dataIn = 1'b0;
		for (i=0; i<14; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b1;
		for (i=0; i<2; i=i+1) begin
			#stimDelay;
		end
		readyForTransferIn = 1'b1;
		// Test 0x2 (Buffer 80%)		
		dataIn = 1'b0;
		for (i=0; i<12; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b1;
		for (i=0; i<2; i=i+1) begin
			#stimDelay;
		end  
		dataIn = 1'b0;
		for (i=0; i<2; i=i+1) begin
			#stimDelay;
		end  
		// Test 0x3 (Buffer 90%)
		dataIn = 1'b0;
		for (i=0; i<12; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b1;
		for (i=0; i<4; i=i+1) begin
			#stimDelay;
		end 
		// Test 0x4 (Buffer full)
		dataIn = 1'b0;
		for (i=0; i<10; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b1;
		for (i=0; i<2; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b0;
		for (i=0; i<4; i=i+1) begin
			#stimDelay;
		end 
		// Test 0x5 (Flush buffer)
		dataIn = 1'b0;
		for (i=0; i<10; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b1;
		for (i=0; i<2; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b0;
		for (i=0; i<2; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b1;
		for (i=0; i<2; i=i+1) begin
			#stimDelay;
		end
		// Test 0x6 (Device Ready)
		dataIn = 1'b0;
		for (i=0; i<10; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b1;
		for (i=0; i<4; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b0;
		for (i=0; i<2; i=i+1) begin
			#stimDelay;
		end 
		// Test 0x8 (ASCII Coded Data Follows)
		dataIn = 1'b0;
		for (i=0; i<8; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b1;
		for (i=0; i<2; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b0;
		for (i=0; i<6; i=i+1) begin
			#stimDelay;
		end 
		// Reset system and finish testing		
		#stimDelay;
		#stimDelay;
		#stimDelay;		
		#stimDelay rst = 1'b1;
		#stimDelay;
		$finish;
	end
	always
	begin
		#stimDelay clk=~clk;
	end
endmodule
