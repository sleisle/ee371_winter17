module lab4TopLevel (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input wire CLOCK_50; // 50MHz System Clock
	input wire [9:0] SW; // ReadyForTransferIn
	input wire [3:0] KEY; // Buttons
	
	output wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	output wire [9:0] LEDR; // LEDs
	
	wire rst, clk;
	wire [31:0] clkMain;
	
	parameter whichClock = 23;
	
	assign rst = ~KEY[0];
	
	// Initialize clock divider
	assign LEDR[9] = clk;
	assign LEDR[8] = rst;
	assign clk = /*CLOCK_50; // CHANGE FOR SIMULATION --->*/ clkMain[whichClock];
	clock_divider cdiv (CLOCK_50, clkMain);
	
	
	
endmodule
