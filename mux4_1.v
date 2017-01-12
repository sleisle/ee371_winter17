module mux4_1 (out, in, control);
	input [3:0] in;
	input [1:0] control;
	output out;

	// Case statement for mux output
	always @(*)
		case (control)
			2'b00 : out = in[0];
			2'b01 : out = in[1];
			2'b10 : out = in[2];
			2'b11 : out = in[3];
			default : 
		endcase
	end

endmodule
