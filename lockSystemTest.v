`include "lockSystem.v"
`include "compWater.v"

module compWaterTest;
	reg clk, rst;
	reg [6:0] inputs;
	wire [7:0] innerWater, lockWater, outerWater;
	wire [4:0] outputs;

	parameter ClockDelay = 10;

	lockSystem dut (clk, rst, innerWater, lockWater, outerWater, outputs, inputs);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	integer i;

	initial begin
		
		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b0000000;
		rst <= 1'b1;	@(posedge clk);
		rst <= 1'b0;	@(posedge clk);

		// Gondola arriving, Gondola departing, Outer Port, Inner Port, Increase Water, Decrease Water
		inputs <= 7'b0011100;

		for (i = 0; i < 11; i = i + 1) begin
			@(posedge clk);
			$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		end

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		$display("Increasing water to put gondola in from outside");
		inputs <= 7'b1000001;
		@(posedge clk);

		for (i = 0; i < 5; i = i + 1) begin
			@(posedge clk);
			$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		end

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b1000000;
		@(posedge clk);

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b1000000;
		@(posedge clk);

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b1000000;
		@(posedge clk);

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b1000000;
		@(posedge clk);

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b0000000;
		@(posedge clk);

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b0001100;
		@(posedge clk);

		$display("Decreasing water to get gondola inside");
		inputs <= 7'b0101100;

		for (i = 0; i < 12; i = i + 1) begin
			@(posedge clk);
			$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		end


		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b0000010;
		@(posedge clk);

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b0000010;
		@(posedge clk);

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b0000000;
		@(posedge clk);

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b0000000;
		@(posedge clk);

		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		inputs <= 7'b0000000;
		@(posedge clk);
		
		$display("%2d %2d %2d %4b", innerWater, lockWater, outerWater, outputs);
		
		$dumpvars(1, dut);
		$stop;
	end
endmodule