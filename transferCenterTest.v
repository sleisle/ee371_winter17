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
		dataIn <= 1'b0;

		@(posedge clk);
		rst <= 1'b1; @(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		rst <= 1'b0; $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);

		dataIn <= 1'b1;
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);

		dataIn <= 1'b1;

		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);

		dataIn <= 1'b0;

		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);


		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);
		@(posedge clk); $display("%b %b %2b %8b %8b %3b", readyForTransferOut, dataIn, localScannerOut, dataBuffer, byteIn, byteCounter);




		$stop;
	end
endmodule
