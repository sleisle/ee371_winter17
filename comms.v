module comms (clk, rst, clkIn, dataIn, clkOut, dataOut, readyForSend, readyForReceive, sendBuffer, receiveBuffer, startTransfer, newData);
	input wire clk, rst, clkIn, dataIn, readyForSend, startTransfer;
	output reg dataOut, newData;
	input wire [255:0] sendBuffer;
	output reg [255:0] receiveBuffer;
	output reg clkOut;
	input wire readyForReceive;
	
	reg [8:0] dataBitCounter;
	reg [7:0] dataInCounter;
	
	reg [2:0] cdiv;
	wire clkOutWire;
	reg transfer;
	
	assign clkOutWire = cdiv[0];
	
	// Transfer if startTransfer | dataBitCounter != 255
		
	// Sending Data
	always @(posedge startTransfer or posedge dataBitCounter[8] or posedge rst) begin: trans
		if (rst) begin
			transfer <= 1'b0;
		end 
		else begin
			if (startTransfer) begin
				transfer <= readyForSend;
			end
			else begin
				transfer <= 1'b0;
			end
		end
	end
	
	always @(posedge clk or posedge rst) begin: divide // Divide clk by 8 to make clkOut sig
		if (rst) begin
			cdiv <= 3'b0;
		end
		else begin
			cdiv <= cdiv + 1'b1;
			clkOut <= clkOutWire & transfer;
			//transfer <= (startTransfer & readyForSend) | ~(dataBitCounter[8]);
		end
	end
	
	always @(posedge clkOut or posedge rst) begin: sendData // Set data wire if clkOut is going
		if (rst) begin
			dataBitCounter <= 9'b0;
		end
		else begin
			dataBitCounter <= dataBitCounter + 1'b1;
			if (dataBitCounter[8]) begin
				dataBitCounter[8] <= 1'b0;
			end
		end
	end
	
	always @(posedge rst or negedge clk) begin: setSendData
		if (rst) begin
			dataOut <= sendBuffer[0];
		end
		else begin
			dataOut <= sendBuffer[dataBitCounter[7:0]];
		end
	end
	
	// Receiving Data
	always @(posedge clkIn or posedge rst) begin: receiveData
		if (rst) begin
			receiveBuffer <= 8'b0;
		end
		else begin
			if (readyForReceive) begin
				receiveBuffer[dataInCounter] <= dataIn;
			end
			else begin
				receiveBuffer <= sendBuffer;
			end
		end
	end
	
	always @(negedge clkIn or posedge rst or negedge readyForReceive) begin: receiveSafe
		if (rst) begin
			dataInCounter <= 8'b0;
		end
		else if (~readyForReceive) begin
			dataInCounter <= 8'b0;
		end
		else begin
			dataInCounter <= dataInCounter + 1'b1;
		end
	end
	
	always @(negedge dataInCounter[7] or posedge rst) begin: newDataIn
		if (rst) begin
			newData <= 1'b0;
		end		
		else if (~newData) begin
			newData <= 1'b1;
		end
	end
	
endmodule

module commsTestBench();
	reg clk, rst, readyForSend, startTransfer;
	wire dataOut, readyForReceive, clkOut;
	reg [255:0] sendBuffer;
	wire [255:0] receiveBuffer;
	wire connectData, connectClk;
	
	buf #1 b0 (connectData, dataOut);
	buf #1 b1 (connectClk, clkOut);
	
	comms dut (clk, rst, connectClk, connectData, clkOut, dataOut, readyForSend, readyForReceive, sendBuffer, receiveBuffer, startTransfer);
	
	parameter ClockDelay = 5;
	integer i;
	
	initial begin // Set up the clock
		clk <= 1'b0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		rst <= 1'b1;						@(posedge clk);
		rst <= 1'b0;						@(posedge clk);
		rst <= 1'b1;						@(posedge clk);
		rst <= 1'b0;						@(posedge clk);
		sendBuffer <= (256'b1 << 255) + 1'b1;	@(posedge clk);
												@(posedge clk);
		startTransfer <= 1'b1;
		readyForSend <= 1'b1;			@(posedge clk);
												@(posedge clk);
		startTransfer <= 1'b0;			@(posedge clk);
		
		for (i = 0; i < 2500; i = i + 1) begin
			@(posedge clk);
		end
		
												@(posedge clk);
												
		sendBuffer <= 256'h3030303003030303303030300000000000000000010101011010101001010101;
												@(posedge clk);
		startTransfer <= 1'b1;			@(posedge clk);
												@(posedge clk);
		startTransfer <= 1'b0;			@(posedge clk);
		
		for (i = 0; i < 2500; i = i + 1) begin
			@(posedge clk);
			if (i == 1200) begin
				rst <= 1'b1; @(posedge clk);
				rst <= 1'b0; @(posedge clk);
			end
		end
		
		sendBuffer <= 256'h3030303003030303303030300000000000000000010101011010101005050505;
		
		startTransfer <= 1'b1;			@(posedge clk);
												@(posedge clk);
		startTransfer <= 1'b0;			@(posedge clk);
		
		for (i = 0; i < 2500; i = i + 1) begin
			@(posedge clk);
		end
	
		$stop;
	end
	
endmodule



