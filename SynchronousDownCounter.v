// Keegan Griffee
// Joe Jimenez
// Sean Leisle
// EE 371
// Lab 1: 4 stage synchronous Johnson down counter
// A 4 stage synchronous Johnson down counter with active low reset

module SynchronousDownCounter (out, clk, rst);
	input clk, rst;
	output [3:0] out;
	wire [3:0] qBar;
	wire [3:0] ands;
	wire [3:0] xors;
	
	assign ands[0] = rst & out[0];
	assign ands[1] = ands[0] & out[1];
	assign ands[2] = ands[1] & out[2];
	assign ands[3] = ands[2] & out[3];
	
	assign xors[0] = rst ^ out[0];
	assign xors[1] = ands[0] ^ out[1];
	assign xors[2] = ands[1] ^ out[2];
	assign xors[3] = ands[2] ^ out[3];
	
	DFlipFlop q0(out[0], qBar[0], xors[0], clk, rst);
	DFlipFlop q1(out[1], qBar[1], xors[1], clk, rst);
	DFlipFlop q2(out[2], qBar[2], xors[2], clk, rst);
	DFlipFlop q3(out[3], qBar[3], xors[3], clk, rst);
	
endmodule
	