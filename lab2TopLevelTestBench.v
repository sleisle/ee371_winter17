// Synchronous Down Counter Top Level file for 
// testing and simulation
`include "lab2TopLevel.v"
`include "clock_divider.v"
`include "convertToDisp.v"
`include "lockSystem.v"
`include "seg7.sv"
module lab2TopLevelTestBench;
	wire [7:0] outerWaterConv, innerWaterConv, lockWaterConv, outerWaterPre, innerWaterPre, lockWaterPre;
	wire [9:0] LEDR, SW;
	wire [3:0] KEY;
	wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire clk;
	// declare an instance of the counter module
	lab2TopLevel dut(clk, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	// declare an instance of the Tester module
	Tester aTester (clk, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	// file for gtkwave
	initial
		begin
		// file for gtkwave signals
		$dumpfile("lab2TopLevel.vcd");
		$dumpvars(1,dut);
	end
endmodule 

module Tester(clk, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	input wire [9:0] LEDR;
	output wire [9:0] SW;
	output reg clk;
	output wire [3:0] KEY;
	// Clock speed
	parameter stimDelay = 10;
	integer i;
	initial begin
		// Begin running instructions
		#stimDelay;
		#stimDelay SW = 10'b0;
		KEY = 4'b0;
		#stimDelay SW = 10'b0; 
		// Run long enough to see all states of the counter
		for (i=0; i<36; i=i+1) begin
			#stimDelay;
		end 
		#stimDelay;
		#stimDelay;
		#stimDelay;
		$finish;
	end
	always
	begin
		#stimDelay clk=~clk;

	end
endmodule
