`include "scanner.v"

module scannerTest;
	reg clk, rst, readyForTransferIn;
	reg [1:0] localTransferInput;
	wire clkOut, dataOut;
	wire [1:0] ps;
	wire [7:0] outputDataBuffer, outputBuffer;

	wire [3:0] dataBuffer;

	parameter ClockDelay = 10;

	scanner dut (ps, outputDataBuffer, outputBuffer, clk, rst, readyForTransferIn, localTransferInput, clkOut, dataOut, dataBuffer);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	integer i;

	initial begin
		rst <= 1'b1; @(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);
		rst <= 1'b0; @(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);
		localTransferInput <= 2'b01; @(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);
		
		for (i = 0; i < 50; i = i + 1) begin
			@(posedge clk);$display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);
		end

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);
		
		@(posedge clk);$display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);
		@(posedge clk);$display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);
		@(posedge clk);$display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);
		@(posedge clk);$display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		
		@(posedge clk);$display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		$display("READY FOR TRANSFER");
		readyForTransferIn <= 1'b1; @(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		for (i = 0; i < 16; i = i + 1) begin
			@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);
		end

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		@(posedge clk); $display("%b %b %2b %4b %8b %8b", clkOut, dataOut, ps, dataBuffer, outputDataBuffer, outputBuffer);

		$stop;
	end
endmodule