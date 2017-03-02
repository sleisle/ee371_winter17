module comms (clk, rst, clkIn, dataIn, clkOut, dataOut, readyToTransferIn, readyToTransferOut, sendBuffer, receiveBuffer, startTransfer);
	input wire clk, rst, clkIn, dataIn, readyToTransferIn, startTransfer;
	output reg dataOut, readyToTransferOut;
	input wire [255:0] receiveBuffer, sendBuffer;
	output reg clkOut;
	reg [8:0] dataBitCounter;
	
	reg [2:0] cdiv;
	wire clkOutWire;
	reg transfer;
	
	assign clkOutWire = cdiv[2];
	
	// Transfer if startTransfer | dataBitCounter != 255
	
	always @(posedge clk or posedge rst) begin: divide // Divide clk by 8 to make clkOut sig
		if (rst) begin
			cdiv <= 3'b0;
		end
		else begin
			cdiv <= cdiv + 1'b1;
			clkOut <= clkOutWire & transfer;
			transfer <= startTransfer | ~(dataBitCounter[8]);
		end
	end
	
	always @ (posedge clkOut or posedge rst) begin: sendData // Set data wire if clkOut is going
		if (rst) begin
			dataBitCounter <= 9'b0;
		end
		else begin
			dataBitCounter <= dataBitCounter + 1'b1;
			dataOut <= sendBuffer[dataBitCounter[7:0]];
			if (dataBitCounter[8]) begin
				dataBitCounter[8] <= 1'b0;
			end
		end
	end
	
	
endmodule

module commsTestBench();
	reg clk, rst, dataIn, clkIn, readyToTransferIn, startTransfer;
	wire dataOut, readyToTransferOut, clkOut;
	reg [255:0] receiveBuffer, sendBuffer;

	comms dut (clk, rst, clkIn, dataIn, clkOut, dataOut, readyToTransferIn, readyToTransferOut, sendBuffer, receiveBuffer, startTransfer);
	
	parameter ClockDelay = 5;
	integer i;
	
	initial begin // Set up the clock
		clk <= 1'b0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		rst <= 1'b1;						@(posedge clk);
		rst <= 1'b0;						@(posedge clk);
		sendBuffer <= (256'b1 << 255) + 1'b1;	@(posedge clk);
												@(posedge clk);
		startTransfer <= 1'b1;			@(posedge clk);
												@(posedge clk);
		startTransfer <= 1'b0;			@(posedge clk);
		
		for (i = 0; i < 2500; i = i + 1) begin
			@(posedge clk);
		end
		
												@(posedge clk);
		startTransfer <= 1'b1;			@(posedge clk);
												@(posedge clk);
		startTransfer <= 1'b0;			@(posedge clk);
		
		for (i = 0; i < 2500; i = i + 1) begin
			@(posedge clk);
		end
	
		$stop;
	end
	
endmodule





