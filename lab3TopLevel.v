module lab3TopLevel (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_0);
	input wire CLOCK_50; // 50MHz System Clock
	input wire [9:0] SW; // ReadyForTransferIn
	input wire [3:0] KEY; // Buttons
	inout [31:0] GPIO_0; // AC18 = dataOut, Y17 = clkOut, AD17 = readyToTransmitOut, AK16 = dataIn, AK18 = clkIn, AK19 = readyToTransmitIn
	
	output wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	output wire [9:0] LEDR; // LEDs
	
	wire [7:0] byteIn;
	wire [1:0] outFromTransfer, stationToScanner;
	wire [3:0] dataBufferScanner;
	wire [7:0] dataBufferTransfer;
	wire [1:0] ps;
	wire [2:0] byteCounter;
	wire [7:0] commandBuffer, shiftReg;
	
	wire clkOut, rst;
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
	
	assign stationToScanner[1] = outFromTransfer[1] & SW[7];
	assign stationToScanner[0] = outFromTransfer[0] | SW[6];
	
	// Initialize internals
	seg7 h0 (dataBufferScanner, HEX0);
	seg7 h2 (dataBufferTransfer[3:0], HEX2);
	
	seg7 h1 (4'b0, HEX1);
	seg7 h3 (4'b0, HEX3);
	seg7 h4 (commandBuffer[3:0], HEX4);
	seg7 h5 (shiftReg[3:0], HEX5);
	
	scanner localScanner (clkOut, rst, GPIO_0[6], stationToScanner, GPIO_0[1], GPIO_0[0], dataBufferScanner); // CHANGE 5 to 1 and 4 to 0 and 2 to 6
	transferCenterNew localTransfer (byteCounter, GPIO_0[5], rst, GPIO_0[4], SW[9], GPIO_0[2], outFromTransfer, dataBufferTransfer, commandBuffer, shiftReg);
	
endmodule