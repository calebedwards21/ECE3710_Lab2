module topMips #(parameter WIDTH = 8)
					(clk, reset, switches, en, memread, leds);
	
	input clk,reset,en;
	input [3:0] switches;
	
	output memread;
	output [WIDTH-1:0] leds;
	
	wire memwrite;
	wire [WIDTH-1:0] adr, writedata, memdata0, memdata1, memdata;
	
	mips #(8,3) U1(.clk(clk), .reset(reset), .memdata(memdata), .memwrite(memwrite), 
						.adr(adr), .writedata(writedata), .memread(memread));
						
	exmem #(8,8) U2(.clk(~clk), .memwrite(memwrite), .en(~(adr[7] & adr[6])), .adr(adr), 
						 .writedata(writedata), .memdata(memdata0));
						 
	IO U3(.clk(clk), .en(adr[7] & adr[6]), .adr(adr[5:0]), .switches(switches), 
			.memdata(memdata1), .leds(leds)); 
			
	mux2to1 #(8) U4(.d0(memdata0), .d1(memdata1), .s(adr[7] & adr[6]), .y(memdata));
	
	
endmodule
