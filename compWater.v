module compWater (rtn, water1, water2);
	input wire [7:0] water1, water2;
	output reg rtn;
	reg [8:0] check1, check2, check;

	always @(*) begin
		check1 = water1;
		check2 = water2;
		check = (check2 - check1) + 3;
		
		rtn = (check > 0) & (check < 6);
	end

endmodule
