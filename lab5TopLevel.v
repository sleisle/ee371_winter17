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
	reg [255:0] sendBuffer;
		
	// Clock Divider
	wire clk, rst, d1Out, sendMe;
	wire [31:0] clkMain;
	parameter whichClock = 17;
	clock_divider cdiv (CLOCK_50, clkMain);
	assign clk = clkMain[whichClock];
	
	assign rst = ~KEY[0];
//	assign sendMe = ~KEY[1];
	
	DFlipFlop d1 (d1Out, , ~KEY[1], clk, ~rst);
	DFlipFlop d2 (sendMe, , d1Out, clk, ~rst);
	
	assign LEDR[0] = readyForSend;
	assign LEDR[1] = readyForReceive;
	assign LEDR[2] = startTransfer;
	assign LEDR[6] = dataIn;
	assign LEDR[7] = dataOut;
	assign LEDR[8] = clkOut;
	assign LEDR[9] = clkIn;
	
	wire trans;
	assign trans = (sendMe ^ ~KEY[1]) & ~KEY[1];
	
//	// Control Lines
	wire clkOut, clkIn, dataOut, dataIn, readyForSend, readyForReceive, turnStartOff;
	wire startTransfer;
	wire plzSend, newData;	
	
	assign startTransfer = SW[2];
	
	assign GPIO_0[1] = clkOut; //Y17
	assign clkIn = GPIO_0[5]; //AK18
	assign GPIO_0[0] = dataOut; //AC18
	assign dataIn = GPIO_0[4]; //AK16
	assign GPIO_0[6] = readyForReceive & SW[3]; //AD17
	assign readyForSend = GPIO_0[2]; //AK19

	
    nios_system_checkersv3 u0 (
        .clk_clk             (clk),             //          clk.clk
        .reset_reset_n       (~rst),       //        reset.reset_n
        .sendstate_export    (plzSend),    //    sendstate.export
        .receivestate_export (test2), // receivestate.export
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
	
	// Hex displays
	seg7 h0 (receiveBuffer[3:0], HEX0);
	seg7 h1 (receiveBuffer[7:4], HEX1);
	seg7 h2 (receiveBuffer[11:8], HEX2);
	seg7 h3 (receiveBuffer[15:12], HEX3);
	seg7 h4 (receiveBuffer[19:16], HEX4);
	seg7 h5 (receiveBuffer[23:20], HEX5);

	always @(posedge ~KEY[2]) begin: latchReceive
		receiveFromReg <= receiveBuffer;
	end

	wire [1:0] setSendBuffer;
	assign setSendBuffer = {SW[1], SW[0]};

	always @(*) begin: assignSend
		case(setSendBuffer)
			2'b00: begin
				sendBuffer <= 256'h3030303003030303303030300000000000000000010101011010101001010101;
			end
			2'b01: begin
				sendBuffer <= 256'h3030303003030303003030300300000000000000010101011010101001010101;
			end
			2'b10: begin
				sendBuffer <= sendFromReg;
			end
			2'b11: begin
				sendBuffer <= receiveFromReg;
			end
		endcase
	end
		
	// Set sendData
	
	always @(*) begin: testBuffffff
		if (SW[9]) begin
			testBuffer <= receiveBuffer;
		end
		else begin
			testBuffer <= sendBuffer;
		end
	end
	
endmodule
