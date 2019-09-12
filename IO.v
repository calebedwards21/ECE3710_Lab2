module IO(clk, IOEn, memdata, leds);

	input clk, IOEn;
	input [7:0] memdata;
	
	output reg [7:0] leds;

	always @(posedge clk)
	begin
		if(IOEn)
		begin
			leds <= memdata;
		end
		else
		begin
			leds <= 8'b00000000;
		end
	
	end


endmodule
