// Keegan Griffee
// Joe Jimenez
// Sean Leslie
// EE 371
// Lab 1: 4 stage ripple down counter gate-level
// A 4 stage ripple down counter with active low reset

module RippleDownCounterGateLevel (out, clk, rst);
	input clk, rst;
	output [3:0] out;
	reg [3:0] cur;	
	
	wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;
	wire qBar3, qBar2, qBar1, qBar0;
	wire q3, q2, q1, q0;
	
	// Update by clock or when reset
	always@ (negedge rst or posedge clk)
		begin
			if (!rst)
				// Reset state
				cur = 4'b0000;
			else
				cur = {q3, q2, q1, q0};
		end
	
	assign out = cur;
	
	// Get each of the not'ed values
	not n1(qBar3, cur[3]);
	not n2(qBar2, cur[2]);
	not n3(qBar1, cur[1]);
	not n4(qBar0, cur[0]);
	
	// MSB out[3] gate logic
	and a1(w1, cur[3], cur[2]);
	and a2(w2, cur[3], cur[0]);
	and a3(w3, cur[3], cur[1]);
	and a4(w4, qBar3, qBar2, qBar1, qBar0);
	or o1(w5, w1, w2, w3, w4);
	and aa5(q3, w5, rst);
	
	// out[2] gate logic
	and a5(w6, qBar2, qBar1, qBar0);
	and a6(w7, cur[2], cur[0]);
	and a7(w8, cur[2], cur[1]);
	or o2(w9, w6, w7, w8);
	and a8(q2, w9, rst);
	
	// out[1] gate logic
	and a10(w10, qBar1, qBar0);
	and a11(w11, cur[1], cur[0]);
	or o4(w12, w10, w11);
	and a14(q1, w12, rst);
	
	// out[0] gate logic
	and a15(q0, qBar0, rst);
	
endmodule	
