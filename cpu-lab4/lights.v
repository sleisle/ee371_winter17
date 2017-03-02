// Implements a simple Nios II system for the DE-series board.
// Inputs: SW7−0 are parallel port inputs to the Nios II system
// CLOCK_50 is the system clock
// KEY0 is the active-low system reset
// Outputs: LEDG7−0 are parallel port outputs from the Nios II system
module lights (CLOCK_50, SW, KEY, LEDG);
	input CLOCK_50;
	input [7:0] SW;
	input [0:0] KEY;
	output [7:0] LEDG;

	 nios_systemv2 u0 (
		  .clk_clk         (<connected-to-clk_clk>),         //      clk.clk
		  .leds_export     (<connected-to-leds_export>),     //     leds.export
		  .reset_reset_n   (<connected-to-reset_reset_n>),   //    reset.reset_n
		  .switches_export (<connected-to-switches_export>)  // switches.export
	 );
		 
endmodule
