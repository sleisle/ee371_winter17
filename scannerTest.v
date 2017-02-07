`include "scanner.v"

module scannerTest;
	reg clk, rst, readyForTransferIn;
	reg [1:0] localTransferInput;
	wire clkOut, dataOut;
	wire [1:0] ps;
	wire [3:0] dataBuffer;
	wire [2:0] slowCount;

	parameter ClockDelay = 10;

	scanner dut (slowCount, dataBuffer, ps, clk, rst, readyForTransferIn, localTransferInput, clkOut, dataOut);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	integer i;

	initial begin
		rst <= 1'b1; @(posedge clk); $display("%b %b %2b %4b %3b", clkOut, dataOut, ps, dataBuffer, slowCount);
		rst <= 1'b0; @(posedge clk); $display("%b %b %2b %4b %3b", clkOut, dataOut, ps, dataBuffer, slowCount);
		localTransferInput <= 2'b01; @(posedge clk); $display("%b %b %2b %4b %3b", clkOut, dataOut, ps, dataBuffer, slowCount);
		
		for (i = 0; i < 50; i = i + 1) begin
			@(posedge clk);
		end

		@(posedge clk); $display("%b %b %2b %4b %3b", clkOut, dataOut, ps, dataBuffer, slowCount);
		for (i = 0; ~ps[1]; i = i + 1) begin
			@(posedge clk);
		end

		$display("%b %b %2b %4b %3b", clkOut, dataOut, ps, dataBuffer, slowCount);
		@(posedge clk);
		readyForTransferIn <= 1'b1; @(posedge clk); $display("%b %b %2b %4b %3b", clkOut, dataOut, ps, dataBuffer, slowCount);

		for (i = 0; i < 16; i = i + 1) begin
			@(posedge clk); $display("%b %b %2b %4b %3b", clkOut, dataOut, ps, dataBuffer, slowCount);
		end

		@(posedge clk); $display("%b %b %2b %4b %3b", clkOut, dataOut, ps, dataBuffer, slowCount);

		$stop;
	end
endmodule