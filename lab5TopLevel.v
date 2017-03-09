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
	
	//wire [255:0] receiveBuffer, testBuffer;
	// wire [255:0] testBuffer;
	wire [255:0] receiveBuffer;
	wire [255:0] sendBuffer;
	reg [255:0] writeReg;
	wire [31:0] row1, row2, row3, row4, row5, row6, row7, row8;
		
	always @(posedge rst or posedge newData or posedge plzSend) begin: writehShit
		if (rst) begin
			writeReg <= sendBuffer;
		end
		else begin
			if (newData) begin
				writeReg <= receiveBuffer;
			end
			else begin
				writeReg <= sendBuffer;
			end
		end
	end
		
	/*assign row8 = 32'h30303030;
	assign row7 = 32'h03030303;
	assign row6 = 32'h30303030;
	assign row5 = 32'h00000000;
	assign row4 = 32'h00000000;
	assign row3 = 32'h01010101;
	assign row2 = 32'h10101010;
	assign row1 = 32'h01010101;*/
	
	// assign testBuffer = {row8, row7, row6, row5, row4, row3, row2, row1};
	
	// Clock Divider
	wire clk, rst;
	wire [31:0] clkMain;
	parameter whichClock = 10;
	clock_divider cdiv (CLOCK_50, clkMain);
	assign clk = clkMain[whichClock];
	
	assign rst = ~KEY[0];
	
	assign LEDR[0] = readyForSend;
	assign LEDR[1] = readyForReceive;
	assign LEDR[2] = startTransfer;
	assign LEDR[6] = dataIn;
	assign LEDR[7] = dataOut;
	assign LEDR[8] = clkOut;
	assign LEDR[9] = clkIn;	
	
	assign startTransfer = SW[2];
	
	assign GPIO_0[1] = clkOut; //Y17
	assign clkIn = GPIO_0[5]; //AK18
	assign GPIO_0[0] = dataOut; //AC18
	assign dataIn = GPIO_0[4]; //AK16
	assign GPIO_0[6] = readyForReceive & SW[3]; //AD17
	assign readyForSend = GPIO_0[2]; //AK19
	
	seg7 h0 (receiveBuffer[3:0], HEX0);
	seg7 h1 (receiveBuffer[7:4], HEX1);
	seg7 h2 (receiveBuffer[11:8], HEX2);
	seg7 h3 (receiveBuffer[15:12], HEX3);
	seg7 h4 (receiveBuffer[19:16], HEX4);
	seg7 h5 (receiveBuffer[23:20], HEX5);
	
	wire newData;
	wire plzSend;
	
//	always@(posedge SW[2] or posedge rst) begin:sendData
//		if (rst) begin
//			receiveBuffer <= sendBuffer;
//			newData <= 1'b1;
//		end
//		else begin
//			receiveBuffer <= sendBuffer;
//			newData <= 1'b1;
//		end
//	end
	
