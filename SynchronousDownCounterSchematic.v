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
// CREATED		"Tue Jan 10 21:40:06 2017"

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

wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;

assign	out0 = SYNTHESIZED_WIRE_27;
assign	out1 = SYNTHESIZED_WIRE_28;
assign	out2 = SYNTHESIZED_WIRE_29;
assign	out3 = SYNTHESIZED_WIRE_11;



assign	SYNTHESIZED_WIRE_24 = SYNTHESIZED_WIRE_27 ~^ SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_26 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_27;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_30 & SYNTHESIZED_WIRE_31 & SYNTHESIZED_WIRE_32 & SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_30 & SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_32;

assign	SYNTHESIZED_WIRE_19 = SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_27;

assign	SYNTHESIZED_WIRE_22 = SYNTHESIZED_WIRE_19 & SYNTHESIZED_WIRE_29;

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_21 | SYNTHESIZED_WIRE_22;


DFlipFlop	b2v_q0(
	.D(SYNTHESIZED_WIRE_30),
	.clk(clk),
	.rst(rst),
	.q(SYNTHESIZED_WIRE_27),
	.qBar(SYNTHESIZED_WIRE_30));


DFlipFlop	b2v_q1(
	.D(SYNTHESIZED_WIRE_24),
	.clk(clk),
	.rst(rst),
	.q(SYNTHESIZED_WIRE_28),
	.qBar(SYNTHESIZED_WIRE_31));


DFlipFlop	b2v_q2(
	.D(SYNTHESIZED_WIRE_25),
	.clk(clk),
	.rst(rst),
	.q(SYNTHESIZED_WIRE_29),
	.qBar(SYNTHESIZED_WIRE_32));


DFlipFlop	b2v_q3(
	.D(SYNTHESIZED_WIRE_26),
	.clk(clk),
	.rst(rst),
	.q(SYNTHESIZED_WIRE_11),
	.qBar(SYNTHESIZED_WIRE_10));


endmodule
