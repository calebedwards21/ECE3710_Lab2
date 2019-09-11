module topMips #(parameter WIDTH = 8)
					(clk, reset, memread);
	
	input clk,reset;
	
	output memread;
	
	wire memwrite;
	wire [WIDTH-1:0] adr, writedata, memdata;
	
	mips #(8,3) U1(.clk(clk), .reset(reset), .memdata(memdata), .memwrite(memwrite), .adr(adr), .writedata(writedata), .memread(memread));
	exmem #(8,8) U2(.clk(~clk), .memwrite(memwrite), .en(1'b1), .adr(adr), .writedata(writedata), .memdata(memdata));

endmodule
