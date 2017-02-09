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

	// declare an instance of the counter module
	transferCenter dut(clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	// declare an instance of the Tester module
	Tester aTester (clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	// file for gtkwave
	initial
		begin
		// file for gtkwave signals
		$dumpfile("transferCenter.vcd");
		$dumpvars(1,dut);
	end
endmodule 

module Tester(clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	output reg clk, rst, readyForTransferIn, dataIn;
	output reg [1:0] localTransferInput;
	input wire readyForTransferOut;
	input wire [1:0] localScannerOut;
	input wire [7:0] dataBuffer;
	input wire readData;
	// Clock speed
	parameter stimDelay = 10;
	integer i;
	initial begin
		// Begin running instructions
		clk = 0;
		dataIn = 1'b0;		
		#stimDelay;
		#stimDelay rst = 1'b0;
		#stimDelay rst = 1'b1;
		#stimDelay rst = 1'b0;
		// 
		for (i=0; i<8; i=i+1) begin
			#stimDelay;
		end 
		dataIn = 1'b1;
		for (i=0; i<3; i=i+1) begin
			#stimDelay;
		end 

		for (i=0; i<18; i=i+1) begin
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
