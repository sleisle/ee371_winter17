
module nios_system_checkersv3 (
	clk_clk,
	newdata_export,
	receivestate_export,
	reset_reset_n,
	row1_in_port,
	row1_out_port,
	row2_in_port,
	row2_out_port,
	row3_in_port,
	row3_out_port,
	row4_in_port,
	row4_out_port,
	row5_in_port,
	row5_out_port,
	row6_in_port,
	row6_out_port,
	row7_in_port,
	row7_out_port,
	row8_in_port,
	row8_out_port,
	sendstate_export);	

	input		clk_clk;
	input	[7:0]	newdata_export;
	input	[7:0]	receivestate_export;
	input		reset_reset_n;
	input	[31:0]	row1_in_port;
	output	[31:0]	row1_out_port;
	input	[31:0]	row2_in_port;
	output	[31:0]	row2_out_port;
	input	[31:0]	row3_in_port;
	output	[31:0]	row3_out_port;
	input	[31:0]	row4_in_port;
	output	[31:0]	row4_out_port;
	input	[31:0]	row5_in_port;
	output	[31:0]	row5_out_port;
	input	[31:0]	row6_in_port;
	output	[31:0]	row6_out_port;
	input	[31:0]	row7_in_port;
	output	[31:0]	row7_out_port;
	input	[31:0]	row8_in_port;
	output	[31:0]	row8_out_port;
	output	[7:0]	sendstate_export;
endmodule