module convertToDisp (out, in);
	input wire [7:0] in;
	output reg [7:0] out;

	always @(*) begin
		out[7:4] = in / 4'd10;
		out[3:0] = in % 4'd10;
	end

endmodule
