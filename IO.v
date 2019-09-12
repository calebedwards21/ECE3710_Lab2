module IO(clk, adr, en, switches, memwrite, writedata, memdata, leds);

	input clk, en, memwrite;
	input [7:0] writedata;
	input [5:0] adr;
	input [3:0] switches;
	
	output reg [7:0] leds;
	output reg[7:0] memdata;
	
	always @(posedge clk)
	begin
		if(en)
		begin
			leds <= writedata;
		end
		memdata <= {4'b0000,switches};
	
	end


endmodule
    