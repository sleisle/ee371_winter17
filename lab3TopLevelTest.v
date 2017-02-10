module lab3TopLevelTest;
	reg clk; // 50MHz System Clock
	reg [9:0] SW; // ReadyForTransferIn
	reg [3:0] KEY; // Buttons
	wire [31:0] GPIO_0; // AC18 = dataOut, Y17 = clkOut, AD17 = readyToTransmitOut
	
	wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; // Seven Segment Display
	wire [9:0] LEDR; // LEDs

	parameter ClockDelay = 10;

	lab3TopLevel dut (clk, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_0);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	integer i;

	initial begin
		SW[9] <= 1'b1;
		SW[7] <= 1'b1;
		SW[6] <= 1'b0;
		KEY[0] <= 1'b0; @(posedge clk);
		KEY[0] <= 1'b1; @(posedge clk);
		
		@(posedge clk);
		@(posedge clk);
		
		SW[6] <= 1'b1; @(posedge clk);
		
		for (i = 0; i < 80; i = i + 1) begin
			@(posedge clk);
		end
		
		//SW[9] <= 1'b0;
		
		for (i = 0; i < 40; i = i + 1) begin
			@(posedge clk);
		end
	
		$stop;
	end
endmodule
