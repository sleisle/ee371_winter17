module lab4TopLevel (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input wire CLOCK_50; // 50MHz System Clock
	input wire [9:0] SW; // ReadyForTransferIn
	input wire [3:0] KEY; // Buttons
	
	output wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	output wire [9:0] LEDR; // LEDs
	
	wire rst;
	wire [31:0] clkMain;
	
	parameter whichClock = 23;
	
	assign rst = ~KEY[0];
	
	// Initialize clock divider
	assign LEDR[9] = clkOut;
	assign LEDR[8] = rst;
	assign LEDR[7] = stationToScanner[1];
	assign LEDR[6] = stationToScanner[0];
	assign clkOut = /*CLOCK_50; // CHANGE WHEN IT IS FINISHED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --->*/ clkMain[whichClock];
	clock_divider cdiv (CLOCK_50, clkMain);
	
endmodule
