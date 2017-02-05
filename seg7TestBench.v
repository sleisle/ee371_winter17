// Synchronous Down Counter Top Level file for 
// testing and simulation
`include "seg7.v"
module seg7TestBench;
	wire [3:0] bcd;
	wire [6:0] leds;
	// declare an instance of the counter module
	seg7 dut(bcd, leds);
	// declare an instance of the Tester module
	Tester aTester (leds, bcd);
	// file for gtkwave
	initial
		begin
		// file for gtkwave signals
		$dumpfile("seg7.vcd");
		$dumpvars(1,dut);
	end
endmodule 

module Tester(leds, bcd);
	input wire [6:0] leds;
	output reg [3:0] bcd;
	// Clock speed
	parameter stimDelay = 10;
	integer i;
	initial begin
		// Begin running instructions
		#stimDelay;
		#stimDelay bcd = 4'b0000; 
		// Run long enough to see all states of the counter
		for (i=0; i<36; i=i+1) begin
			#stimDelay;
			bcd = bcd + 4'b0001;
		end 
		#stimDelay;
		#stimDelay;
		$finish;
	end
endmodule
