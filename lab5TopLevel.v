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
	
	wire [255:0] receiveBuffer, testBuffer;
	reg [255:0] sendBuffer;
	assign testBuffer = 256'b0000001100000011000000110000001100110000001100000011000000110000000000110000001100000011000000110000000000000000000000000000000000000000000000000000000000000000000100000001000000010000000100000000000100000001000000010000000100010000000100000001000000010000;

	// Clock Divider
	wire clk, rst;
	wire [31:0] clkMain;
	parameter whichClock = 20;
	clock_divider cdiv (CLOCK_50, clkMain);
	assign clk = clkMain[whichClock];
	
	assign rst = ~KEY[0];
	
	assign LEDR[0] = readyForSend;o0
	assign LEDR[1] = readyForReceive;
	assign LEDR[2] = startTransfer;
	assign LEDR[6] = dataIn;
	assign LEDR[7] = dataOut;
	assign LEDR[8] = clkOut;
	assign LEDR[9] = clkIn;
	
//	// Control Lines
	wire clkOut, clkIn, dataOut, dataIn, readyForSend, readyForReceive, turnStartOff;
	wire startTransfer;
	wire plzSend, newData;
	
	// Try this code, so that startTransfer goes low after a clock cycle
//	always @(posedge SW[2] or posedge turnStartOff) begin: starting
//		if (turnStartOff)
//			startTransfer <= 1'b0;
//		else
//			startTransfer <= SW[2];
//	end	
//	
//	assign turnStartOff = SW[2] & clk;
	
	// Throws error due to multiple writes
//	always @(posedge rst) begin: resetSend
//		// Starting state of checkers
//		sendBuffer <= 256'h0303030330303030030303030000000000000000101010100101010110101010;
//	end

	assign startTransfer = SW[2];
	
	assign GPIO_0[1] = clkOut; //Y17
	assign clkIn = GPIO_0[5]; //AK18
	assign GPIO_0[0] = dataOut; //AC18
	assign dataIn = GPIO_0[4]; //AK16
	assign GPIO_0[2] = readyForReceive & SW[3]; //AD17
	assign readyForSend = GPIO_0[6]; //AK19
		
//	// rst needs to reset the board state in C
//    nios_system_checkers u0 (
//        .clk_clk             (CLOCK_50),             //          clk.clk
//        .reset_reset_n       (~rst),       //        reset.reset_n  		Is this an active-low?
//        .sendstate_export    (plzSend),    //    sendstate.export  		Make sure to tie low after a clock cycle or so
//        .receivestate_export (), // receivestate.export
//        .newdata_export      (newData),      //      newdata.export
//        .row8_in_port        (receiveBuffer[255:224]),        //         row8.in_port
//        .row8_out_port       (sendBuffer[255:224]),       //             .out_port
//        .row7_in_port        (receiveBuffer[223:192]),        //         row7.in_port
//        .row7_out_port       (sendBuffer[223:192]),       //             .out_port
//        .row6_in_port        (receiveBuffer[191:160]),        //         row6.in_port
//        .row6_out_port       (sendBuffer[191:160]),       //             .out_port
//        .row5_in_port        (receiveBuffer[159:128]),        //         row5.in_port
//        .row5_out_port       (sendBuffer[159:128]),       //             .out_port
//        .row4_in_port        (receiveBuffer[127:96]),        //         row4.in_port
//        .row4_out_port       (sendBuffer[127:96]),       //             .out_port
//        .row3_in_port        (receiveBuffer[95:64]),        //         row3.in_port
//        .row3_out_port       (sendBuffer[95:64]),       //             .out_port
//        .row2_in_port        (receiveBuffer[63:32]),        //         row2.in_port
//        .row2_out_port       (sendBuffer[63:32]),       //             .out_port
//        .row1_in_port        (receiveBuffer[31:0]),        //         row1.in_port
//        .row1_out_port       (sendBuffer[31:0])        //             .out_port
//    );

//    nios_systemv3 u0 (
//        .clk_clk                (CLOCK_50),                //             clk.clk
//        .readytotransfer_export (rdySend), // readytotransfer.export
//        .reset_reset_n          (~rst),          //           reset.reset_n
//        .startscanning_export   (transfer),   //   startscanning.export
//        .transfer_export        (z3)         //        transfer.export
//    );
	
	comms com (clk, rst, clkIn, dataIn, clkOut, dataOut, readyForSend, readyForReceive, sendBuffer, receiveBuffer, startTransfer, newData);
	video_driver vga (CLOCK_50, rst, x, y, r, g, b, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);
	board boardGen (testBuffer, x, y, r, g, b);
	
	// Hex displays
	seg7 h0 (receiveBuffer[255:253], HEX0);
	seg7 h1 (receiveBuffer[252:250], HEX1);
	seg7 h2 (receiveBuffer[249:247], HEX2);
	seg7 h3 (receiveBuffer[246:244], HEX3);
	seg7 h4 (receiveBuffer[243:241], HEX4);
	seg7 h5 (sendBuffer[255:253], HEX5);
	
	// Set sendData
	integer i;
	
	always @(posedge clk) begin:sendData
		if (SW[1]) begin
			sendBuffer <= ~(256'b0);
		end
		else begin
			for (i = 0; i < 256; i = i + 1) begin
				if (i % 2 == 0) begin
					sendBuffer = ((sendBuffer << 3) + 1'b1);
				end
			end
		end
	end

endmodule
