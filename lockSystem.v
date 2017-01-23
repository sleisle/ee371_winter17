module lockSystem (clk, rst, innerWater, lockWater, outerWater, outputs, inputs);
	input wire clk, rst;
	input wire [6:0] inputs; // Gondola arriving, Gondola departing, Outer Port, Inner Port, Increase Water, Decrease Water
	output wire [3:0] outputs; // Gondola arriving, Gondola departing, Outer Port Status, Inner Port Status
	output wire [7:0] innerWater, outerWater;
	output reg [7:0] lockWater;
	
	wire matchOuterWater, matchInnerWater, gondolaArriving, portReady;
	reg outerPortStatus, innerPortStatus, gondolaInside, gondolaArrived;
	reg [3:0] gCount;
		
	compWater outerWaterCheck (matchOuterWater, outerWater, lockWater);
	compWater innerWaterCheck (matchInnerWater, innerWater, lockWater);
	assign outputs[2] = outerPortStatus; // 1 means closed
	assign outputs[3] = innerPortStatus;
	
	assign gondolaArriving = inputs[0] & ~gondolaArrived;
	assign portReady = (inputs[6] & ~outerPortStatus) | (~inputs[6] & ~innerPortStatus);
	
	assign outerWater = 8'd73;
	assign innerWater = 8'd49;
	
	always @(posedge clk) begin
		if (rst) begin
			lockWater = 8'd52;
			outerPortStatus = 1'b1;
			innerPortStatus = 1'b1;
			gCount = 4'b0;
		end
		else begin
			if (inputs[4] & outerPortStatus & innerPortStatus) begin // Increase Water
				lockWater = lockWater + ((outerWater - innerWater) / 8'd12);
			end
			else if (inputs[5] & outerPortStatus & innerPortStatus) begin // Decrease Water
				lockWater = lockWater - ((outerWater - innerWater) / 8'd14);
			end
			
			if (matchOuterWater)
				outerPortStatus = inputs[2]; // Outer port = SW2
			if (matchInnerWater)
				innerPortStatus = inputs[3]; // Inner port = SW3
				
			if (gondolaArriving | (gCount[0] | gCount[1] | gCount[2] | gCount[3]))
				gCount = gCount + 1;
			if (gCount == 4'b1001) begin // Counter to hit five minutes
				gCount = 4'b0;
				gondolaArrived = 1'b1;
			end
			if (gondolaArrived & ~gondolaInside & portReady) begin
				gondolaArrived = 1'b0;
				gondolaInside = 1'b1;
			end

		end
	end

endmodule
