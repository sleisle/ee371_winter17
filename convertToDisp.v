module convertToDisp (out, in);
	input wire [7:0] in;
	output reg [7:0] out;

	always @(*) begin
		out[7:4] = in / 10;
		out[3:0] = in % 10;
	end

endmodule
