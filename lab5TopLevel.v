module lab5TopLevel (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_0);
	input wire CLOCK_50; // 50MHz System Clock
	input wire [9:0] SW; // ReadyForTransferIn
	input wire [3:0] KEY; // Buttons
	inout [31:0] GPIO_0; // AC18 = dataOut, Y17 = clkOut, AD17 = readyToTransmitOut, AK16 = dataIn, AK18 = clkIn, AK19 = readyToTransmitIn
	
	output wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	output wire [9:0] LEDR; // LEDs
	
	wire [255:0] receiveBuffer;
	reg [255:0] sendBuffer;

	// Clock Divider
	wire clk, rst;
	wire [31:0] clkMain;
	parameter whichClock = 0;
	clock_divider cdiv (CLOCK_50, clkMain);
	assign clk = clkMain[whichClock];
	
	assign rst = ~KEY[0];
	
	assign LEDR[0] = readyForSend;
	assign LEDR[1] = readyForReceive;
	assign LEDR[2] = startTransfer;
	assign LEDR[8] = dataIn;
	assign LEDR[7] = dataOut;
	assign LEDR[9] = clkIn;
	
	// Control Lines
	wire clkOut, clkIn, dataOut, dataIn, readyForSend, readyForReceive, turnStartOff;
	reg startTransfer;
	always @(negedge KEY[3] or posedge turnStartOff) begin: starting
		if (turnStartOff)
			startTransfer <= 1'b0;
		else
			startTransfer <= ~KEY[3];
	end
	
	assign turnStartOff = ~KEY[3] & clk;
	
	assign GPIO_0[1] = clkOut; //Y17
	assign clkIn = GPIO_0[5]; //AK18
	assign GPIO_0[0] = dataOut; //AC18
	assign dataIn = GPIO_0[4]; //AK16
	assign GPIO_0[2] = readyForReceive; //AD17
	assign readyForSend = GPIO_0[6] | SW[0]; //AK19
	
	
    nios_system_checkers u0 (
        .clk_clk             (CLOCK_50),             //          clk.clk
        .reset_reset_n       (~rst),       //        reset.reset_n
        .sendstate_export    (),    //    sendstate.export
        .receivestate_export (), // receivestate.export
        .newdata_export      (),      //      newdata.export
        .row8_in_port        (),        //         row8.in_port
        .row8_out_port       (),       //             .out_port
        .row7_in_port        (),        //         row7.in_port
        .row7_out_port       (),       //             .out_port
        .row6_in_port        (),        //         row6.in_port
        .row6_out_port       (),       //             .out_port
        .row5_in_port        (),        //         row5.in_port
        .row5_out_port       (),       //             .out_port
        .row4_in_port        (),        //         row4.in_port
        .row4_out_port       (),       //             .out_port
        .row3_in_port        (),        //         row3.in_port
        .row3_out_port       (),       //             .out_port
        .row2_in_port        (),        //         row2.in_port
        .row2_out_port       (),       //             .out_port
        .row1_in_port        (),        //         row1.in_port
        .row1_out_port       ()        //             .out_port
    );

	
	
	comms com (clk, rst, clkIn, dataIn, clkOut, dataOut, readyForSend, readyForReceive, sendBuffer, receiveBuffer, startTransfer);
	
	// Hex displays
	seg7 h0 (receiveBuffer[255:253], HEX0);
	seg7 h1 (receiveBuffer[252:250], HEX1);
	seg7 h2 (receiveBuffer[249:247], HEX2);
	seg7 h3 (receiveBuffer[246:244], HEX3);
	seg7 h4 (receiveBuffer[243:241], HEX4);
	seg7 h5 (receiveBuffer[240:238], HEX5);
	
	// Set sendData
	integer i;
	
	always @(posedge clk) begin:sendData
		if (SW[1]) begin
			sendBuffer <= (256'b1 << 255) + 1'b1;
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
