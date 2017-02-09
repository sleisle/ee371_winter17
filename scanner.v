module scanner (clk, rst, readyForTransferIn, localTransferInput, clkOut, dataOut, dataBuffer);
	input wire clk, rst, readyForTransferIn;
	input wire [1:0] localTransferInput;
	output reg clkOut, dataOut;
	reg [1:0] ps;
	reg [1:0] ns;
	output reg [3:0] dataBuffer;
	reg [2:0] slowCount, dataBitCounter;
	reg slowClk;
	reg commandDoneBit;
	reg [7:0] outputBuffer, outputDataBuffer;
	reg [1:0] readyToOutput;
	
	// States of Scanner
	parameter IDLE = 2'b00, ACTIVE = 2'b01, STANDBY = 2'b10, TRANSFER = 2'b11;
	
	// Comb
	always @(*) begin: Comb
		case(ps)
			IDLE: begin
				readyToOutput = 2'b00;
				dataOut = 1'b0;
				outputBuffer = 8'b0;
				outputDataBuffer = 8'b0;
				if (localTransferInput == 2'b01) // 01 means start scanning
					ns = ACTIVE;
				else
					ns = IDLE;
			end
			
			ACTIVE: begin
				outputDataBuffer = 8'b0;
				if (dataBuffer == 7) begin // 80% Full
					ns = ACTIVE;
					dataOut = outputBuffer[7 - dataBitCounter];
					
					// SEND READY_TO_TRANSFER TO OUTPUT DRIVER
					outputBuffer = 8'd2;
					readyToOutput = 2'b01; // 1 means command transfer
					
				end
				else if (dataBuffer == 8) begin // 90% Full
					ns = ACTIVE;
					dataOut = outputBuffer[7 - dataBitCounter];
					
					// SEND START_SCANNING TO OUTPUT DRIVER
					outputBuffer = 8'd3;
					readyToOutput = 2'b01; // 1 means command transfer
					
				end
				else if (dataBuffer == 9) begin // 100% Full
					if (readyForTransferIn) begin
						ns = TRANSFER;
					end
					else begin
						ns = STANDBY;
					end
					dataOut = outputBuffer[7 - dataBitCounter];
					
					outputBuffer = 8'd4;
					readyToOutput = 2'b01; // 1 means command transfer
					
				end
				else begin
					ns = ACTIVE;
					readyToOutput = 2'b0;
					dataOut = 1'b0;
					outputBuffer = 8'b0;
				end
			end
			
			STANDBY: begin
				outputDataBuffer = 8'b0;
				readyToOutput = 2'b00;
				dataOut = outputBuffer[7 - dataBitCounter];
				if (readyForTransferIn)
					ns = TRANSFER;
				else if (localTransferInput == 2'b10) // 10 means other buffer is at 50%
					ns = TRANSFER;
				else
					ns = STANDBY;
			end

			TRANSFER: begin
				outputDataBuffer = {4'b0, dataBuffer}; // Setup an output for data
				if (localTransferInput == 2'b10) begin // OTHER BUFFER REACHED 50%
					ns = IDLE;
					readyToOutput = 2'b00;
					outputBuffer = 8'b0;
				end
				else begin
					// TRANSFER THE DATA
					outputBuffer = 8'd7;
					readyToOutput = 2'b10; // 2 means data transfer
					ns = TRANSFER;
				end
				
				if (readyToOutput[0]) begin // Output a Command
					dataOut = outputBuffer[7 - dataBitCounter];
				end
				else if (readyToOutput[1]) begin // Output Data
					if (~commandDoneBit) begin
						dataOut = outputBuffer[7 - dataBitCounter];
						commandDoneBit = (& dataBitCounter);
					end
					else begin
						dataOut = outputDataBuffer[7 - dataBitCounter];
						commandDoneBit = ~(& dataBitCounter);
						if (~commandDoneBit)
							ns = IDLE;
						else
							ns = TRANSFER;
					end
				end
				else begin
					ns = IDLE;
					dataOut = 1'b0;
					commandDoneBit <= 1'b0;
				end
				
			end
		endcase
		
	end
	
	// Sequential
	always @(posedge clk) begin: States
		if (rst) begin // State Logic
			slowCount <= 3'b0;
			dataBitCounter <= 3'b0;
		end
		else begin
			slowCount <= slowCount + 1'b1;
		end
		
		if (slowCount < 4) // Clk Divider for data buffer vs communication clk
			slowClk <= 1'b1;
		else
			slowClk <= 1'b0;
			
		if (readyToOutput[0] | readyToOutput[1]) begin // Output Data Logic
			clkOut <= clk;
			dataBitCounter <= dataBitCounter + 1'b1;
		end
		else begin
			clkOut <= 1'b0;
		end
		
	end
	
	// Slow Clock Internals
	always @(posedge slowClk or posedge rst) begin: otherClocked
		if (rst) begin
			ps <= 2'b0;
			dataBuffer <= 4'b0;
		end
		else begin
			ps <= ns;
			if (ps == ACTIVE && dataBuffer < 4'd9) begin // Fake Data Counter
				dataBuffer <= dataBuffer + 1'b1;
			end
			else if (dataBuffer > 4'd9)
				dataBuffer <= 4'b0;
		end
		
	end
	
	
endmodule
