module scanner (clk, rst, readyForTransferIn, localTransferInput, clkOut, dataOut, dataBuffer);
	input wire clk, rst, readyForTransferIn;
	input wire [1:0] localTransferInput;
	output reg dataOut;
	output reg clkOut;
	reg [1:0] ps;
	reg [1:0] ns;
	output reg [3:0] dataBuffer;
	reg [2:0] slowCount, dataBitCounter;
	reg slowClk, setOutClk;
	reg commandDoneBit;
	reg [7:0] outputBuffer, outputDataBuffer;
	reg [1:0] readyToOutput;
	
	// States of Scanner
	parameter IDLE = 2'b00, ACTIVE = 2'b01, STANDBY = 2'b10, TRANSFER = 2'b11;
	
	// Comb
	always @(*) begin: Comb
		if (rst)
			ns = ACTIVE;
		case(ps)
			IDLE: begin
				clkOut = 1'b0;
				commandDoneBit = 1'b0;
				readyToOutput = 2'b00;
				if (localTransferInput == 2'b01) // 01 means start scanning
					ns = ACTIVE;
				else
					ns = IDLE;
			end
			
			ACTIVE: begin
				commandDoneBit = 1'b0;
				if (dataBuffer == 7) begin // 80% Full
					if (localTransferInput == 2'b10) begin // OTHER BUFFER REACHED 50%
						ns = IDLE;
					end
					else begin
						ns = ACTIVE;
						
						// SEND READY_TO_TRANSFER TO OUTPUT DRIVER
						outputBuffer = 8'd2;
						dataOut = outputBuffer[7 - dataBitCounter];
						readyToOutput = 2'b01; // 1 means command transfer
						clkOut = clk;
					end
					
				end
				else if (dataBuffer == 8) begin // 90% Full
					if (localTransferInput == 2'b10) begin // OTHER BUFFER REACHED 50%
						ns = IDLE;
					end
					else begin
						ns = ACTIVE;
						// SEND START_SCANNING TO OUTPUT DRIVER
						outputBuffer = 8'd3;
						dataOut = outputBuffer[7 - dataBitCounter];
						readyToOutput = 2'b01; // 1 means command transfer
						clkOut = clk;
					end
					
				end
				else if (dataBuffer == 9) begin // 100% Full
					if (localTransferInput == 2'b10) begin // OTHER BUFFER REACHED 50%
						ns = IDLE;
					end
					else begin
						dataOut = outputBuffer[7 - dataBitCounter];
						
						outputBuffer = 8'd4;
						readyToOutput = 2'b01; // 1 means command transfer
					
						if (readyForTransferIn) begin
							ns = TRANSFER;
							clkOut = clk;
						end
						else begin
							ns = STANDBY;
							clkOut = 1'b0;
						end
					end
					
				end
				else begin
					ns = ACTIVE;
					clkOut = 1'b0;
					dataOut = 1'b0;
				end
			end
			
			STANDBY: begin
				commandDoneBit = 1'b0;
				clkOut = 1'b0;
				dataOut = outputBuffer[7 - dataBitCounter];
				if (readyForTransferIn)
					ns = TRANSFER;
				else if (localTransferInput == 2'b10) // 10 means other buffer is at 50%
					ns = IDLE;
				else
					ns = STANDBY;
			end

			TRANSFER: begin
				outputDataBuffer = {4'b0, dataBuffer}; // Setup an output for data
				if (localTransferInput == 2'b10) begin // OTHER BUFFER REACHED 50%
					ns = IDLE;
					clkOut = 1'b0;
				end
				else begin
					// TRANSFER THE DATA
					outputBuffer = 8'd7;
					readyToOutput = 2'b10; // 2 means data transfer
					clkOut = clk;
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
				else
					ns = IDLE;
				
			end
		endcase
		
	end
	
	// Sequential
	always @(posedge clk or posedge rst) begin: States
		if (rst) begin // State Logic
			slowCount <= 3'b0;
			dataBitCounter <= 3'b0;
		end
		else begin
			slowCount <= slowCount + 1'b1;
		
			if (slowCount < 4) // Clk Divider for data buffer vs communication clk
				slowClk <= 1'b1;
			else
				slowClk <= 1'b0;
				
			if (readyToOutput[0] | readyToOutput[1]) begin // Output Data Logic
				dataBitCounter <= dataBitCounter + 1'b1;
			end
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
			
			if (ps == ACTIVE && dataBuffer < 4'd9 && ns != IDLE) begin // Fake Data Counter
				dataBuffer <= dataBuffer + 1'b1;
			end
			else if (ns == IDLE) begin
				dataBuffer = 4'b0;
			end
			else begin
				dataBuffer <= dataBuffer;
			end
		end
	end
	
	
endmodule
