module board (boardBuffer, x, y, r, g, b);
	input wire [255:0] boardBuffer;
	input wire [9:0] x;
	input wire [8:0] y;
	output wire [7:0] r, g, b;
	reg [23:0] color;
	wire [2:0] xBoard, yBoard;
	wire drawWhite;
	wire [7:0] bufferStartPoint;
	wire [5:0] xAdjusted, yAdjusted;
	
	parameter WHITE = ~(24'b0), BLACK = 24'b0, RED = {8'd255, 16'd0}, GREEN = {8'd0, 8'd255, 8'd0};
	
	integer X_OFFSET = 100;
	integer RADIUS = 25;
	
	assign r = color[23:16];
	assign g = color[15:8];
	assign b = color[7:0];
	
	assign xAdjusted = (x - X_OFFSET) % 60;
	assign yAdjusted = y % 60;
	assign xBoard = ((x + X_OFFSET) / 60) - 1;
	assign yBoard = y / 60;
	assign drawWhite = ((xBoard % 2) ^ (yBoard % 2));
	
	// Set bufferStartPoint = to start index of piece on board based on x and y
	assign bufferStartPoint = 4 * (xBoard + 8 * yBoard);
	
	always @(*) begin: boardOut
		if (x < 80 || x > 560) begin // Maybe change this to < X_OFFSET || > 640 - X_OFFSET
			color <= BLACK;
		end
		else begin
			if (bufferStartPoint) begin // There is a piece there
			
			// Uncomment this if and else pair after testing the piece detection
			
//				if ((yAdjusted * yAdjusted) == ((RADIUS * RADIUS) - (xAdjusted * xAdjusted))) begin


					if (boardBuffer[bufferStartPoint + 1]) begin // Piece belongs to red
						color <= RED;
					end
					else begin
						color <= GREEN; // Piece belongs to green
					end
					
					
//				end
//				else begin
//					// Draw checkered pattern
//					if (drawWhite) begin
//						color <= WHITE;
//					end
//					else begin
//						color <= BLACK;
//					end
//				end
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
	
	initial begin
		#d;
		boardBuffer <= 255'b0000001100000011000000110000001100110000001100000011000000110000000000110000001100000011000000110000000000000000000000000000000000000000000000000000000000000000000100000001000000010000000100000000000100000001000000010000000100010000000100000001000000010000;
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
