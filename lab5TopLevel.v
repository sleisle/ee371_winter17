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
	
	wire [255:0] testBuffer;
	wire [255:0] receiveBuffer;
	wire [255:0] sendBuffer;
	reg [255:0] writeReg;
	wire [31:0] row1, row2, row3, row4, row5, row6, row7, row8;
	
	reg [255:0] displayWire;
		
	always @(posedge rst or posedge newData or posedge plzSend) begin: writeDisplay
		if (rst) begin
			writeReg <= testBuffer;
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
		
	assign row1 = 32'h07030303;
	assign row2 = 32'h30303030;
	assign row3 = 32'h07030303;
	assign row4 = 32'h00000000;
	assign row5 = 32'h00000000;
	assign row6 = 32'h10501010;
	assign row7 = 32'h01010101;
	assign row8 = 32'h10101010;
	
	assign testBuffer = /*256'h0303030330303030030303030000000000000000101010100101010110101010;*/{row8, row7, row6, row5, row4, row3, row2, row1};
	
	// Clock Divider
	wire clk, rst;
	wire [31:0] clkMain;
	parameter whichClock = 17;
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
	
	seg7 h0 (displayWire[3:0], HEX0);
	seg7 h1 (displayWire[7:4], HEX1);
	seg7 h2 (displayWire[11:8], HEX2);
	seg7 h3 (displayWire[15:12], HEX3);
	seg7 h4 (displayWire[19:16], HEX4);
	seg7 h5 (displayWire[23:20], HEX5);
	
	wire newData;
	wire plzSend;
	 
//    nios_system_checkersv4 u0 (
//        .clk_clk             (CLOCK_50),             //          clk.clk
//        .reset_reset_n       (~rst),       //        reset.reset_n
//        .sendstate_export    (plzSend),    //    sendstate.export
//        .receivestate_export (test2), // receivestate.export
//        .newdata_export      (newData),      //      newdata.export
//        .row8out_export      (sendBuffer[255:224]),      //      row8out.export
//        .row7out_export      (sendBuffer[223:192]),      //      row7out.export
//        .row6out_export      (sendBuffer[191:160]),      //      row6out.export
//        .row5out_export      (sendBuffer[159:128]),      //      row5out.export
//        .row4out_export      (sendBuffer[127:96]),      //      row4out.export
//        .row3out_export      (sendBuffer[95:64]),      //      row3out.export
//        .row2out_export      (sendBuffer[63:32]),      //      row2out.export
//        .row1out_export      (sendBuffer[31:0]),      //      row1out.export
//        .row8in_export       (receiveBuffer[255:224]),       //       row8in.export
//        .row7in_export       (receiveBuffer[223:192]),       //       row7in.export
//        .row6in_export       (receiveBuffer[191:160]),       //       row6in.export
//        .row5in_export       (receiveBuffer[159:128]),       //       row5in.export
//        .row4in_export       (receiveBuffer[127:96]),       //       row4in.export
//        .row3in_export       (receiveBuffer[95:64]),       //       row3in.export
//        .row2in_export       (receiveBuffer[63:32]),       //       row2in.export
//        .row1in_export       (receiveBuffer[31:0])        //       row1in.export
//    );
	
	comms com (clk, rst, clkIn, dataIn, clkOut, dataOut, readyForSend, readyForReceive, testBuffer, receiveBuffer, startTransfer, newData);
	
	video_driver vga (CLOCK_50, rst, x, y, r, g, b, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);
	board boardGen (displayWire, x, y, r, g, b);
	
	always @(*) begin: testDisp
		if (SW[9])
			displayWire = receiveBuffer;
		else
			displayWire = testBuffer;
	end
	
endmodule
