module compWater (rtn, water1, water2);
	input wire [5:0] water1, water2;
	output wire rtn;
	parameter check1 = water1[5:3] * 10 + water1[2:0];
	parameter check2 = water2[5:3] * 10 + water2[2:0];
	parameter check = check2 - check1;
	
	assign rtn = (check > -3) | (check < 3);

endmodule
