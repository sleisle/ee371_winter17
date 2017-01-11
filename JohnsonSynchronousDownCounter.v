// Keegan Griffee
// Joe Jimenez
// Sean Leisle
// EE 371
// Lab 1: 4 stage synchronous Johnson down counter
// A 4 stage synchronous Johnson down counter with active low reset

module JohnsonSynchronousDownCounter (out, clk, rst);
	input clk, rst;
	output [3:0] out;
	
	reg [3:0] ps;
	reg [3:0] ns;
	
	always @(*) begin
		case (ps)
			4'b0000 : ns = 4'b1000;
			4'b1000 : ns = 4'b1100;
			4'b1100 : ns = 4'b1110;
			4'b1110 : ns = 4'b1111;
			4'b1111 : ns = 4'b0111;
			4'b0111 : ns = 4'b0011;
			4'b0011 : ns = 4'b0001;
			4'b0001 : ns = 4'b0000;
			default : ns = 4'bxxxx;
		endcase
	end
	
	assign out = ps;
	
	always @(posedge clk)
	if (~rst)
		ps <= 4'b0000;
	else
		ps <= ns;
endmodule	