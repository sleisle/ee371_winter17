module transferCenterNew (bitCounter, clk, rst, dataIn, readyForTransferIn, readyForTransferOut, localScannerOut, dataBuffer, commandBuffer, shiftReg);
	input wire clk, rst, dataIn, readyForTransferIn;
	output wire readyForTransferOut;
	output reg [1:0] localScannerOut;
	output reg [7:0] dataBuffer;
	output reg [7:0] commandBuffer;
	output reg [2:0] bitCounter;
	output reg [7:0] shiftReg;
	reg dataNext;
	
	assign readyForTransferOut = readyForTransferIn;
	
	integer i;
	
	always @(posedge clk or posedge rst) begin: Clocked
		if (rst) begin
			bitCounter <= 3'd7;
			shiftReg <= 8'b0;
		end
		else begin
			bitCounter <= bitCounter + 1'b1;
			shiftReg[0] <= dataIn;
			
			for (i = 0; i < 7; i = i + 1) begin: loops
				shiftReg[i + 1] <= shiftReg[i];
			end
		end
	end
	
	always @(posedge (& (bitCounter ^ 3'b111)) or posedge rst) begin: LATCH
		if (rst) begin
			dataNext = 1'b0;
			localScannerOut = 2'b0;
			dataBuffer = 8'b0;
			commandBuffer = 8'b0;
		end
		else begin
			if (dataNext) begin
				dataBuffer = shiftReg;
				dataNext = 1'b0;
			end
			else begin
				commandBuffer = shiftReg;
			end
		
			case(shiftReg)
				8'd1: begin //50
					localScannerOut = 2'b10;
				
				end
				
				8'd2: begin //80
					
					
				end
				
				8'd3: begin //90
					localScannerOut = 2'b01;
					
				end
				
				8'd4: begin //100
					
					
				end
				
				8'd5: begin //flush
					
					
				end
				
				8'd6: begin //ready
					
					
				end
				
				8'd7: begin //binary
					dataNext = 1'b1;
					localScannerOut = 2'b00;
					
				end
				
				8'd8: begin //ascii
					
					
				end
				
				default: begin
				
				end
			
			endcase
		end
	end

endmodule
