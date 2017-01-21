module compWater (rtn, water1, water2);
	input wire [7:0] water1, water2;
	output wire rtn;
	parameter check1 = water1[7:4] * 10 + water1[3:0];
	parameter check2 = water2[7:4] * 10 + water2[3:0];
	parameter check = check2 - check1;
	
	assign rtn = (check > -3) | (check < 3);

endmodule
