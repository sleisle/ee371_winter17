module sendBoard(clk, clk_out, data_out, readyIn, board, send, reset, doneSending);
	input wire clk, reset, readyIn, send;
	output data_out;
	input wire [255:0] board;
	output clk_out, doneSending;
	
	reg [8:0] count;
	
	reg sending;
	
	assign doneSending = (count>=9'd255);
	assign clk_out = sending ? clk : 1'b0;
	assign data_out= sending ? board[count] : 1'b0;
	
	always @(posedge send or posedge (count[8]) or posedge reset) begin
		if (reset) sending <= 0;
		else if (send) sending <= (readyIn && count<=9'd255);
		else sending <= 0;
	end
	
	// Only set data if clk_out is active
	always @ (negedge clk_out or posedge reset or negedge send) begin
		if (reset) count<=0;
		else if (~send) begin
			if (~sending) count<=0;
		end else count<=count+1;
	end
	
endmodule


//module testSend;
//	reg clk, reset, readyIn, send;
//	reg [255:0] board;
//	wire data_out, clk_out;
//	
//	
//	sendBoard SB(clk, clk_out, data_out, readyIn, board, send, reset, doneSending);
//	
//	initial begin
//		$dumpfile("sendBoard.vcd");
//		$dumpvars(1,SB);
//	end
//
//	initial begin
//		clk<=0;
//		forever #1 clk<=~clk;
//	end
//	
//	integer i;
//	initial begin
//		board<=256'hf30303033030303003030303000000000000000010101010010101011010101f;
//		reset<=1; readyIn<=0; send<=0; @(posedge clk);
//		reset<=0; readyIn<=1; send<=1; @(posedge clk);
//		for (i=0;i<270;i=i+1) begin
//			@(posedge clk);
//		end
//		reset<=0; readyIn<=1; send<=0; @(posedge clk);
//		for (i=0;i<20;i=i+1) begin
//			@(posedge clk);
//		end
//		reset<=0; readyIn<=1; send<=1; @(posedge clk);
//		for (i=0;i<20;i=i+1) begin
//			@(posedge clk);
//		end
//		$finish;
//	end
//endmodule
