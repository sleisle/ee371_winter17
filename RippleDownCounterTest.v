`include "RippleDownCounter.v"
`include "DFlipFlop.v"

module SynchronousDownCounterTest();
	reg clk, rst;
	wire [3:0] out;
	
	parameter ClockDelay = 10;
	parameter loopEnd = 20;  // Set to 1300 to get through benchmarks 11-12
	
	RippleDownCounter dut(out[3:0], clk, rst);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	integer i;
	
	initial begin
		@(posedge clk);
		@(posedge clk);
		rst <= 0; @(posedge clk);
		rst <= 1; @(posedge clk);
		// Begin running instructions
		for (i=0; i<loopEnd; i=i+1) begin
			@(posedge clk);
			$display("%4b", out);
		end
		
		$stop;
	end
endmodule