module IO(clk, reset, IOEn, RamEn, memdata, switches, leds)

	input clk, reset, IOEn, RamEn;
	input [3:0] swithes;
	input [7:0] memdata;
	
	output [7:0] leds

	always @(*)
	begin
		if(memdata[7:6] == 2'b11)
		begin
		
		end
		else
		begin
		
		end
	
	end


endmodule
