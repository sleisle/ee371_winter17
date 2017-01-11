// Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"
// CREATED		"Wed Jan 11 10:53:40 2017"

module SynchDownSchematic(
	clk,
	rst,
	out0,
	out1,
	out2,
	out3
);


input wire	clk;
input wire	rst;
output wire	out0;
output wire	out1;
output wire	out2;
output wire	out3;

wire	SYNTHESIZED_WIRE_0;





DFlipFlop	b2v_ff0(
	.D(SYNTHESIZED_WIRE_0),
	.clk(clk),
	.rst(rst),
	.q(out0),
	.qBar(SYNTHESIZED_WIRE_0));


DFlipFlop	b2v_ff1(
	
	.clk(clk),
	.rst(rst),
	.q(out1)
	);


DFlipFlop	b2v_ff2(
	
	.clk(clk),
	.rst(rst),
	.q(out2)
	);


DFlipFlop	b2v_ff3(
	
	.clk(clk),
	.rst(rst),
	.q(out3)
	);


endmodule
