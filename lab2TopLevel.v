module lab2TopLevel (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input wire CLOCK_50; // 50MHz System Clock
	input wire [9:0] SW; // Switches
	input wire [3:0] KEY; // Buttons
	
	output wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	output wire [9:0] LEDR; // LEDs

	wire [13:0] outsideWaterLevel, lockWaterLevel, innerWaterLevel;

	seg7 h0 ();
	seg7 h1 ();
	seg7 h2 ();
	seg7 h3 ();
	seg7 h4 ();
	seg7 h5 ();
	seg7 h6 ();

endmodule
