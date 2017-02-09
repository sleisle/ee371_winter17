`include "scanner.v"

module scannerTest;
	reg clk, rst, readyForTransferIn;
	reg [1:0] localTransferInput;
	wire clkOut, dataOut;

	wire [3:0] dataBuffer;

	parameter ClockDelay = 10;

	scanner dut (clk, rst, readyForTransferIn, localTransferInput, clkOut, dataOut, dataBuffer);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	integer i;

	initial begin
		rst <= 1'b1; @(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);
		rst <= 1'b0; @(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);
		localTransferInput <= 2'b01; @(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);
		
		for (i = 0; i < 50; i = i + 1) begin
			@(posedge clk);$display("%b %b %4b", clkOut, dataOut, dataBuffer);
		end

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);
		
		@(posedge clk);$display("%b %b %4b", clkOut, dataOut, dataBuffer);
		@(posedge clk);$display("%b %b %4b", clkOut, dataOut, dataBuffer);
		@(posedge clk);$display("%b %b %4b", clkOut, dataOut, dataBuffer);
		@(posedge clk);$display("%b %b %4b", clkOut, dataOut, dataBuffer);

		$display("%b %b %4b", clkOut, dataOut, dataBuffer);
		@(posedge clk);
		$display("READY FOR TRANSFER");
		readyForTransferIn <= 1'b1; @(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		for (i = 0; i < 16; i = i + 1) begin
			@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);
		end

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		@(posedge clk); $display("%b %b %4b", clkOut, dataOut, dataBuffer);

		$stop;
	end
endmodule