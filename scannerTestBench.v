// scanner Top Level file for 
// testing and simulation
`include "scanner.v"
module scannerTestBench;
	wire clk, rst, readyForTransferIn, dataOut, clkOut;
	wire [1:0] localTransferInput;
	wire [1:0] localScannerOut;
	wire [3:0] dataBuffer;
	// Testing variables
	wire [1:0] ps;
	wire [7:0] outputBuffer, outputDataBuffer;

	// declare an instance of the counter module
	scanner dut(ps, outputDataBuffer, outputBuffer, clk, rst, readyForTransferIn, localTransferInput, clkOut, dataOut, dataBuffer);
	// declare an instance of the Tester module
	Tester aTester (ps, outputDataBuffer, outputBuffer, clk, rst, readyForTransferIn, localTransferInput, clkOut, dataOut, dataBuffer);
	// file for gtkwave
	initial
		begin
		// file for gtkwave signals
		$dumpfile("scanner.vcd");
		$dumpvars(1,dut);
	end
endmodule 

module Tester(ps, outputDataBuffer, outputBuffer, clk, rst, readyForTransferIn, localTransferInput, clkOut, dataOut, dataBuffer);
	output reg clk, rst, readyForTransferIn;
	output reg [1:0] localTransferInput;

	input wire clkOut, dataOut;	

	input wire [1:0] localScannerOut;
	input wire [3:0] dataBuffer;
	// Testing variables
	input wire [1:0] ps;
	input wire [7:0] outputBuffer, outputDataBuffer;



	// Clock speed
	parameter stimDelay = 5;
	integer i;
	initial begin
		// Begin running instructions
		clk = 0;
		readyForTransferIn = 1'b0;	
		#stimDelay;
		#stimDelay rst = 1'b0;
		#stimDelay rst = 1'b1;
		#stimDelay rst = 1'b0;
		// Run in idle
		for (i=0; i<4; i=i+1) begin
			#stimDelay;
		end 
		// Switch to active
		localTransferInput = 2'b01;
		for (i=0; i<20; i=i+1) begin
			#stimDelay;
		end 

		for (i=0; i<140; i=i+1) begin
			#stimDelay;
		end 

		readyForTransferIn = 1'b1;
		localTransferInput = 2'b10;

		for (i=0; i<12; i=i+1) begin
			#stimDelay;
		end 

		for (i=0; i<4; i=i+1) begin
			#stimDelay;
		end  

		for (i=0; i<10; i=i+1) begin
			#stimDelay;
		end 

		for (i=0; i<6; i=i+1) begin
			#stimDelay;
		end 
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
