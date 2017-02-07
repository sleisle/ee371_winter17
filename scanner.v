module scanner (ps, clk, rst, readyForTransferIn, localTransferInput, clkOut, dataOut);
	input wire clk, rst, readyForTransferIn;
	input wire [1:0] localTransferInput;
	output reg clkOut, dataOut;
	output reg [1:0] ps;
	reg [1:0] ns;
	reg [3:0] dataBuffer;
	reg [2:0] slowCount, dataBitCounter;
	reg slowClk, commandDoneBit;
	reg [7:0] outputBuffer, outputDataBuffer;
	reg [1:0] readyToOutput;
	
	// States of Scanner
	parameter IDLE = 2'b00, ACTIVE = 2'b01, STANDBY = 2'b10, TRANSFER = 2'b11;
	
	// Comb
	always @(*) begin: Comb
		case(ps)
			IDLE: begin
				readyToOutput = 2'b00;
				if (localTransferInput == 2'b01) // 01 means start scanning
					ns = ACTIVE;
				else
					ns = IDLE;
			end
			
			ACTIVE: begin
				if (dataBuffer == 7) begin // 80% Full
					ns = ACTIVE;
					
					// SEND READY_TO_TRANSFER TO OUTPUT DRIVER
					outputBuffer = 8'd2;
					readyToOutput = 2'b01; // 1 means command transfer
					
				end
				else if (dataBuffer == 8) begin // 90% Full
					ns = ACTIVE;
					
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
					
					outputBuffer = 8'd4;
					readyToOutput = 2'b01; // 1 means command transfer
					
				end
				else begin
					ns = ACTIVE;
				end
			end
			
			STANDBY: begin
				if (readyForTransferIn)
					ns = TRANSFER;
				else if (localTransferInput == 2'b10) // 10 means other buffer is at 50%
					ns = TRANSFER;
				else
					ns = STANDBY;
			end

			TRANSFER: begin
				outputDataBuffer = {5'b0, dataBuffer}; // Setup an output for data
				if (localTransferInput == 2'b10) // OTHER BUFFER REACHED 50%
					dataBuffer = 4'b0;
				else begin
					// TRANSFER THE DATA
					outputBuffer = 8'd7;
					readyToOutput = 2'b10; // 2 means data transfer
				end
			end
		endcase
	end
	
	// Sequential
	always @(posedge clk) begin: States
		if (rst) begin // State Logic
			ps <= 2'b0;
			dataBuffer <= 4'b0;
			slowCount <= 3'b0;
			dataBitCounter <= 3'b0;
		end
		else begin
			ps <= ns;
			slowCount <= slowCount + 1'b1;
		end
		
		if (slowCount < 4) // Clk Divider for data buffer vs communication clk
			slowClk <= 1'b1;
		else
			slowClk <= 1'b0;
			
		if (readyToOutput[0] | readyToOutput[1]) begin // Output Data Logic
			clkOut <= clk;
			dataBitCounter <= dataBitCounter + 1'b1;
			if (readyToOutput[0]) begin // Output a Command
				dataOut <= outputBuffer[dataBitCounter];
			end
			else if (readyToOutput[1]) begin // Output Data
				if (~commandDoneBit) begin
					dataOut <= outputBuffer[dataBitCounter];
					commandDoneBit <= (& dataBitCounter); // THIS MAY NOT WORK?
				end
				else begin
					dataOut <= outputDataBuffer[dataBitCounter];
				end
			end
		end
		else begin
			clkOut <= 1'b0;
		end
		
	end
	
	// Slow Clock Internals
	always @(posedge slowClk) begin: otherClocked
		if (ps == ACTIVE) begin // Fake Data Counter
			dataBuffer <= dataBuffer + 1'b1;
		end
	end
	
	
endmodule
