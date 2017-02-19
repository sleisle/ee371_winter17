module scanner (clk, rst, processerIn, processerOut, clkOut, dataOutWire);
	input wire clk, rst;
	input wire [1:0] processerIn;
	output reg processerOut, clkOut, dataOutWire;
	reg [6:0] dataBitCounter;
	reg [1:0] ps, ns;
	reg writeEnable;
	reg [3:0] addressWrite, addressRead;
	wire [7:0] dataOut;
	reg [7:0] dataIn;
	reg [3:0] scanningCounter;
	reg [2:0] counter8;
	
	parameter IDLE = 2'b00, ACTIVE = 2'b01, STANDBY = 2'b10, TRANSFER = 2'b11;
	
	dataBuffer buffer (clk, rst, writeEnable, addressWrite, addressRead, dataIn, dataOut);
	
	always @(posedge clk) begin: ClockedStuff
		if (rst) begin
			ps <= IDLE;
			dataBitCounter <= 7'b0000000;
			counter8 <= 3'b0;
			scanningCounter <= 4'b0000;
		end
		
		else begin
			if (ns == TRANSFER) begin
				dataBitCounter <= dataBitCounter + 1'b1;
				counter8 <= counter8 + 1'b1;
			end
			else begin
				dataBitCounter <= 7'b0000000;
				counter8 <= 3'b0;
			end
			
			if (ns == ACTIVE) begin
				scanningCounter <= scanningCounter + 1'b1;
				writeEnable <= 1'b1;
				addressWrite <= scanningCounter;
				dataIn <= {4'b0, scanningCounter};
			end
			else begin
				scanningCounter <= 4'b0000;
			end			
			
			ps <= ns;
		end	
	end
	
	always @(*) begin
		addressRead = dataBitCounter[6:3];
		dataOutWire = dataOut[counter8];
	
		case(ps)
			IDLE: begin
				clkOut <= 1'b0;
				processerOut = 1'b0;
				if (processerIn == 2'b01) begin // 1 means start scanning
					ns = ACTIVE;
				end
				else begin
					ns = IDLE;
				end
			end
			
			ACTIVE: begin
				clkOut <= 1'b0;
				if (scanningCounter > 4'd6) begin // 80%
					processerOut = 1'b1;
				end
				else begin
					processerOut = 1'b0;
				end
				
				if (scanningCounter == 4'd10) begin // 100%
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
				clkOut <= 1'b0;
				if (processerIn == 2'b10) begin
					ns = TRANSFER;
				end
				else begin
					ns = STANDBY;
				end
			end
			
			TRANSFER: begin
				clkOut <= clk;
				if (dataBitCounter > 7'd80) begin
					ns = IDLE;
					clkOut <= 1'b0;
				end
				else begin
					ns = TRANSFER;
				end
			end
		endcase
	end
	
endmodule

module scannerTestBench();
	reg clk, rst;
	reg [1:0] processerIn;
	wire processerOut, clkOut, dataOutWire;
	
	scanner dut (clk, rst, processerIn, processerOut, clkOut, dataOutWire);
	
	parameter ClockDelay = 10;
	integer i;
	
	initial begin // Set up the clock
		clk <= 1'b0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
										@(posedge clk);
		rst <= 1'b1;				@(posedge clk);
		processerIn <= 2'b00;
		rst <= 1'b0;				@(posedge clk);
		processerIn <= 2'b01;	@(posedge clk);
		
		for (i = 0; i < 15; i = i + 1) begin
			@(posedge clk);
		end
		processerIn <= 2'b10;	@(posedge clk);
	
		for (i = 0; i < 100; i = i + 1) begin
			@(posedge clk);
		end
	
		$stop;
	end

endmodule

