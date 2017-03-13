module lab5TopLevel (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_0, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);
	input wire CLOCK_50; // 50MHz System Clock
	input wire [9:0] SW; // ReadyForTransferIn
	input wire [3:0] KEY; // Buttons
	inout [31:0] GPIO_0; // AC18 = dataOut, Y17 = clkOut, AD17 = readyToTransmitOut, AK16 = dataIn, AK18 = clkIn, AK19 = readyToTransmitIn
	
	output wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	output wire [9:0] LEDR; // LEDs
	output wire VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS;
	output wire [7:0] VGA_R;
	output wire [7:0] VGA_G;
	output wire [7:0] VGA_B;
	
	wire [9:0] x;
	wire [8:0] y;
	wire [7:0] r, g, b;
	
	wire [255:0] receiveBuffer, sendFromReg;
	reg [255:0] testBuffer, receiveFromReg;
	wire [255:0] sendBuffer, receivePostNibble;
		
	// Clock Divider
	wire clk, rst, d1Out;
	wire [31:0] clkMain;
	parameter whichClock = 15;
	clock_divider cdiv (CLOCK_50, clkMain);
	assign clk = clkMain[whichClock];
	
	assign rst = ~KEY[0];
	
	wire sendMe;
	DFlipFlop d1 (d1Out, , ~KEY[1], clk, ~rst);
	DFlipFlop d2 (sendMe, , d1Out, clk, ~rst);
	
	assign trans = (sendMe ^ ~KEY[1]) & ~KEY[1];
	
	assign LEDR[0] = readyForSend;
	assign LEDR[1] = readyForReceive;
	assign LEDR[6] = dataIn;
	assign LEDR[7] = dataOut;
	assign LEDR[8] = clkIn;
	assign LEDR[9] = clkOut;
	
	wire trans;
	
//	// Control Lines
	wire clkOut, clkIn, dataOut, dataIn, readyForSend, readyForReceive, turnStartOff;
	wire plzSend, newData;	
		
	assign GPIO_0[1] = clkOut; //Y17
	assign clkIn = GPIO_0[5]; //AK18
	assign GPIO_0[0] = dataOut; //AC18
	assign dataIn = GPIO_0[4]; //AK16
	assign GPIO_0[6] = readyForReceive; //AD17
	assign readyForSend = GPIO_0[2]; //AK19
	assign readyForReceive = SW[3];
	
    nios_system_checkersv3 u0 (
        .clk_clk             (CLOCK_50),             //          clk.clk
        .reset_reset_n       (~rst),       //        reset.reset_n
        .sendstate_export    (plzSend),    //    sendstate.export
        .receivestate_export (testWire), // receivestate.export
        .newdata_export      (~KEY[2]),      //      newdata.export
        .row8_in_port        (receiveFromReg[255:224]),        //         row8.in_port
        .row8_out_port       (sendFromReg[255:224]),       //             .out_port
        .row7_in_port        (receiveFromReg[223:192]),        //         row7.in_port
        .row7_out_port       (sendFromReg[223:192]),       //             .out_port
        .row6_in_port        (receiveFromReg[191:160]),        //         row6.in_port
        .row6_out_port       (sendFromReg[191:160]),       //             .out_port
        .row5_in_port        (receiveFromReg[159:128]),        //         row5.in_port
        .row5_out_port       (sendFromReg[159:128]),       //             .out_port
        .row4_in_port        (receiveFromReg[127:96]),        //         row4.in_port
        .row4_out_port       (sendFromReg[127:96]),       //             .out_port
        .row3_in_port        (receiveFromReg[95:64]),        //         row3.in_port
        .row3_out_port       (sendFromReg[95:64]),       //             .out_port
        .row2_in_port        (receiveFromReg[63:32]),        //         row2.in_port
        .row2_out_port       (sendFromReg[63:32]),       //             .out_port
        .row1_in_port        (receiveFromReg[31:0]),        //         row1.in_port
        .row1_out_port       (sendFromReg[31:0])        //             .out_port
    );

	
	comms com (clk, rst, clkIn, dataIn, clkOut, dataOut, readyForSend, readyForReceive, sendBuffer, receiveBuffer, trans, newData);
	
	video_driver vga (CLOCK_50, rst, x, y, r, g, b, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);
	board boardGen (testBuffer, x, y, r, g, b);
	
	genvar i;
	generate
		for (i = 0; i < 255; i = i + 8) begin: genNibbles
			assign sendBuffer[i + 7:i] = {sendFromReg[i + 3:i], sendFromReg[i + 7:i + 4]};
			assign receivePostNibble[i + 7:i] = {receiveBuffer[i + 3:i], receiveBuffer[i + 7:i + 4]};
		end
	endgenerate
				
	always @(posedge ~KEY[2]) begin: setReceiveReg
		if (newData) begin
			receiveFromReg <= receivePostNibble;
		end
	end
	
	always @(posedge ~KEY[2] or posedge ~KEY[1]) begin: changeDisp
		if (~KEY[2]) begin
			testBuffer <= receiveBuffer;
		end
		else begin
			testBuffer <= sendBuffer;
		end
	end
	

endmodule
