/*
This module is intended to model a subset of the Wolfson WM8731 audio CODEC chip's
functionality. It does not model the behavior of the serial communication of commands
to the CODEC and so makes some assumptions about its operating state.

The following conditions must be ensured by the user for this module to act as an
accurate simulated model of the CODEC:
The CODEC is in slave mode.
The FPGA generates the master clock for the CODEC (MCLK/XTI/XCK).
The CODEC supplies the bit clock (BCLK) and it is at 1/4 the frequency of MCLK.
The CODEC uses MCLK to generate its own L/R clocks (ADCLRC/DACLRC) which the FPGA uses.
The sampling rates for the DAC and ADC must be equal.
None of the clock signals are inverted.
*/

`timescale 1 ns / 1 ps

module wolfson (AUD_XCK, AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK, AUD_ADCDAT, AUD_DACDAT);
	input AUD_XCK;
	output AUD_DACLRCK;
	output AUD_ADCLRCK;
	output AUD_BCLK;
	output AUD_ADCDAT;
	input AUD_DACDAT;
	
	reg [8:0] counter;
	
	initial counter = 0;
	
	assign AUD_DACLRCK = counter[8];
	assign AUD_ADCLRCK = AUD_DACLRCK;
	assign AUD_BCLK = counter[2];
	// Feed DAC data to ADC. This may be problematic for some designs which employ
	// feedback themselves so feel free to modify this line.
	assign AUD_ADCDAT = AUD_DACDAT; 
	
	always @(posedge AUD_XCK) begin
		counter <= counter + 1;
	end
endmodule

module wolfson_testbench ();
	reg clock;
	wire AUD_XCK, AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK, AUD_ADCDAT, AUD_DACDAT;
	// Set up the clock. 
	parameter CLOCK_PERIOD=20; 
	initial clock<=1;
	always begin 
		#(CLOCK_PERIOD/2); 
		clock <= ~clock; 
	end

	Wolfson chip (.AUD_XCK, .AUD_DACLRCK, .AUD_ADCLRCK, .AUD_BCLK, .AUD_ADCDAT, .AUD_DACDAT);
	// leave I2C disconnected
	example top (.CLOCK_50(clock), .FPGA_I2C_SCLK(), .FPGA_I2C_SDAT(), .AUD_XCK, .AUD_DACLRCK, .AUD_ADCLRCK, .AUD_BCLK, .AUD_ADCDAT, .AUD_DACDAT);
	
	initial begin
		// user test bench routine here
		$stop;
	end
endmodule
