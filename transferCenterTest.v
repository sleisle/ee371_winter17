`include "transferCenterNew.v"

module transferCenterTest;
	reg clk, rst, readyForTransferIn, dataIn;
	reg [1:0] localTransferInput;
	wire readyForTransferOut;
	wire [1:0] localScannerOut;
	wire [7:0] dataBuffer;
	wire [7:0] byteIn;
	wire [2:0] byteCounter;
	wire readData;
	wire [2:0] bitCounter;
	wire [7:0] commandBuffer;

	parameter ClockDelay = 10;

	transferCenterNew dut (bitCounter, clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer, commandBuffer);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	integer i;

	initial begin
		dataIn <= 1'b0;


		rst <= 1'b1; @(posedge clk); 
		rst <= 1'b0;
		dataIn <= 1'b0;
		@(posedge clk); 
		dataIn <= 1'b0;
		@(posedge clk); 
		@(posedge clk); 
		@(posedge clk); 
		

		dataIn <= 1'b0;
		@(posedge clk); 
		dataIn <= 1'b1;
		@(posedge clk); 
		
		@(posedge clk);
		
		$display("sent 7");
		
		
		@(posedge clk); 
		dataIn <= 1'b0;
		@(posedge clk); 
		@(posedge clk); 
		@(posedge clk); 

		dataIn <= 1'b1;

		@(posedge clk); 
		@(posedge clk); 
		@(posedge clk); 
		@(posedge clk); 
		$display("Sent F");

		@(posedge clk);
		@(posedge clk); 	
		
		@(posedge clk); 
		
		@(posedge clk); 
		
		@(posedge clk); 
		
		@(posedge clk); 
		
		dataIn <= 1'b1;		
		@(posedge clk); 
		
		@(posedge clk); 
		
		dataIn <= 1'b0;
		@(posedge clk); 
		
		@(posedge clk); 
		@(posedge clk); 
		@(posedge clk); 
		@(posedge clk); 
		@(posedge clk); 
		@(posedge clk); 
		dataIn <= 1'b1;
		@(posedge clk); 
		@(posedge clk); 

		@(posedge clk); 
		@(posedge clk); 

		$stop;
	end
endmodule
