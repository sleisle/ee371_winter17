module scanner (clk, rst, processerIn, processorOut, clkOut, dataOutWire);
	input wire clk, rst;
	input wire [1:0] processerIn;
	output reg processorOut, clkOut, dataOutWire;
	reg [6:0] dataBitCounter;
	reg [1:0] ps, ns;
	reg writeEnable;
	reg [3:0] addressWrite, addressRead;
	wire [7:0] dataOut;
	reg [7:0] dataIn;
	reg [3:0] scanningCounter;
	
	parameter IDLE = 2'b00, ACTIVE = 2'b01, STANDBY = 2'b10, TRANSFER = 2'b11;
	
	dataBuffer buffer (clk, rst, writeEnable, addressWrite, addressRead, dataIn, dataOut);
	
	always @(posedge clk) begin: ClockedStuff
		if (rst) begin
			ps <= IDLE;
			dataBitCounter <= 7'b1111111;
			scanningCounter <= 4'b1111;
		end
		
		else begin
			if (ps == TRANSFER) begin
				clkOut <= clk;
				dataBitCounter <= dataBitCounter + 1'b1;
			end
			else begin
				dataBitCounter <= 7'b1111111;
			end
			
			if (ns != TRANSFER) begin
				clkOut <= 1'b0;
			end
			
			if (ps == ACTIVE) begin
				scanningCounter <= scanningCounter + 1'b1;
				writeEnable <= 1'b1;
				addressWrite <= scanningCounter;
				dataIn <= {4'b0, scanningCounter};
			end
			else begin
				scanningCounter <= 4'b1111;
			end			
			
			ps <= ns;
		end	
	end
	
	always @(posedge dataBitCounter or negedge dataBitCounter) begin: sendingStuff
		addressRead <= dataBitCounter[6:3];
		dataOutWire <= dataOut[dataBitCounter[2:0]];
	end
	
	always @(*) begin
		case(ps)
			IDLE: begin
				processorOut = 1'b0;
				if (processerIn == 2'b01) begin // 1 means start scanning
					ns = ACTIVE;
				end
				else begin
					ns = IDLE;
				end
			end
			
			ACTIVE: begin
				if (scanningCounter > 4'd6) begin // 80%
					processorOut = 1'b1;
				end
				else begin
					processorOut = 1'b0;
				end
				
				if (scanningCounter == 4'd9) begin // 100%
					if (processerIn == 2'b10) begin
						ns = TRANSFER;
					end
					else begin
						ns = STANDBY;
					end
				end
				else begin
					ns = ACTIVE;
				end
			end
			
			STANDBY: begin
				if (processerIn == 2'b10) begin
					ns = TRANSFER;
				end
				else begin
					ns = STANDBY;
				end
			end
			
			TRANSFER: begin
				if (dataBitCounter > 7'd80) begin
					ns = IDLE;
				end
				else begin
					ns = TRANSFER;
				end
			end
		endcase
	end
	
endmodule
