
module nios_system_checkers2 (
	clk_clk,
	reset_reset_n,
	sendstate_export,
	receivestate_export,
	newdata_export,
	row8_in_port,
	row8_out_port,
	row7_in_port,
	row7_out_port,
	row6_in_port,
	row6_out_port,
	row5_in_port,
	row5_out_port,
	row4_in_port,
	row4_out_port,
	row3_in_port,
	row3_out_port,
	row2_in_port,
	row2_out_port,
	row1_in_port,
	row1_out_port);	

	input		clk_clk;
	input		reset_reset_n;
	output		sendstate_export;
	input		receivestate_export;
	input		newdata_export;
	input	[31:0]	row8_in_port;
	output	[31:0]	row8_out_port;
	input	[31:0]	row7_in_port;
	output	[31:0]	row7_out_port;
	input	[31:0]	row6_in_port;
	output	[31:0]	row6_out_port;
	input	[31:0]	row5_in_port;
	output	[31:0]	row5_out_port;
	input	[31:0]	row4_in_port;
	output	[31:0]	row4_out_port;
	input	[31:0]	row3_in_port;
	output	[31:0]	row3_out_port;
	input	[31:0]	row2_in_port;
	output	[31:0]	row2_out_port;
	input	[31:0]	row1_in_port;
	output	[31:0]	row1_out_port;
endmodule
