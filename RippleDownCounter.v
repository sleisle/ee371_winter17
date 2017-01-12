// Keegan Griffee
// Joe Jimenez
// Sean Leisle
// EE 371
// Lab 1: 4 stage ripple down counter
// A 4 stage ripple down counter with active low reset
`include "DFlipFlop.v"

module RippleDownCounter (out, clk, rst);
	input clk, rst;
	output [3:0] out;
	
	wire [3:0] qBarTemp;
	
	DFlipFlop q0(out[0], qBarTemp[0], qBarTemp[0], clk, rst);
	DFlipFlop q1(out[1], qBarTemp[1], qBarTemp[1], out[0], rst);
	DFlipFlop q2(out[2], qBarTemp[2], qBarTemp[2], out[1], rst);
	DFlipFlop q3(out[3], qBarTemp[3], qBarTemp[3], out[2], rst);
endmodule	
