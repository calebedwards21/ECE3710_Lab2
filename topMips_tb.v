`timescale 1ns/1ps

module topMips_tb();

	//inputs
	reg clk;
	reg reset;
	
	//outputs
	wire memread;
	
	topMips #(8) UUT(.clk(clk), .reset(reset), .memread(memread));
	
	initial begin
		clk = 0;
		reset = 1;
		#22;
		reset = 0;
		#22;
	end
	
	always #10 clk = ~clk;
	
//	always @(negedge clk)
//	begin
//		if(UUT.memwrite)
//			if(UUT.adr == 8'd255 & UUT.writedata == 8'h0d)
//				$display("fibonacci works");
//			else
//				$display("wrong value written to address 255 : %h", UUT.writedata);
//	end


endmodule
