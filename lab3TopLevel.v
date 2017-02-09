module lab3TopLevel (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_0);
	input wire CLOCK_50; // 50MHz System Clock
	input wire [9:0] SW; // ReadyForTransferIn
	input wire [3:0] KEY; // Buttons
	inout [31:0] GPIO_0; // AC18 = dataOut, Y17 = clkOut, AD17 = readyToTransmitOut	
	
	output wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	output wire [9:0] LEDR; // LEDs
	
	wire [1:0] outFromTransfer, stationToScanner;
	wire [3:0] dataBufferScanner, dataBufferTransfer;
	
	wire clkOut, rst;
	wire [31:0] clkMain;
	
	parameter whichClock = 23;
	
	assign rst = ~KEY[0];
	
	// Initialize clock divider
	assign LEDR[9] = clkOut;
	assign LEDR[8] = rst;
	assign clkOut = clkMain[whichClock];
	clock_divider cdiv (CLOCK_50, clkMain);
	
	assign stationToScanner[1] = outFromTransfer[1];
	assign stationToScanner[0] = outFromTransfer[0] | ~KEY[1];
	
	// Initialize internals
	seg7 h0 (dataBufferScanner, HEX0);
	seg7 h2 (dataBufferTransfer, HEX2);
	
	seg7 h1 (4'b0, HEX1);
	seg7 h3 (4'b0, HEX3);
	seg7 h4 (4'b0, HEX4);
	seg7 h5 (4'b0, HEX5);
	
	scanner localScanner (clkOut, rst, GPIO_0[6], stationToScanner, GPIO_0[1], GPIO_0[0], dataBufferScanner);
	transferCenter localTransfer (GPIO_0[5], rst, GPIO_0[4], SW[9], GPIO_0[2], outFromTransfer, dataBufferTransfer);

	
	
endmodule
