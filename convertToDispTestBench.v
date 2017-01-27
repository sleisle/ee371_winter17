// Synchronous Down Counter Top Level file for 
// testing and simulation
`include "convertToDisp.v"
module convertToDispTestBench;
	wire [7:0] in, out;
	// declare an instance of the counter module
	convertToDisp dut(out, in);
	// declare an instance of the Tester module
	Tester aTester (in, out);
	// file for gtkwave
	initial
		begin
		// file for gtkwave signals
		$dumpfile("convertToDisp.vcd");
		$dumpvars(1,dut);
	end
endmodule 

module Tester(in, out);
	input wire [7:0] out;
	output reg [7:0] in;
	// Clock speed
	parameter stimDelay = 10;
	integer i;
	initial begin
		// Begin running instructions
		#stimDelay;
		#stimDelay in = 8'b0; 
		// Run long enough to see all states of the counter
		for (i=0; i<36; i=i+1) begin
			#stimDelay;
			in = in + 8'b1;
		end
		#stimDelay;
		#stimDelay;
		$finish;
	end
endmodule
