-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"

-- DATE "01/10/2017 18:50:40"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Lab1TopLevel IS
    PORT (
	LEDR : OUT std_logic_vector(9 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	SW : IN std_logic_vector(9 DOWNTO 0)
	);
END Lab1TopLevel;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_H9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_J11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Lab1TopLevel IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LEDR : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputCLKENA0_outclk\ : std_logic;
SIGNAL \cdiv|divided_clocks[0]~0_combout\ : std_logic;
SIGNAL \cdiv|Add0~89_sumout\ : std_logic;
SIGNAL \cdiv|divided_clocks[1]~feeder_combout\ : std_logic;
SIGNAL \cdiv|Add0~90\ : std_logic;
SIGNAL \cdiv|Add0~85_sumout\ : std_logic;
SIGNAL \cdiv|divided_clocks[2]~feeder_combout\ : std_logic;
SIGNAL \cdiv|Add0~86\ : std_logic;
SIGNAL \cdiv|Add0~81_sumout\ : std_logic;
SIGNAL \cdiv|Add0~82\ : std_logic;
SIGNAL \cdiv|Add0~77_sumout\ : std_logic;
SIGNAL \cdiv|divided_clocks[4]~feeder_combout\ : std_logic;
SIGNAL \cdiv|Add0~78\ : std_logic;
SIGNAL \cdiv|Add0~73_sumout\ : std_logic;
SIGNAL \cdiv|divided_clocks[5]~feeder_combout\ : std_logic;
SIGNAL \cdiv|Add0~74\ : std_logic;
SIGNAL \cdiv|Add0~69_sumout\ : std_logic;
SIGNAL \cdiv|Add0~70\ : std_logic;
SIGNAL \cdiv|Add0~65_sumout\ : std_logic;
SIGNAL \cdiv|Add0~66\ : std_logic;
SIGNAL \cdiv|Add0~61_sumout\ : std_logic;
SIGNAL \cdiv|divided_clocks[8]~feeder_combout\ : std_logic;
SIGNAL \cdiv|Add0~62\ : std_logic;
SIGNAL \cdiv|Add0~57_sumout\ : std_logic;
SIGNAL \cdiv|Add0~58\ : std_logic;
SIGNAL \cdiv|Add0~53_sumout\ : std_logic;
SIGNAL \cdiv|Add0~54\ : std_logic;
SIGNAL \cdiv|Add0~49_sumout\ : std_logic;
SIGNAL \cdiv|Add0~50\ : std_logic;
SIGNAL \cdiv|Add0~45_sumout\ : std_logic;
SIGNAL \cdiv|Add0~46\ : std_logic;
SIGNAL \cdiv|Add0~41_sumout\ : std_logic;
SIGNAL \cdiv|Add0~42\ : std_logic;
SIGNAL \cdiv|Add0~37_sumout\ : std_logic;
SIGNAL \cdiv|Add0~38\ : std_logic;
SIGNAL \cdiv|Add0~33_sumout\ : std_logic;
SIGNAL \cdiv|Add0~34\ : std_logic;
SIGNAL \cdiv|Add0~29_sumout\ : std_logic;
SIGNAL \cdiv|Add0~30\ : std_logic;
SIGNAL \cdiv|Add0~25_sumout\ : std_logic;
SIGNAL \cdiv|Add0~26\ : std_logic;
SIGNAL \cdiv|Add0~21_sumout\ : std_logic;
SIGNAL \cdiv|Add0~22\ : std_logic;
SIGNAL \cdiv|Add0~17_sumout\ : std_logic;
SIGNAL \cdiv|Add0~18\ : std_logic;
SIGNAL \cdiv|Add0~13_sumout\ : std_logic;
SIGNAL \cdiv|Add0~14\ : std_logic;
SIGNAL \cdiv|Add0~9_sumout\ : std_logic;
SIGNAL \cdiv|Add0~10\ : std_logic;
SIGNAL \cdiv|Add0~5_sumout\ : std_logic;
SIGNAL \cdiv|Add0~6\ : std_logic;
SIGNAL \cdiv|Add0~1_sumout\ : std_logic;
SIGNAL \cdiv|divided_clocks[23]~feeder_combout\ : std_logic;
SIGNAL \counter|q0|q~0_combout\ : std_logic;
SIGNAL \counter|q0|q~feeder_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \counter|q0|q~q\ : std_logic;
SIGNAL \counter|q1|q~0_combout\ : std_logic;
SIGNAL \counter|q1|q~feeder_combout\ : std_logic;
SIGNAL \counter|q1|q~q\ : std_logic;
SIGNAL \counter|q2|q~0_combout\ : std_logic;
SIGNAL \counter|q2|q~feeder_combout\ : std_logic;
SIGNAL \counter|q2|q~q\ : std_logic;
SIGNAL \counter|q3|q~DUPLICATE_q\ : std_logic;
SIGNAL \counter|q3|q~0_combout\ : std_logic;
SIGNAL \counter|q3|q~feeder_combout\ : std_logic;
SIGNAL \counter|q3|q~q\ : std_logic;
SIGNAL \cdiv|divided_clocks\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \counter|q3|ALT_INV_q~DUPLICATE_q\ : std_logic;
SIGNAL \counter|q3|ALT_INV_q~0_combout\ : std_logic;
SIGNAL \counter|q2|ALT_INV_q~0_combout\ : std_logic;
SIGNAL \counter|q1|ALT_INV_q~0_combout\ : std_logic;
SIGNAL \counter|q0|ALT_INV_q~0_combout\ : std_logic;
SIGNAL \cdiv|ALT_INV_divided_clocks\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \counter|q2|ALT_INV_q~q\ : std_logic;
SIGNAL \counter|q1|ALT_INV_q~q\ : std_logic;
SIGNAL \counter|q0|ALT_INV_q~q\ : std_logic;
SIGNAL \cdiv|ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \cdiv|ALT_INV_Add0~85_sumout\ : std_logic;
SIGNAL \cdiv|ALT_INV_Add0~77_sumout\ : std_logic;
SIGNAL \cdiv|ALT_INV_Add0~73_sumout\ : std_logic;
SIGNAL \cdiv|ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \cdiv|ALT_INV_Add0~1_sumout\ : std_logic;

BEGIN

LEDR <= ww_LEDR;
ww_CLOCK_50 <= CLOCK_50;
ww_SW <= SW;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\counter|q3|ALT_INV_q~DUPLICATE_q\ <= NOT \counter|q3|q~DUPLICATE_q\;
\counter|q3|ALT_INV_q~0_combout\ <= NOT \counter|q3|q~0_combout\;
\counter|q2|ALT_INV_q~0_combout\ <= NOT \counter|q2|q~0_combout\;
\counter|q1|ALT_INV_q~0_combout\ <= NOT \counter|q1|q~0_combout\;
\counter|q0|ALT_INV_q~0_combout\ <= NOT \counter|q0|q~0_combout\;
\cdiv|ALT_INV_divided_clocks\(0) <= NOT \cdiv|divided_clocks\(0);
\cdiv|ALT_INV_divided_clocks\(1) <= NOT \cdiv|divided_clocks\(1);
\cdiv|ALT_INV_divided_clocks\(2) <= NOT \cdiv|divided_clocks\(2);
\cdiv|ALT_INV_divided_clocks\(3) <= NOT \cdiv|divided_clocks\(3);
\cdiv|ALT_INV_divided_clocks\(4) <= NOT \cdiv|divided_clocks\(4);
\cdiv|ALT_INV_divided_clocks\(5) <= NOT \cdiv|divided_clocks\(5);
\cdiv|ALT_INV_divided_clocks\(6) <= NOT \cdiv|divided_clocks\(6);
\cdiv|ALT_INV_divided_clocks\(7) <= NOT \cdiv|divided_clocks\(7);
\cdiv|ALT_INV_divided_clocks\(8) <= NOT \cdiv|divided_clocks\(8);
\cdiv|ALT_INV_divided_clocks\(9) <= NOT \cdiv|divided_clocks\(9);
\cdiv|ALT_INV_divided_clocks\(10) <= NOT \cdiv|divided_clocks\(10);
\cdiv|ALT_INV_divided_clocks\(11) <= NOT \cdiv|divided_clocks\(11);
\cdiv|ALT_INV_divided_clocks\(12) <= NOT \cdiv|divided_clocks\(12);
\cdiv|ALT_INV_divided_clocks\(13) <= NOT \cdiv|divided_clocks\(13);
\cdiv|ALT_INV_divided_clocks\(14) <= NOT \cdiv|divided_clocks\(14);
\cdiv|ALT_INV_divided_clocks\(15) <= NOT \cdiv|divided_clocks\(15);
\cdiv|ALT_INV_divided_clocks\(16) <= NOT \cdiv|divided_clocks\(16);
\cdiv|ALT_INV_divided_clocks\(17) <= NOT \cdiv|divided_clocks\(17);
\cdiv|ALT_INV_divided_clocks\(18) <= NOT \cdiv|divided_clocks\(18);
\cdiv|ALT_INV_divided_clocks\(19) <= NOT \cdiv|divided_clocks\(19);
\cdiv|ALT_INV_divided_clocks\(20) <= NOT \cdiv|divided_clocks\(20);
\cdiv|ALT_INV_divided_clocks\(21) <= NOT \cdiv|divided_clocks\(21);
\cdiv|ALT_INV_divided_clocks\(22) <= NOT \cdiv|divided_clocks\(22);
\cdiv|ALT_INV_divided_clocks\(23) <= NOT \cdiv|divided_clocks\(23);
\counter|q2|ALT_INV_q~q\ <= NOT \counter|q2|q~q\;
\counter|q1|ALT_INV_q~q\ <= NOT \counter|q1|q~q\;
\counter|q0|ALT_INV_q~q\ <= NOT \counter|q0|q~q\;
\cdiv|ALT_INV_Add0~89_sumout\ <= NOT \cdiv|Add0~89_sumout\;
\cdiv|ALT_INV_Add0~85_sumout\ <= NOT \cdiv|Add0~85_sumout\;
\cdiv|ALT_INV_Add0~77_sumout\ <= NOT \cdiv|Add0~77_sumout\;
\cdiv|ALT_INV_Add0~73_sumout\ <= NOT \cdiv|Add0~73_sumout\;
\cdiv|ALT_INV_Add0~61_sumout\ <= NOT \cdiv|Add0~61_sumout\;
\cdiv|ALT_INV_Add0~1_sumout\ <= NOT \cdiv|Add0~1_sumout\;

-- Location: IOOBUF_X89_Y36_N56
\LEDR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter|q0|q~q\,
	devoe => ww_devoe,
	o => ww_LEDR(0));

