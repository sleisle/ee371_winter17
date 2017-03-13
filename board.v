module board (boardBuffer, x, y, r, g, b);
	input wire [255:0] boardBuffer;
	input wire [9:0] x;
	input wire [8:0] y;
	output wire [7:0] r, g, b;
	reg [23:0] color;
	wire [4:0] xBoard, yBoard, xBoardPre, yBoardPre;
	wire drawWhite;
	wire [31:0] bufferStartPoint;
	wire [31:0] xAdjusted, yAdjusted;
	
	parameter WHITE = ~(24'b0), BLACK = 24'b0, RED = {8'd255, 16'd0}, GREEN = {8'd0, 8'd255, 8'd0}, YELLOW = {8'd255, 8'd255, 8'd0};
	parameter GREY = {8'd169, 8'd169, 8'd169};
	integer RADIUS = 25;
	
	assign r = color[23:16];
	assign g = color[15:8];
	assign b = color[7:0];
	
	assign xAdjusted = (x % 60) - 29;
	assign yAdjusted = (y % 60) - 29;
	assign xBoardPre = (x / 60);
	assign yBoardPre = y / 60;
	assign drawWhite = ((xBoard % 2) ^ (yBoard % 2));
	
	assign xBoard = {xBoardPre[4:1], xBoardPre[0]};
	assign yBoard = yBoardPre;
	
	// Set bufferStartPoint = to start index of piece on board based on x and y
	assign bufferStartPoint = 4 * (xBoard + 8 * yBoard);
	
	always @(*) begin: boardOut
		if (x > 479) begin // Maybe change this to < X_OFFSET || > 640 - X_OFFSET
			color <= GREY;
		end
		else begin
			if (boardBuffer[bufferStartPoint]) begin // There is a piece there
						
				if ((RADIUS * RADIUS) > ((yAdjusted * yAdjusted) + (xAdjusted * xAdjusted))) begin
				
					if (boardBuffer[bufferStartPoint + 2]) begin // Piece is a king
					
						if ((xAdjusted * xAdjusted < 25) || (yAdjusted * yAdjusted < 25)) begin
							color <= YELLOW;
						end
						else if (boardBuffer[bufferStartPoint + 1]) begin // Piece belongs to red
							color <= RED;
						end
						else if (~boardBuffer[bufferStartPoint + 1]) begin
							color <= GREEN; // Piece belongs to green
						end
					end
					else begin

						if (boardBuffer[bufferStartPoint + 1]) begin // Piece belongs to red
							color <= RED;
						end
						else if (~boardBuffer[bufferStartPoint + 1]) begin
							color <= GREEN; // Piece belongs to green
						end
						else begin
							if (drawWhite) begin
								color <= WHITE;
							end
							else begin
								color <= BLACK;
							end
						end
					
					end
					
				end
				else begin
					// Draw checkered pattern
					if (drawWhite) begin
						color <= WHITE;
					end
					else begin
						color <= BLACK;
					end
				end
			end
			else begin // No piece
				// Draw checkered pattern
				if (drawWhite) begin
					color <= WHITE;
				end
				else begin
					color <= BLACK;
				end
			end

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
	integer i;
	integer result;
	
	initial begin
		#d;
		boardBuffer <= 255'b0000001100000011000000110000001100110000001100000011000000110000000000110000001100000011000000110000000000000000000000000000000000000000000000000000000000000000000100000001000000010000000100000000000100000001000000010000000100010000000100000001000000010000;

		for (i=0; i<9; i=i+1) begin
			result = i * 10'd60;
			x <= 10'd30 + result;
			y <= 9'd30;
			#d;
		end
		
		for (i=0; i<9; i=i+1) begin
			result = i * 10'd60;
			x <= 10'd30 + result;
			y <= 9'd90;
			#d;
		end
		
		for (i=0; i<9; i=i+1) begin
			result = i * 10'd60;
			x <= 10'd30 + result;
			y <= 9'd150;
			#d;
		end
		
		for (i=0; i<9; i=i+1) begin
			result = i * 10'd60;
			x <= 10'd30 + result;
			y <= 9'd210;
			#d;
		end
	
		$stop;
	end

endmodule
