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
	
	wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11,
		 w12, w13, w14, w15, w16, w17, w18, w19, w20;
	wire qBar3, qBar2, qBar1, qBar0;
	wire q3, q2, q1, q0;
	
	always@ (negedge rst or posedge clk)
		begin
			if (!rst)
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
	// or o1(w1, cur[1], cur[2]);
	// and a1(w2, w1, cur[3]);
	// and a2(w3, cur[1], cur[2]);
	// and a3(w4, w3, qBar0);
	// or o2(w5, w2, w4);
	// and a4(q3, w5, rst);
	
	// out[2] gate logic
	and a5(w6, qBar2, qBar1, qBar0);
	and a6(w7, cur[2], cur[0]);
	and a7(w8, cur[2], cur[1]);
	or o2(w9, w6, w7, w8);
	and a8(q2, w9, rst);
	// and a5(w6, cur[3], cur[2], cur[1]);
	// and a6(w7, cur[2], cur[0]);
	// and a7(w8, cur[3], qBar1, cur[0]);
	// and a8(w9, qBar2, qBar1, qBar0);
	// or o3(w10, w6, w7, w8, w9);
	// and a9(q2, w10, rst);
	
	// out[1] gate logic
	and a10(w11, qBar1, qBar0);
	//and a11(w12, cur[3], cur[2], qBar1);
	and a12(w13, qBar3, cur[1], cur[0]);
	and a13(w14, qBar2, cur[1], cur[0]);
	or o4(w15, w11, w13, w14);
	and a14(q1, w15, rst);
	
	// out[0] gate logic
	and a15(q0, qBar0, rst);
	// and a15(w16, qBar1, qBar0);
	// and a16(w17, cur[3], cur[2], qBar1);
	// or o5(w18, qBar3, qBar2);
	// and a17(w19, cur[1], qBar0, w18);
	// or o6(w20, w16, w17, w19);
	// and a18(q0, w20, rst);
	
endmodule	