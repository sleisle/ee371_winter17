module receiveBoard(clk, data_in, board, readyOut, rcvd, reset);
	input clk, reset;
	input data_in;
	output reg [255:0] board;
	input readyOut;
	output reg rcvd=0;
	
	reg [255:0] buffer;
	reg [8:0] count;
	
	always @(posedge clk or posedge reset) begin
		if (reset) board <= 256'b0;
		else board[count]<=data_in;
	end
	
	always @(negedge clk or posedge reset) begin
		if (reset) count<=8'b0;
		else if(count==8'd254) count<=8'b0;
		else count<=count+1;
	end
	
	always @(count==8'd254) begin
		rcvd<=~rcvd;
	end
endmodule

/*
module testRcv;
	reg clk, data, reset;
	wire [255:0] board;
	wire readyOut, rcvd;

	receiveBoard r(clk, data, board, readyOut, rcvd, reset);
	
	initial begin
		$dumpfile("rcv.vcd");
		$dumpvars(1,r);
	end

	initial begin
		clk<=0;
		forever #1 clk<=~clk;
	end
	
	integer i;
	initial begin
		reset<=1; @(posedge clk);
		reset<=0; @(posedge clk);
		for (i=0; i<128; i=i+1) begin
			data<=1; @(posedge clk);
			data<=0; @(posedge clk);
		end
		for (i=0; i<129; i=i+1) begin
			data<=0; @(posedge clk);
			data<=1; @(posedge clk);
		end
 
		$finish;
	end
endmodule
*/