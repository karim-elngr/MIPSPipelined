// file: WB_Integration_tb.v
// author: @karimkarim
// Testbench for WB_Integration

`timescale 1ns/1ns

module WB_Integration_tb;

	//Inputs
	reg Clk = 0;

	//Instantiation of Unit Under Test
	WB_Integration uut (
		.Clk(Clk)
	);

	initial
	    forever
	        #5 Clk = ~Clk;

endmodule

