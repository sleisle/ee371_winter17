`include "convertToDisp.v"

module compWaterTest;
	wire [7:0] out;
	reg [7:0] in;
	
	convertToDisp dut(out, in);
		
	initial begin
		in <= 'd10;
		#10;
		$display("%8b", out);
		in <= 'd43;
		#10
		$display("%8b", out);
		in <= 'd99;
		#10
		$display("%8b", out);
		
		
		$dumpvars(1, dut);
		$stop;
	end
endmodule