-- Location: IOOBUF_X89_Y38_N22
\LEDR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter|q1|q~q\,
	devoe => ww_devoe,
	o => ww_LEDR(1));

-- Location: IOOBUF_X89_Y36_N39
\LEDR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter|q2|q~q\,
	devoe => ww_devoe,
	o => ww_LEDR(2));

-- Location: IOOBUF_X89_Y36_N5
\LEDR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter|q3|q~q\,
	devoe => ww_devoe,
	o => ww_LEDR(3));

-- Location: IOOBUF_X89_Y9_N5
\LEDR[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(4));

-- Location: IOOBUF_X54_Y81_N36
\LEDR[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(5));

-- Location: IOOBUF_X72_Y81_N53
\LEDR[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(6));

-- Location: IOOBUF_X52_Y81_N53
\LEDR[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(7));

-- Location: IOOBUF_X54_Y81_N53
\LEDR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(8));

-- Location: IOOBUF_X36_Y81_N19
\LEDR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(9));

-- Location: IOIBUF_X89_Y35_N61
\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G10
\CLOCK_50~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~input_o\,
	outclk => \CLOCK_50~inputCLKENA0_outclk\);

-- Location: LABCELL_X88_Y35_N18
\cdiv|divided_clocks[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|divided_clocks[0]~0_combout\ = ( !\cdiv|divided_clocks\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \cdiv|ALT_INV_divided_clocks\(0),
	combout => \cdiv|divided_clocks[0]~0_combout\);

-- Location: FF_X88_Y35_N20
\cdiv|divided_clocks[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|divided_clocks[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(0));

-- Location: LABCELL_X88_Y35_N30
\cdiv|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~89_sumout\ = SUM(( \cdiv|divided_clocks\(1) ) + ( \cdiv|divided_clocks\(0) ) + ( !VCC ))
-- \cdiv|Add0~90\ = CARRY(( \cdiv|divided_clocks\(1) ) + ( \cdiv|divided_clocks\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \cdiv|ALT_INV_divided_clocks\(0),
	datad => \cdiv|ALT_INV_divided_clocks\(1),
	cin => GND,
	sumout => \cdiv|Add0~89_sumout\,
	cout => \cdiv|Add0~90\);

-- Location: LABCELL_X88_Y35_N27
\cdiv|divided_clocks[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|divided_clocks[1]~feeder_combout\ = \cdiv|Add0~89_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \cdiv|ALT_INV_Add0~89_sumout\,
	combout => \cdiv|divided_clocks[1]~feeder_combout\);

-- Location: FF_X88_Y35_N29
\cdiv|divided_clocks[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|divided_clocks[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(1));

-- Location: LABCELL_X88_Y35_N33
\cdiv|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~85_sumout\ = SUM(( \cdiv|divided_clocks\(2) ) + ( GND ) + ( \cdiv|Add0~90\ ))
-- \cdiv|Add0~86\ = CARRY(( \cdiv|divided_clocks\(2) ) + ( GND ) + ( \cdiv|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(2),
	cin => \cdiv|Add0~90\,
	sumout => \cdiv|Add0~85_sumout\,
	cout => \cdiv|Add0~86\);

-- Location: LABCELL_X88_Y35_N0
\cdiv|divided_clocks[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|divided_clocks[2]~feeder_combout\ = ( \cdiv|Add0~85_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \cdiv|ALT_INV_Add0~85_sumout\,
	combout => \cdiv|divided_clocks[2]~feeder_combout\);

-- Location: FF_X88_Y35_N2
\cdiv|divided_clocks[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|divided_clocks[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(2));

-- Location: LABCELL_X88_Y35_N36
\cdiv|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~81_sumout\ = SUM(( \cdiv|divided_clocks\(3) ) + ( GND ) + ( \cdiv|Add0~86\ ))
-- \cdiv|Add0~82\ = CARRY(( \cdiv|divided_clocks\(3) ) + ( GND ) + ( \cdiv|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(3),
	cin => \cdiv|Add0~86\,
	sumout => \cdiv|Add0~81_sumout\,
	cout => \cdiv|Add0~82\);

-- Location: FF_X88_Y35_N7
\cdiv|divided_clocks[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \cdiv|Add0~81_sumout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(3));

-- Location: LABCELL_X88_Y35_N39
\cdiv|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~77_sumout\ = SUM(( \cdiv|divided_clocks\(4) ) + ( GND ) + ( \cdiv|Add0~82\ ))
-- \cdiv|Add0~78\ = CARRY(( \cdiv|divided_clocks\(4) ) + ( GND ) + ( \cdiv|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \cdiv|ALT_INV_divided_clocks\(4),
	cin => \cdiv|Add0~82\,
	sumout => \cdiv|Add0~77_sumout\,
	cout => \cdiv|Add0~78\);

-- Location: LABCELL_X88_Y35_N12
\cdiv|divided_clocks[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|divided_clocks[4]~feeder_combout\ = ( \cdiv|Add0~77_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \cdiv|ALT_INV_Add0~77_sumout\,
	combout => \cdiv|divided_clocks[4]~feeder_combout\);

-- Location: FF_X88_Y35_N14
\cdiv|divided_clocks[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|divided_clocks[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(4));

-- Location: LABCELL_X88_Y35_N42
\cdiv|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~73_sumout\ = SUM(( \cdiv|divided_clocks\(5) ) + ( GND ) + ( \cdiv|Add0~78\ ))
-- \cdiv|Add0~74\ = CARRY(( \cdiv|divided_clocks\(5) ) + ( GND ) + ( \cdiv|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \cdiv|ALT_INV_divided_clocks\(5),
	cin => \cdiv|Add0~78\,
	sumout => \cdiv|Add0~73_sumout\,
	cout => \cdiv|Add0~74\);

-- Location: LABCELL_X88_Y35_N9
\cdiv|divided_clocks[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|divided_clocks[5]~feeder_combout\ = ( \cdiv|Add0~73_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \cdiv|ALT_INV_Add0~73_sumout\,
	combout => \cdiv|divided_clocks[5]~feeder_combout\);

-- Location: FF_X88_Y35_N11
\cdiv|divided_clocks[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|divided_clocks[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(5));

-- Location: LABCELL_X88_Y35_N45
\cdiv|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~69_sumout\ = SUM(( \cdiv|divided_clocks\(6) ) + ( GND ) + ( \cdiv|Add0~74\ ))
-- \cdiv|Add0~70\ = CARRY(( \cdiv|divided_clocks\(6) ) + ( GND ) + ( \cdiv|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \cdiv|ALT_INV_divided_clocks\(6),
	cin => \cdiv|Add0~74\,
	sumout => \cdiv|Add0~69_sumout\,
	cout => \cdiv|Add0~70\);

-- Location: FF_X88_Y35_N17
\cdiv|divided_clocks[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \cdiv|Add0~69_sumout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(6));

-- Location: LABCELL_X88_Y35_N48
\cdiv|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~65_sumout\ = SUM(( \cdiv|divided_clocks\(7) ) + ( GND ) + ( \cdiv|Add0~70\ ))
-- \cdiv|Add0~66\ = CARRY(( \cdiv|divided_clocks\(7) ) + ( GND ) + ( \cdiv|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \cdiv|ALT_INV_divided_clocks\(7),
	cin => \cdiv|Add0~70\,
	sumout => \cdiv|Add0~65_sumout\,
	cout => \cdiv|Add0~66\);

-- Location: FF_X88_Y35_N26
\cdiv|divided_clocks[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \cdiv|Add0~65_sumout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(7));

-- Location: LABCELL_X88_Y35_N51
\cdiv|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~61_sumout\ = SUM(( \cdiv|divided_clocks\(8) ) + ( GND ) + ( \cdiv|Add0~66\ ))
-- \cdiv|Add0~62\ = CARRY(( \cdiv|divided_clocks\(8) ) + ( GND ) + ( \cdiv|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(8),
	cin => \cdiv|Add0~66\,
	sumout => \cdiv|Add0~61_sumout\,
	cout => \cdiv|Add0~62\);

-- Location: LABCELL_X88_Y35_N3
\cdiv|divided_clocks[8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|divided_clocks[8]~feeder_combout\ = ( \cdiv|Add0~61_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \cdiv|ALT_INV_Add0~61_sumout\,
	combout => \cdiv|divided_clocks[8]~feeder_combout\);

-- Location: FF_X88_Y35_N5
\cdiv|divided_clocks[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|divided_clocks[8]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(8));

-- Location: LABCELL_X88_Y35_N54
\cdiv|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~57_sumout\ = SUM(( \cdiv|divided_clocks\(9) ) + ( GND ) + ( \cdiv|Add0~62\ ))
-- \cdiv|Add0~58\ = CARRY(( \cdiv|divided_clocks\(9) ) + ( GND ) + ( \cdiv|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(9),
	cin => \cdiv|Add0~62\,
	sumout => \cdiv|Add0~57_sumout\,
	cout => \cdiv|Add0~58\);

-- Location: FF_X88_Y35_N23
\cdiv|divided_clocks[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \cdiv|Add0~57_sumout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(9));

-- Location: LABCELL_X88_Y35_N57
\cdiv|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~53_sumout\ = SUM(( \cdiv|divided_clocks\(10) ) + ( GND ) + ( \cdiv|Add0~58\ ))
-- \cdiv|Add0~54\ = CARRY(( \cdiv|divided_clocks\(10) ) + ( GND ) + ( \cdiv|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(10),
	cin => \cdiv|Add0~58\,
	sumout => \cdiv|Add0~53_sumout\,
	cout => \cdiv|Add0~54\);

-- Location: FF_X88_Y35_N59
\cdiv|divided_clocks[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~53_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(10));

-- Location: LABCELL_X88_Y34_N0
\cdiv|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~49_sumout\ = SUM(( \cdiv|divided_clocks\(11) ) + ( GND ) + ( \cdiv|Add0~54\ ))
-- \cdiv|Add0~50\ = CARRY(( \cdiv|divided_clocks\(11) ) + ( GND ) + ( \cdiv|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(11),
	cin => \cdiv|Add0~54\,
	sumout => \cdiv|Add0~49_sumout\,
	cout => \cdiv|Add0~50\);

-- Location: FF_X88_Y34_N2
\cdiv|divided_clocks[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~49_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(11));

-- Location: LABCELL_X88_Y34_N3
\cdiv|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~45_sumout\ = SUM(( \cdiv|divided_clocks\(12) ) + ( GND ) + ( \cdiv|Add0~50\ ))
-- \cdiv|Add0~46\ = CARRY(( \cdiv|divided_clocks\(12) ) + ( GND ) + ( \cdiv|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(12),
	cin => \cdiv|Add0~50\,
	sumout => \cdiv|Add0~45_sumout\,
	cout => \cdiv|Add0~46\);

-- Location: FF_X88_Y34_N5
\cdiv|divided_clocks[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~45_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(12));

-- Location: LABCELL_X88_Y34_N6
\cdiv|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~41_sumout\ = SUM(( \cdiv|divided_clocks\(13) ) + ( GND ) + ( \cdiv|Add0~46\ ))
-- \cdiv|Add0~42\ = CARRY(( \cdiv|divided_clocks\(13) ) + ( GND ) + ( \cdiv|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(13),
	cin => \cdiv|Add0~46\,
	sumout => \cdiv|Add0~41_sumout\,
	cout => \cdiv|Add0~42\);

-- Location: FF_X88_Y34_N8
\cdiv|divided_clocks[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~41_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(13));

-- Location: LABCELL_X88_Y34_N9
\cdiv|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~37_sumout\ = SUM(( \cdiv|divided_clocks\(14) ) + ( GND ) + ( \cdiv|Add0~42\ ))
-- \cdiv|Add0~38\ = CARRY(( \cdiv|divided_clocks\(14) ) + ( GND ) + ( \cdiv|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(14),
	cin => \cdiv|Add0~42\,
	sumout => \cdiv|Add0~37_sumout\,
	cout => \cdiv|Add0~38\);

-- Location: FF_X88_Y34_N11
\cdiv|divided_clocks[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~37_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(14));

-- Location: LABCELL_X88_Y34_N12
\cdiv|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~33_sumout\ = SUM(( \cdiv|divided_clocks\(15) ) + ( GND ) + ( \cdiv|Add0~38\ ))
-- \cdiv|Add0~34\ = CARRY(( \cdiv|divided_clocks\(15) ) + ( GND ) + ( \cdiv|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(15),
	cin => \cdiv|Add0~38\,
	sumout => \cdiv|Add0~33_sumout\,
	cout => \cdiv|Add0~34\);

-- Location: FF_X88_Y34_N14
\cdiv|divided_clocks[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~33_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(15));

-- Location: LABCELL_X88_Y34_N15
\cdiv|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~29_sumout\ = SUM(( \cdiv|divided_clocks\(16) ) + ( GND ) + ( \cdiv|Add0~34\ ))
-- \cdiv|Add0~30\ = CARRY(( \cdiv|divided_clocks\(16) ) + ( GND ) + ( \cdiv|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(16),
	cin => \cdiv|Add0~34\,
	sumout => \cdiv|Add0~29_sumout\,
	cout => \cdiv|Add0~30\);

-- Location: FF_X88_Y34_N17
\cdiv|divided_clocks[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~29_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(16));

-- Location: LABCELL_X88_Y34_N18
\cdiv|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~25_sumout\ = SUM(( \cdiv|divided_clocks\(17) ) + ( GND ) + ( \cdiv|Add0~30\ ))
-- \cdiv|Add0~26\ = CARRY(( \cdiv|divided_clocks\(17) ) + ( GND ) + ( \cdiv|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(17),
	cin => \cdiv|Add0~30\,
	sumout => \cdiv|Add0~25_sumout\,
	cout => \cdiv|Add0~26\);

-- Location: FF_X88_Y34_N20
\cdiv|divided_clocks[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(17));

-- Location: LABCELL_X88_Y34_N21
\cdiv|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~21_sumout\ = SUM(( \cdiv|divided_clocks\(18) ) + ( GND ) + ( \cdiv|Add0~26\ ))
-- \cdiv|Add0~22\ = CARRY(( \cdiv|divided_clocks\(18) ) + ( GND ) + ( \cdiv|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(18),
	cin => \cdiv|Add0~26\,
	sumout => \cdiv|Add0~21_sumout\,
	cout => \cdiv|Add0~22\);

-- Location: FF_X88_Y34_N23
\cdiv|divided_clocks[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(18));

-- Location: LABCELL_X88_Y34_N24
\cdiv|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~17_sumout\ = SUM(( \cdiv|divided_clocks\(19) ) + ( GND ) + ( \cdiv|Add0~22\ ))
-- \cdiv|Add0~18\ = CARRY(( \cdiv|divided_clocks\(19) ) + ( GND ) + ( \cdiv|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(19),
	cin => \cdiv|Add0~22\,
	sumout => \cdiv|Add0~17_sumout\,
	cout => \cdiv|Add0~18\);

-- Location: FF_X88_Y34_N26
\cdiv|divided_clocks[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(19));

-- Location: LABCELL_X88_Y34_N27
\cdiv|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~13_sumout\ = SUM(( \cdiv|divided_clocks\(20) ) + ( GND ) + ( \cdiv|Add0~18\ ))
-- \cdiv|Add0~14\ = CARRY(( \cdiv|divided_clocks\(20) ) + ( GND ) + ( \cdiv|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(20),
	cin => \cdiv|Add0~18\,
	sumout => \cdiv|Add0~13_sumout\,
	cout => \cdiv|Add0~14\);

-- Location: FF_X88_Y34_N29
\cdiv|divided_clocks[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(20));

-- Location: LABCELL_X88_Y34_N30
\cdiv|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~9_sumout\ = SUM(( \cdiv|divided_clocks\(21) ) + ( GND ) + ( \cdiv|Add0~14\ ))
-- \cdiv|Add0~10\ = CARRY(( \cdiv|divided_clocks\(21) ) + ( GND ) + ( \cdiv|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(21),
	cin => \cdiv|Add0~14\,
	sumout => \cdiv|Add0~9_sumout\,
	cout => \cdiv|Add0~10\);

-- Location: FF_X88_Y34_N32
\cdiv|divided_clocks[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(21));

-- Location: LABCELL_X88_Y34_N33
\cdiv|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~5_sumout\ = SUM(( \cdiv|divided_clocks\(22) ) + ( GND ) + ( \cdiv|Add0~10\ ))
-- \cdiv|Add0~6\ = CARRY(( \cdiv|divided_clocks\(22) ) + ( GND ) + ( \cdiv|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(22),
	cin => \cdiv|Add0~10\,
	sumout => \cdiv|Add0~5_sumout\,
	cout => \cdiv|Add0~6\);

-- Location: FF_X88_Y34_N35
\cdiv|divided_clocks[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \cdiv|Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(22));

-- Location: LABCELL_X88_Y34_N36
\cdiv|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|Add0~1_sumout\ = SUM(( \cdiv|divided_clocks\(23) ) + ( GND ) + ( \cdiv|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cdiv|ALT_INV_divided_clocks\(23),
	cin => \cdiv|Add0~6\,
	sumout => \cdiv|Add0~1_sumout\);

-- Location: LABCELL_X88_Y34_N42
\cdiv|divided_clocks[23]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \cdiv|divided_clocks[23]~feeder_combout\ = \cdiv|Add0~1_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \cdiv|ALT_INV_Add0~1_sumout\,
	combout => \cdiv|divided_clocks[23]~feeder_combout\);

-- Location: FF_X88_Y34_N44
\cdiv|divided_clocks[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \cdiv|divided_clocks[23]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cdiv|divided_clocks\(23));

-- Location: LABCELL_X88_Y36_N39
\counter|q0|q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter|q0|q~0_combout\ = !\counter|q0|q~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter|q0|ALT_INV_q~q\,
	combout => \counter|q0|q~0_combout\);

-- Location: LABCELL_X88_Y36_N6
\counter|q0|q~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter|q0|q~feeder_combout\ = \counter|q0|q~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter|q0|ALT_INV_q~0_combout\,
	combout => \counter|q0|q~feeder_combout\);

-- Location: IOIBUF_X89_Y36_N21
\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: FF_X88_Y36_N8
\counter|q0|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cdiv|divided_clocks\(23),
	d => \counter|q0|q~feeder_combout\,
	clrn => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|q0|q~q\);

-- Location: MLABCELL_X87_Y36_N42
\counter|q1|q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter|q1|q~0_combout\ = !\counter|q1|q~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter|q1|ALT_INV_q~q\,
	combout => \counter|q1|q~0_combout\);

-- Location: MLABCELL_X87_Y36_N48
\counter|q1|q~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter|q1|q~feeder_combout\ = \counter|q1|q~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter|q1|ALT_INV_q~0_combout\,
	combout => \counter|q1|q~feeder_combout\);

-- Location: FF_X87_Y36_N50
\counter|q1|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \counter|q0|q~q\,
	d => \counter|q1|q~feeder_combout\,
	clrn => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|q1|q~q\);

-- Location: MLABCELL_X87_Y36_N27
\counter|q2|q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter|q2|q~0_combout\ = !\counter|q2|q~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter|q2|ALT_INV_q~q\,
	combout => \counter|q2|q~0_combout\);

-- Location: MLABCELL_X87_Y36_N18
\counter|q2|q~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter|q2|q~feeder_combout\ = \counter|q2|q~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter|q2|ALT_INV_q~0_combout\,
	combout => \counter|q2|q~feeder_combout\);

-- Location: FF_X87_Y36_N20
\counter|q2|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \counter|q1|q~q\,
	d => \counter|q2|q~feeder_combout\,
	clrn => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|q2|q~q\);

-- Location: FF_X88_Y36_N44
\counter|q3|q~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \counter|q2|q~q\,
	d => \counter|q3|q~feeder_combout\,
	clrn => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|q3|q~DUPLICATE_q\);

-- Location: LABCELL_X88_Y36_N24
\counter|q3|q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter|q3|q~0_combout\ = ( !\counter|q3|q~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \counter|q3|ALT_INV_q~DUPLICATE_q\,
	combout => \counter|q3|q~0_combout\);

-- Location: LABCELL_X88_Y36_N42
\counter|q3|q~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter|q3|q~feeder_combout\ = ( \counter|q3|q~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \counter|q3|ALT_INV_q~0_combout\,
	combout => \counter|q3|q~feeder_combout\);

-- Location: FF_X88_Y36_N43
\counter|q3|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \counter|q2|q~q\,
	d => \counter|q3|q~feeder_combout\,
	clrn => \SW[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|q3|q~q\);

-- Location: IOIBUF_X89_Y4_N44
\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X70_Y0_N35
\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X80_Y81_N52
\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X30_Y81_N35
\SW[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X34_Y0_N58
\SW[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X89_Y8_N38
\SW[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X89_Y6_N38
\SW[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X32_Y81_N52
\SW[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X58_Y81_N75
\SW[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: LABCELL_X24_Y76_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


