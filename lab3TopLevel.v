module lab3TopLevel (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input wire CLOCK_50; // 50MHz System Clock
	input wire [9:0] SW; // Switches
	input wire [3:0] KEY; // Buttons
	
	output wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	output wire [9:0] LEDR; // LEDs
	
	wire clk;
	wire [31:0] clkMain;
	wire [7:0] outerWaterConv, innerWaterConv, lockWaterConv, outerWaterPre, innerWaterPre, lockWaterPre;
	
	parameter whichClock = 23;
	
	// Initialize clock divider
	assign LEDR[9] = clk;
	assign LEDR[8] = ~KEY[0]; 
	assign clk = clkMain[whichClock];
	clock_divider cdiv (CLOCK_50, clkMain);

	
	
endmodule