//	nios_system_checkersv3 u0 (
//        .clk_clk             (CLOCK_50),             //          clk.clk
//        .reset_reset_n       (~rst),       //        reset.reset_n
//        .sendstate_export    (plzSend),    //    sendstate.export
//        .receivestate_export (test2), // receivestate.export
//        .newdata_export      (newData),      //      newdata.export
//        .row8_in_port        (writeReg[255:224]),        //         row8.in_port
//        .row8_out_port       (sendBuffer[255:224]),       //             .out_port
//        .row7_in_port        (writeReg[223:192]),        //         row7.in_port
//        .row7_out_port       (sendBuffer[223:192]),       //             .out_port
//        .row6_in_port        (writeReg[191:160]),        //         row6.in_port
//        .row6_out_port       (sendBuffer[191:160]),       //             .out_port
//        .row5_in_port        (writeReg[159:128]),        //         row5.in_port
//        .row5_out_port       (sendBuffer[159:128]),       //             .out_port
//        .row4_in_port        (writeReg[127:96]),        //         row4.in_port
//        .row4_out_port       (sendBuffer[127:96]),       //             .out_port
//        .row3_in_port        (writeReg[95:64]),        //         row3.in_port
//        .row3_out_port       (sendBuffer[95:64]),       //             .out_port
//        .row2_in_port        (writeReg[63:32]),        //         row2.in_port
//        .row2_out_port       (sendBuffer[63:32]),       //             .out_port
//        .row1_in_port        (writeReg[31:0]),        //         row1.in_port
//        .row1_out_port       (sendBuffer[31:0])        //             .out_port
//    );
	 
	 
    nios_system_checkersv4 u0 (
        .clk_clk             (CLOCK_50),             //          clk.clk
        .reset_reset_n       (~rst),       //        reset.reset_n
        .sendstate_export    (plzSend),    //    sendstate.export
        .receivestate_export (test2), // receivestate.export
        .newdata_export      (newData),      //      newdata.export
        .row8out_export      (sendBuffer[255:224]),      //      row8out.export
        .row7out_export      (sendBuffer[223:192]),      //      row7out.export
        .row6out_export      (sendBuffer[191:160]),      //      row6out.export
        .row5out_export      (sendBuffer[159:128]),      //      row5out.export
        .row4out_export      (sendBuffer[127:96]),      //      row4out.export
        .row3out_export      (sendBuffer[95:64]),      //      row3out.export
        .row2out_export      (sendBuffer[63:32]),      //      row2out.export
        .row1out_export      (sendBuffer[31:0]),      //      row1out.export
        .row8in_export       (writeReg[255:224]),       //       row8in.export
        .row7in_export       (writeReg[223:192]),       //       row7in.export
        .row6in_export       (writeReg[191:160]),       //       row6in.export
        .row5in_export       (writeReg[159:128]),       //       row5in.export
        .row4in_export       (writeReg[127:96]),       //       row4in.export
        .row3in_export       (writeReg[95:64]),       //       row3in.export
        .row2in_export       (writeReg[63:32]),       //       row2in.export
        .row1in_export       (writeReg[31:0])        //       row1in.export
    );

	 
	 
	 
//	 	nios_system_checkersv3 u0 (
//        .clk_clk             (CLOCK_50),             //          clk.clk
//        .reset_reset_n       (~rst),       //        reset.reset_n
//        .sendstate_export    (plzSend),    //    sendstate.export
//        .receivestate_export (test2), // receivestate.export
//        .newdata_export      (newData),      //      newdata.export
//        .row8_in_port        (),        //         row8.in_port
//        .row8_out_port       (sendBuffer[255:224]),       //             .out_port
//        .row7_in_port        (),        //         row7.in_port
//        .row7_out_port       (sendBuffer[223:192]),       //             .out_port
//        .row6_in_port        (),        //         row6.in_port
//        .row6_out_port       (sendBuffer[191:160]),       //             .out_port
//        .row5_in_port        (),        //         row5.in_port
//        .row5_out_port       (sendBuffer[159:128]),       //             .out_port
//        .row4_in_port        (),        //         row4.in_port
//        .row4_out_port       (sendBuffer[127:96]),       //             .out_port
//        .row3_in_port        (),        //         row3.in_port
//        .row3_out_port       (sendBuffer[95:64]),       //             .out_port
//        .row2_in_port        (),        //         row2.in_port
//        .row2_out_port       (sendBuffer[63:32]),       //             .out_port
//        .row1_in_port        (),        //         row1.in_port========
//        .row1_out_port       (sendBuffer[31:0])        //             .out_port
//    );
	
	comms com (clk, rst, clkIn, dataIn, clkOut, dataOut, readyForSend, readyForReceive, sendBuffer, receiveBuffer, plzSend, newData);
	
	video_driver vga (CLOCK_50, rst, x, y, r, g, b, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);
	board boardGen (sendBuffer, x, y, r, g, b);
	//board boardGen (sendBuffer, x, y, r, g, b);
	//board boardGen (testBuffer, x, y, r, g, b);

endmodule
