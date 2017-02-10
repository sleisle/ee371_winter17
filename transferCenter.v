module transferCenter (outputByteIn, byteIn, byteCounter, clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer);
	input wire clk, rst, dataIn, readyForTransferIn;
	output reg readyForTransferOut;
	output reg [1:0] localScannerOut;
	output reg [7:0] dataBuffer;
	output reg [7:0] byteIn;
	output reg [3:0] outputByteIn;
	output reg [2:0] byteCounter;
	reg readData;
	
	integer i;
	
	// Sequential
	always @(posedge clk or posedge rst) begin: dataComingIn
		if (rst) begin
			byteIn <= 8'b0;
			byteCounter <= 3'd0;
		end
		else begin
			byteIn[0] <= dataIn;
		
			for (i = 0; i < 7; i = i + 1) begin // Shift Register
				byteIn[i + 1] <= byteIn[i];
			end
			
			byteCounter <= byteCounter + 1'b1;
			
		end
	end
	
	// Comb
	always @(*) begin: dealWithData
		if (rst) begin
			readData = 1'b0;
			localScannerOut = 2'b0;
			dataBuffer = 8'b0;
		end
		else begin
			readyForTransferOut = readyForTransferIn;
			if (byteCounter == 3'd0 && byteIn != 8'b0) begin
				if (readData) begin // Store transferred data from the scanner
					dataBuffer = byteIn;
					
					// We have finished transfering the data to the control station
					readData = 1'b0;
				
				end
				else begin
					outputByteIn = byteIn[3:0];
					case(byteIn)
						8'd1: begin // Buffer 50%
							localScannerOut = 2'b10; // Tell local scanner to flush if waiting
						end
						
						8'd2: begin // Buffer 80%

						end
						
						8'd3: begin // Buffer 90%
							localScannerOut = 2'b01; // Tell local scanner to start scanning
						end
						
						8'd4: begin // Buffer Full

						end
						
						8'd5: begin // Flush the Buffer?
						
						end
						
						8'd6: begin // Ready?
							$display("ready");
						end
						
						8'd7: begin// Binary Data Follows

							readData = 1'b1;
							$display("7");
						end
						
						8'd8: begin // ASCII Data Follows

						end
						
					endcase
				end
			end
		end
	end

endmodule