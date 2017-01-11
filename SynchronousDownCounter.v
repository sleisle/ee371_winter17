// Keegan Griffee
// Joe Jimenez
// Sean Leisle
// EE 371
// Lab 1: 4 stage synchronous Johnson down counter
// A 4 stage synchronous Johnson down counter with active low reset

module SynchronousDownCounter (out, clk, rst);
	input clk, rst;
	output [3:0] out;
	wire [3:0] q;
	wire [3:0] ands;
	wire [3:0] xors;
	
	assign ands[0] = rst & q[0];
	assign ands[1] = ands[0] & q[1];
	assign ands[2] = ands[1] & q[2];
	assign ands[3] = ands[2] & q[3];
	
	assign xors[0] = rst ^ out[0];
	assign xors[1] = ands[0] ^ q[1];
	assign xors[2] = ands[1] ^ q[2];
	assign xors[3] = ands[2] ^ q[3];
	
	DFlipFlop q0(q[0], out[0], xors[0], clk, rst);
	DFlipFlop q1(q[1], out[1], xors[1], clk, rst);
	DFlipFlop q2(q[2], out[2], xors[2], clk, rst);
	DFlipFlop q3(q[3], out[3], xors[3], clk, rst);
	
endmodule
	