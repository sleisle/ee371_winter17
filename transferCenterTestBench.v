// transferCenter Top Level file for 
// testing and simulation
`include "transferCenter.v"
module lockSystemTestBench;
	wire clk, rst, readyForTransferIn, dataIn;
	wire [1:0] localTransferInput;
	wire readyForTransferOut;
	wire [1:0] localScannerOut;
	wire [7:0] dataBuffer;
	wire [7:0] byteIn;
	wire [2:0] byteCounter;
	wire readData;

	// declare an instance of the counter module
	transferCenter dut(byteCounter, byteIn, clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	// declare an instance of the Tester module
	Tester aTester (byteCounter, byteIn, clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	// file for gtkwave
	initial
		begin
		// file for gtkwave signals
		$dumpfile("transferCenter.vcd");
		$dumpvars(1,dut);
	end
endmodule 

module Tester(byteCounter, byteIn, clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	input wire [4:0] outputs;
	input wire [7:0] lockWater;
	input wire [7:0] innerWater, outerWater;
	output reg clk, rst;
	output reg [6:0] inputs;
	// Clock speed
	parameter stimDelay = 10;
	integer i;
	initial begin
		// Begin running instructions
		clk = 0;		
		#stimDelay;
		#stimDelay rst = 1'b0;
		#stimDelay rst = 1'b1;
		#stimDelay rst = 1'b0;
		#stimDelay inputs = 7'b0; 
		#stimDelay inputs = 7'b1;
		#stimDelay inputs = 7'b0;  
		// Run long enough to see all states of the counter
		for (i=0; i<36; i=i+1) begin
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
