// Keegan Griffee
// Joe Jimenez
// Sean Leisle
// EE 371
// Lab 1: 4 stage synchronous Johnson down counter
// A 4 stage synchronous Johnson down counter with active low reset
`include "DFlipFlop.v"

module SynchronousDownCounter (out, clk, rst);
	input clk, rst;
	output [3:0] out;
	wire [3:0] qBar;
	wire [3:0] nVal;
	
	assign nVal[0] = qBar[0];
	assign nVal[1] = ~ (out[0] ^ out[1]);
	assign nVal[2] = (out[2] & (out[0] | out[1])) | (qBar[2] & (qBar[0] & qBar[1]));
	assign nVal[3] = (out[3] & (out[0] | out[1] | out[2])) | (qBar[3] & (qBar[0] & qBar[1] & qBar[2]));
	
	DFlipFlop qBar0(out[0], qBar[0], nVal[0], clk, rst);
	DFlipFlop qBar1(out[1], qBar[1], nVal[1], clk, rst);
	DFlipFlop qBar2(out[2], qBar[2], nVal[2], clk, rst);
	DFlipFlop qBar3(out[3], qBar[3], nVal[3], clk, rst);
	
endmodule
	
