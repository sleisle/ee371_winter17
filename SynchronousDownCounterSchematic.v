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
// CREATED		"Tue Jan 10 20:23:15 2017"

module SynchronousDownCounterSchematic(
	rst,
	clk,
	out0,
	out1,
	out2,
	out3
);


input wire	rst;
input wire	clk;
output wire	out0;
output wire	out1;
output wire	out2;
output wire	out3;

wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;

assign	out0 = SYNTHESIZED_WIRE_18;
assign	out1 = SYNTHESIZED_WIRE_20;
assign	out2 = SYNTHESIZED_WIRE_22;
assign	out3 = SYNTHESIZED_WIRE_24;



assign	SYNTHESIZED_WIRE_19 = rst & SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_19 & SYNTHESIZED_WIRE_20;

assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_21 & SYNTHESIZED_WIRE_22;



DFlipFlop	b2v_q0(
	.D(SYNTHESIZED_WIRE_7),
	.clk(clk),
	.rst(rst),
	.q(SYNTHESIZED_WIRE_18)
	);


DFlipFlop	b2v_q1(
	.D(SYNTHESIZED_WIRE_8),
	.clk(clk),
	.rst(rst),
	.q(SYNTHESIZED_WIRE_20)
	);


DFlipFlop	b2v_q2(
	.D(SYNTHESIZED_WIRE_9),
	.clk(clk),
	.rst(rst),
	.q(SYNTHESIZED_WIRE_22)
	);


DFlipFlop	b2v_q3(
	.D(SYNTHESIZED_WIRE_10),
	.clk(clk),
	.rst(rst),
	.q(SYNTHESIZED_WIRE_24)
	);

assign	SYNTHESIZED_WIRE_7 = rst ^ SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_19 ^ SYNTHESIZED_WIRE_20;

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_21 ^ SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_23 ^ SYNTHESIZED_WIRE_24;


endmodule
