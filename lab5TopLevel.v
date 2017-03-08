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
	wire [255:0] testBuffer;
	wire [255:0] receiveBuffer;
	wire [255:0] sendBuffer;
	wire [31:0] row1, row2, row3, row4, row5, row6, row7, row8;
	
	assign row8 = 32'h30303030;
	assign row7 = 32'h03030303;
	assign row6 = 32'h30303030;
	assign row5 = 32'h00000000;
	assign row4 = 32'h00000000;
	assign row3 = 32'h01010101;
	assign row2 = 32'h10101010;
	assign row1 = 32'h01010101;
	
	assign testBuffer = {row8, row7, row6, row5, row4, row3, row2, row1};
	
	// Clock Divider
	wire clk, rst;
	wire [31:0] clkMain;
	parameter whichClock = 20;
	clock_divider cdiv (CLOCK_50, clkMain);
	assign clk = clkMain[whichClock];
	
	assign rst = ~KEY[0];
	
	assign LEDR[2] = SW[2];
	
	reg newData;
	wire plzSend;
	
//	always@(posedge SW[2] or posedge rst) begin:sendData
//		if (rst) begin
//			receiveBuffer <= testBuffer;
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
	 
	 	nios_system_checkersv3 u0 (
        .clk_clk             (CLOCK_50),             //          clk.clk
        .reset_reset_n       (~rst),       //        reset.reset_n
        .sendstate_export    (plzSend),    //    sendstate.export
        .receivestate_export (test2), // receivestate.export
        .newdata_export      (newData),      //      newdata.export
        .row8_in_port        (),        //         row8.in_port
        .row8_out_port       (sendBuffer[255:224]),       //             .out_port
        .row7_in_port        (),        //         row7.in_port
        .row7_out_port       (sendBuffer[223:192]),       //             .out_port
        .row6_in_port        (),        //         row6.in_port
        .row6_out_port       (sendBuffer[191:160]),       //             .out_port
        .row5_in_port        (),        //         row5.in_port
        .row5_out_port       (sendBuffer[159:128]),       //             .out_port
        .row4_in_port        (),        //         row4.in_port
        .row4_out_port       (sendBuffer[127:96]),       //             .out_port
        .row3_in_port        (),        //         row3.in_port
        .row3_out_port       (sendBuffer[95:64]),       //             .out_port
        .row2_in_port        (),        //         row2.in_port
        .row2_out_port       (sendBuffer[63:32]),       //             .out_port
        .row1_in_port        (),        //         row1.in_port
        .row1_out_port       (sendBuffer[31:0])        //             .out_port
    );
	
	
	
	video_driver vga (CLOCK_50, rst, x, y, r, g, b, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);
	//board boardGen (receiveBuffer, x, y, r, g, b);
	board boardGen (sendBuffer, x, y, r, g, b);
	//board boardGen (testBuffer, x, y, r, g, b);

endmodule
