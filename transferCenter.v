module transferCenter (clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	input wire clk, rst, dataIn, readyForTransferIn;
	output reg readyForTransferOut;
	output reg [1:0] localScannerOut;
	output reg [7:0] dataBuffer;
	reg [7:0] byteIn;
	reg [2:0] byteCounter;
	reg readData;
	
	// Sequential
	always @(posedge clk) begin: dataComingIn
		if (rst) begin
			byteIn <= 8'b0;
			dataBuffer <= 8'b0;
			byteCounter <= 3'b0;
		end
		else begin
			byteIn[0] <= dataIn;
		
			integer i;
			for (i = 0; i < 7; i = i + 1) begin // Shift Register
				byteIn[i + 1] <= byteIn[i];
			end
			
			byteCounter <= byteCounter + 1;
			
		end
	end
	
	// Comb
	always @(*) begin: dealWithData
		if (byteCounter == 7) begin
			if (readData) begin
				dataBuffer = byteIn;
				
				// IF DATA DONE, readData = 1'b0; FIND WAY TO TELL IF DATA IS DONE SENDING
				readData = 1'b0;
			
			end
			else
				case(byteIn)
					8'd1: // Buffer 50%
						readyForTransferOut = 1'b0;
						localScannerOut = 2'b10; // Tell local scanner to flush if waiting
					
					8'd2: // Buffer 80%
						readyForTransferOut = readyForTransferIn;
					
					8'd3: // Buffer 90%
						readyForTransferOut = readyForTransferIn;
						localScannerOut = 2'b01; // Tell local scanner to start scanning
					
					8'd4: // Buffer Full
						readyForTransferOut = readyForTransferIn;
					
					8'd5: // Flush the Buffer?
					
						
					8'd6: // Ready?
					
					
					8'd7: // Binary Data Follows
						readyForTransferOut = readyForTransferIn;
						readData = 1'b1;
					
					8'd8: // ASCII Data Follows
						readyForTransferOut = readyForTransferIn;
						readData = 1'b1;
					
				endcase
			end
		end
		else
			localScannerOut = 2'b00;
		end
	
	end

endmodule
