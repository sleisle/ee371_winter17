module lockSystem (clk, rst, innerWater, lockWater, outerWater, outputs, inputs);
	input wire clk, rst;
	input wire [5:0] inputs; // Gondola arriving, Gondola departing, Outer Port, Inner Port, Increase Water, Decrease Water
	output wire [3:0] outputs; // Gondola arriving, Gondola departing, Outer Port Status, Inner Port Status
	output reg [5:0] innerWater, lockWater, outerWater;
	
	parameter outWaterStart = 7.3;
	parameter inWaterStart = 4.9;
	parameter lockWaterStart = 5.2;
	
	

endmodule
