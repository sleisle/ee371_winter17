// Synchronous Down Counter data flow implementation
// Top Level file for testing and simulation
`include "DFlipFlop.v"
`include "SynchronousDownCounterDFlow.v"
module SynchronousDownCounterDFlowTestBench;
	wire clk, rst;
	wire [3:0] out;
	// declare an instance of the counter module
	SynchronousDownCounterDFlow dut(out[3:0], clk, rst);
	// declare an instance of the Tester module
	Tester aTester (clk, rst, out[3:0]);
	// file for gtkwave
	initial
		begin
		// file for gtkwave signals
		$dumpfile("SynchronousDownCounterDFlow.vcd");
		$dumpvars(1,dut);
	end
endmodule 

module Tester(clk, rst, out);
	input [3:0] out;
	output clk, rst;
	reg clk, rst;
	// Clock speed
	parameter stimDelay = 10;
	integer i;
	initial begin
		clk=0;
		// Begin running instructions
		#stimDelay;
		#stimDelay rst = 0; 
		#stimDelay rst = 1;
		// Run long enough to see all states of the counter
		for (i=0; i<36; i=i+1) begin
			#stimDelay;
		end 
		#stimDelay rst = 0;
		#stimDelay;
		#stimDelay;
		$finish;
	end
	// Clock set-up
	always
	begin
		#stimDelay clk=~clk;
	end
endmodule