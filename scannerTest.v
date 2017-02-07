`include "scanner.v"

module scannerTest;
	reg clk, rst, readyForTransferIn;
	reg [1:0] localTransferInput;
	wire clkOut, dataOut;
	wire [1:0] ps;

	parameter ClockDelay = 10;

	scanner dut (ps, clk, rst, readyForTransferIn, localTransferInput, clkOut, dataOut);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	integer i;

	initial begin
		rst <= 1'b1; @(posedge clk); $display("%b %b %2b", clkOut, dataOut, ps);
		rst <= 1'b0; @(posedge clk); $display("%b %b %2b", clkOut, dataOut, ps);
		localTransferInput <= 2'b01; @(posedge clk); $display("%b %b %2b", clkOut, dataOut, ps);
		
		for (i = 0; i < 30; i++) begin
			@(posedge clk); $display("%b %b %2b", clkOut, dataOut, ps);
		end
		
		$stop;
	end
endmodule