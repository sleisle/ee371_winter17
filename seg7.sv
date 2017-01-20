module seg7 (bcd, leds);
	 input logic [2:0] bcd;
	 output logic [6:0] leds;

	 always_comb
		 case (bcd)
			 //          Light: 6543210
			 4'b000: leds = ~(7'b0111111); // 0
			 4'b001: leds = ~(7'b0000110); // 1
			 4'b010: leds = ~(7'b1011011); // 2
			 4'b011: leds = ~(7'b1001111); // 3
			 4'b100: leds = ~(7'b1100110); // 4
			 4'b101: leds = ~(7'b1101101); // 5
			 4'b110: leds = ~(7'b1111101); // 6
			 4'b111: leds = ~(7'b0000111); // 7
			 default: leds = 7'bX;
		 endcase
endmodule
