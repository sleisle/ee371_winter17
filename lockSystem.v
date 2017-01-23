module lockSystem (clk, rst, innerWater, lockWater, outerWater, outputs, inputs);
	input wire clk, rst;
	input wire [6:0] inputs; // Direction, Gondola arriving, Gondola departing, Outer Port, Inner Port, Increase Water, Decrease Water
	output wire [4:0] outputs; // Gondola arriving, Gondola departing, Outer Port Status, Inner Port Status
	output wire [7:0] innerWater, outerWater;
	output reg [7:0] lockWater;
	
	wire matchOuterWater, matchInnerWater, gondolaArriving, portReadyIn, gondolaDeparting, portReadyOut;
	reg outerPortStatus, innerPortStatus, gondolaInside, gondolaArrived, gondolaInsideDirection;
	reg [3:0] gCount;
		
	compWater outerWaterCheck (matchOuterWater, outerWater, lockWater);
	compWater innerWaterCheck (matchInnerWater, innerWater, lockWater);
	assign outputs[2] = outerPortStatus; // 1 means closed
	assign outputs[3] = innerPortStatus;
	assign outputs[0] = gondolaArriving;
	assign outputs[1] = gondolaDeparting;
	assign outputs[4] = gondolaInside;
	
	assign gondolaArriving = inputs[0] & ~gondolaArrived;
	assign gondolaDeparting = gondolaInside & portReadyOut;
	assign portReadyIn = (inputs[6] & ~outerPortStatus) | (~inputs[6] & ~innerPortStatus); // 1 means from outside
	assign portReadyOut = (gondolaInsideDirection & ~innerPortStatus) | (~gondolaInsideDirection & ~outerPortStatus);
	
	assign outerWater = 8'd73;
	assign innerWater = 8'd49;
	
	always @(posedge clk) begin

		// $display("gInside: %1b, gDeparting: %1b", gondolaInside, gondolaDeparting);

		if (rst) begin
			gondolaInsideDirection = 1'bx;
			gondolaInside = 1'b0;
			gondolaArrived = 1'b0;
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
				lockWater = lockWater - ((outerWater - innerWater) / 8'd10);
			end
			
			if (matchOuterWater)
				outerPortStatus = inputs[2]; // Outer port = SW2
			if (matchInnerWater)
				innerPortStatus = inputs[3]; // Inner port = SW3
				
			if (gondolaArriving | (gCount[0] | gCount[1] | gCount[2] | gCount[3]))
				gCount = gCount + 1;
			if (gCount == 4'b1010) begin // Counter to hit five minutes
				gCount = 4'b0;
				gondolaArrived = 1'b1;
			end
			if (gondolaArrived & ~gondolaInside & portReadyIn) begin
				gondolaArrived = 1'b0;
				gondolaInside = 1'b1;
				gondolaInsideDirection = inputs[6];
			end
			if (gondolaInside & portReadyOut & inputs[1]) begin
				gondolaInside = 1'b0;
				gondolaInsideDirection = 1'bx;
			end

		end
	end

endmodule
