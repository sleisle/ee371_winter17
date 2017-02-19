module dataBuffer (clk, rst, writeEnable, addressWrite, addressRead, dataIn, dataOut);
	reg [7:0] buffer [9:0]; // 10 entry byte buffer
	output reg [7:0] dataOut;
	input wire clk, rst, writeEnable;
	input wire [3:0] addressWrite, addressRead;
	input wire [7:0] dataIn;
	
	integer i;
	
	always @(posedge clk) begin: ClockedStuff
		if (rst) begin
			$display("rst");
			for (i = 0; i < 10; i = i + 1) begin
				buffer[i] = 8'b0;
			end
		end
		
		else begin
			if (writeEnable && addressWrite < 4'd10) begin
				$display("write");
				buffer[addressWrite] = dataIn;
			end
		end
	end
	
	always @(*) begin: outputData
		if (addressRead < 4'd10) begin
			$display("read");
			dataOut = buffer[addressRead];
		end
	end
	
endmodule

module dataBufferTestBench();
	wire [7:0] dataOut;
	reg clk, rst, writeEnable;
	reg [3:0] addressWrite, addressRead;
	reg [7:0] dataIn;
	
	dataBuffer dut (clk, rst, writeEnable, addressWrite, addressRead, dataIn, dataOut);
	
	parameter ClockDelay = 10;
	
	initial begin // Set up the clock
		clk <= 1'b0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
										@(posedge clk);
		rst <= 1'b1;				@(posedge clk);
										@(posedge clk);
		rst <= 1'b0;				@(posedge clk);
		addressWrite <= 4'd2;
		addressRead <= 4'd1;
		dataIn <= 8'd123;			@(posedge clk);
		addressWrite <= 4'd7;
		writeEnable <= 1'b1;		@(posedge clk);
		addressRead <= 4'd7;		@(posedge clk);
		addressWrite <= 4'd12;	@(posedge clk);
		rst <= 1'b1;				@(posedge clk);
		rst <= 1'b0;				@(posedge clk);
										@(posedge clk);
		
		$stop;
	end
	
endmodule
