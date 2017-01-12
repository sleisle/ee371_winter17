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
	wire [3:0] counter0Out, counter1Out, counter2Out, counter3Out;
	
	// Initialize control
	assign rst = SW[0];
	parameter whichClock = 23;
	assign clk = clkMaster[whichClock];
	clock_divider cdiv (CLOCK_50, clkMaster);

	mux4_1 led0 (LEDR[0], {counter0Out[0], counter1Out[0], counter2Out[0], counter3Out[0],}, {SW[9], SW[8]});
	mux4_1 led1 (LEDR[1], {counter0Out[1], counter1Out[1], counter2Out[1], counter3Out[1],}, {SW[9], SW[8]});
	mux4_1 led2 (LEDR[2], {counter0Out[2], counter1Out[2], counter2Out[2], counter3Out[2],}, {SW[9], SW[8]});
	mux4_1 led3 (LEDR[3], {counter0Out[3], counter1Out[3], counter2Out[3], counter3Out[3],}, {SW[9], SW[8]});
	
	/* Counters:
		1. Ripple Down Counter
		2. Synchronous Down Counter
		3. Synchronous Johnson Down Counter
		4. Synchronous Down Counter with Schematic Entry
		
		To test, uncomment one counter
	*/
	
	// Ripple Down Counter
	RippleDownCounter counter0 (counter0Out, clk, rst);
	
	// Synchronous Down Counter
	SynchronousDownCounter counter1 (counter1Out, clk, rst);
	
	// Synchronous Johnson Down Counter
	JohnsonSynchronousDownCounter counter2 (counter2Out, clk, rst);
	
	// Synchronous Down Counter With Schematic Entry
	SynchDownSchematic counter3 (clk, rst, counter3Out[0], counter3Out[1], counter3Out[2], counter3Out[3]);
	
endmodule
