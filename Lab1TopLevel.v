// Keegan Griffee
// Joe Jimenez
// Sean Leslie
// EE 371
// Lab1TopLevel
// An overhead design to implement the four counters for Lab 1

module Lab1TopLevel (LEDR, CLOCK_50, SW);
	input CLOCK_50; 
	input [9:0] SW;
	output [9:0] LEDR;
	wire [31:0] clkMaster;
	wire rst, clk;
	
	// Initialize control
	assign rst = SW[0];
	parameter whichClock = 23;
	assign clk = clkMaster[whichClock];
	clock_divider cdiv (CLOCK_50, clkMaster);
	assign LEDR[9] = clk;
	
	/* Counters:
		1. Ripple Down Counter
		2. Synchronous Down Counter
		3. Synchronous Johnson Down Counter
		4. Synchronous Down Counter with Schematic Entry
		
		To test, uncomment one counter
	*/
	
	// Ripple Down Counter
	// RippleDownCounter counter (LEDR[3:0], clk, rst);
	
	// Synchronous Down Counter
	
	
	// Synchronous Johnson Down Counter
	JohnsonSynchronousDownCounter counter (LEDR[3:0], clk, rst);
	
endmodule
