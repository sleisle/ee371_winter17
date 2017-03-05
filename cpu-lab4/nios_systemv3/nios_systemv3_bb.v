
module nios_systemv3 (
	clk_clk,
	readytotransfer_export,
	reset_reset_n,
	startscanning_export,
	transfer_export);	

	input		clk_clk;
	output	[7:0]	readytotransfer_export;
	input		reset_reset_n;
	output	[7:0]	startscanning_export;
	input	[7:0]	transfer_export;
endmodule
