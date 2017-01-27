// Synchronous Down Counter Top Level file for 
// testing and simulation
`include "lockSystem.v"
`include "compWater.v"
module lockSystemTestBench;
	wire [6:0] inputs;
	wire [4:0] outputs;
	wire [7:0] innerWater, outerWater;
	wire [7:0] lockWater;
	wire clk, rst;
	// declare an instance of the counter module
	lockSystem dut(clk, rst, innerWater, lockWater, outerWater, outputs, inputs);
	// declare an instance of the Tester module
	Tester aTester (clk, rst, innerWater, lockWater, outerWater, outputs, inputs);
	// file for gtkwave
	initial
		begin
		// file for gtkwave signals
		$dumpfile("lockSystem.vcd");
		$dumpvars(1,dut);
	end
endmodule 

module Tester(clk, rst, innerWater, lockWater, outerWater, outputs, inputs);
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
