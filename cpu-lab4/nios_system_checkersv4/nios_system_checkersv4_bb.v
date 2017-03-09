
module nios_system_checkersv4 (
	clk_clk,
	reset_reset_n,
	sendstate_export,
	receivestate_export,
	newdata_export,
	row8out_export,
	row7out_export,
	row6out_export,
	row5out_export,
	row4out_export,
	row3out_export,
	row2out_export,
	row1out_export,
	row8in_export,
	row7in_export,
	row6in_export,
	row5in_export,
	row4in_export,
	row3in_export,
	row2in_export,
	row1in_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[7:0]	sendstate_export;
	input	[7:0]	receivestate_export;
	input	[7:0]	newdata_export;
	output	[31:0]	row8out_export;
	output	[31:0]	row7out_export;
	output	[31:0]	row6out_export;
	output	[31:0]	row5out_export;
	output	[31:0]	row4out_export;
	output	[31:0]	row3out_export;
	output	[31:0]	row2out_export;
	output	[31:0]	row1out_export;
	input	[31:0]	row8in_export;
	input	[31:0]	row7in_export;
	input	[31:0]	row6in_export;
	input	[31:0]	row5in_export;
	input	[31:0]	row4in_export;
	input	[31:0]	row3in_export;
	input	[31:0]	row2in_export;
	input	[31:0]	row1in_export;
endmodule
