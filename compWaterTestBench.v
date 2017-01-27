// Synchronous Down Counter Top Level file for 
// testing and simulation
`include "compWater.v"
module compWaterTestBench;
	wire [7:0] water1, water2;
	wire rtn;
	// declare an instance of the counter module
	compWater dut(rtn, water1, water2);
	// declare an instance of the Tester module
	Tester aTester (water1, water2, rtn);
	// file for gtkwave
	initial
		begin
		// file for gtkwave signals
		$dumpfile("compWater.vcd");
		$dumpvars(1,dut);
	end
endmodule 

module Tester(water1, water2, rtn);
	input wire rtn;
	output reg [7:0] water1, water2;
	// Clock speed
	parameter stimDelay = 10;
	integer i;
	initial begin
		// Begin running instructions
		water1 = 8'd50;
		water2 = 8'd45;
		#stimDelay;
		#stimDelay water2 = 8'd48;
		#stimDelay water2 = 8'd51;
		#stimDelay water2 = 8'd58;
		#stimDelay;
		$finish;
	end
endmodule
