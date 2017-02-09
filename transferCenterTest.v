`include "transferCenter.v"

module transferCenterTest;
	reg clk, rst, readyForTransferIn, dataIn;
	reg [1:0] localTransferInput;
	wire readyForTransferOut;
	wire [1:0] localScannerOut;
	wire [7:0] dataBuffer;
	wire [7:0] byteIn;
	wire [2:0] byteCounter;
	wire readData;

	parameter ClockDelay = 10;

	transferCenter dut (byteCounter, byteIn, clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	integer i;

	initial begin

		@(posedge clk);
		rst <= 1'b1; @(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		rst <= 1'b0; @(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		
		localTransferInput <= 2'b00; $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		dataIn <= 1;
		for (i = 0; i < 3; i = i + 1) begin
			@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		end
		dataIn <= 0;
		for (i = 0; i < 5; i = i + 1) begin
			@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		end
		for (i = 0; i < 10; i = i + 1) begin
			@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		end

		
		/*
		@(posedge clk); $display("%b %b %2b %4b %3b %3b %1b", clkOut, dataOut, ps, dataBuffer, slowCount, dataBitCounter, commandDoneBit);
		for (i = 0; ~ps[1]; i = i + 1) begin
			@(posedge clk);
		end

		$display("%b %b %2b %4b %3b %3b %1b", clkOut, dataOut, ps, dataBuffer, slowCount, dataBitCounter, commandDoneBit);
		@(posedge clk);
		readyForTransferIn <= 1'b1; @(posedge clk); $display("%b %b %2b %4b %3b %3b %1b", clkOut, dataOut, ps, dataBuffer, slowCount, dataBitCounter, commandDoneBit);

		for (i = 0; i < 16; i = i + 1) begin
			@(posedge clk); $display("%b %b %2b %4b %3b %3b %1b", clkOut, dataOut, ps, dataBuffer, slowCount, dataBitCounter, commandDoneBit);
		end

		@(posedge clk); $display("%b %b %2b %4b %3b %3b %1b", clkOut, dataOut, ps, dataBuffer, slowCount, dataBitCounter, commandDoneBit);
		*/
		$stop;
	end
endmodule
