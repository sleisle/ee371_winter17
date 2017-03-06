module board (boardBuffer, x, y, r, g, b);
	input wire [255:0] boardBuffer;
	input wire [9:0] x;
	input wire [8:0] y;
	output wire [7:0] r, g, b;
	reg [23:0] color;
	wire [2:0] xBoard, yBoard;
	wire drawWhite;
	
	parameter WHITE = ~(24'b0), BLACK = 24'b0, RED = {8'd255, 16'd0}, GREEN = {8'd0, 8'd255, 8'd0};
	
	assign r = color[23:16];
	assign g = color[15:8];
	assign b = color[7:0];
	
	assign xBoard = x / 60;
	assign yBoard = y / 60;
	assign drawWhite = ((xBoard % 2) ^ (yBoard % 2));
	
	always @(*) begin: boardOut
		// Draw checkered pattern
		if (drawWhite) begin
			color <= WHITE;
		end
		else begin
			color <= BLACK;
		end
		
	end

endmodule

module boardTestBench ();
	reg [255:0] boardBuffer;
	reg [9:0] x;
	reg [8:0] y;
	wire [7:0] r, g, b;
	
	board dut (boardBuffer, x, y, r, g, b);
	
	parameter d = 10; // delay
	
	initial begin
		#d;
		boardBuffer <= 255'b0;
		x <= 10'd0;
		y <= 9'd0;
		#d;
		x <= 10'd65;
		y <= 9'd0;
		#d;
		x <= 10'd65;
		y <= 9'd80;
		#d;
		x <= 10'd150;
		y <= 9'd150;
		#d;
		x <= 10'd150;
		y <= 9'd80;
		#d;
	
		$stop;
	end

endmodule
