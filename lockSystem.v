module lockSystem (clk, rst, innerWater, lockWater, outerWater, outputs, inputs);
	input wire clk, rst;
	input wire [5:0] inputs; // Gondola arriving, Gondola departing, Outer Port, Inner Port, Increase Water, Decrease Water
	output wire [3:0] outputs; // Gondola arriving, Gondola departing, Outer Port Status, Inner Port Status
	output reg [7:0] innerWater, lockWater, outerWater;
	
	wire matchOuterWater, matchInnerWater;
	
	parameter lockWaterStart = 52;
	
	always @(*) begin
		outerWater = 8'd73;
		innerWater = 8'd49;
	end
	
	compWater outerWaterCheck (matchOuterWater, outerWater, lockWater);
	compWater innerWaterCheck (matchInnerWater, innerWater, lockWater);
	
	

endmodule
