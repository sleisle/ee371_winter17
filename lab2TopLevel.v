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
	
	output wire [5:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	output wire [9:0] LEDR; // LEDs
	
	wire clk;
	wire [31:0] clkMain;
	wire [7:0] outerWaterConv, innerWaterConv, lockWaterConv, outerWaterPre, innerWaterPre, lockWaterPre;
	
	parameter whichClock = 23;
	
	// Initialize clock divider
	assign clk = clkMain[whichClock];
	clock_divider cdiv (CLOCK_50, clkMain);

	// Set up displays for water level
	convertToDisp outerConv (outerWaterConv, outerWaterPre);
	convertToDisp lockConv (lockWaterConv, lockWaterPre);
	convertToDisp innerConv (innerWaterConv, innerWaterPre);
	
	seg7 h0 (innerWaterConv[3:0], HEX0);
	seg7 h1 (innerWaterConv[7:4], HEX1);
	seg7 h2 (lockWaterConv[3:0], HEX2);
	seg7 h3 (lockWaterConv[7:4], HEX3);
	seg7 h4 (outerWaterConv[3:0], HEX4);
	seg7 h5 (outerWaterConv[7:4], HEX5);
	
	lockSystem lock (clk, KEY[0], innerWaterPre, lockWaterPre, outerWaterPre, {LEDR[0], LEDR[1], LEDR[2], LEDR[3]}, {SW[0], SW[1], SW[2], SW[3], KEY[1], KEY[2]});

endmodule
