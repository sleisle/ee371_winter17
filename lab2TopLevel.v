module lab2TopLevel (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	/* 
		SW0, LED0 - Gondola Arriving
		SW1, LED1 - Gondola Departing
		SW2, LED2 - Open and Close Outer Port
		SW3, LED3 - Open and Close Inner Port
		Key 0 - Reset
		Key 1 - Increase Water Level
		Key 2 - Decrease Water Level
	*/
	input wire CLOCK_50; // 50MHz System Clock
	input wire [9:0] SW; // Switches
	input wire [3:0] KEY; // Buttons
	
	output wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	output wire [9:0] LEDR; // LEDs
	
	wire clk, rst;

	// Initialize clock divider
	assign clk = clkMain[whichClock];
	clock_divider cdiv (CLOCK_50, clkMain);
	
	assign rst = KEY[0];

	wire [13:0] outsideWaterLevel, lockWaterLevel, innerWaterLevel;

	seg7 h0 ();
	seg7 h1 ();
	seg7 h2 ();
	seg7 h3 ();
	seg7 h4 ();
	seg7 h5 ();
	seg7 h6 ();

endmodule
