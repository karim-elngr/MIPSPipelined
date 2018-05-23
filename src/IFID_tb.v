// file: IFID_tb.v
// author: @karimkarim
// Testbench for IFID

`timescale 1ns/1ns

module IFID_tb;

	//Inputs
	reg Clk = 0;
	reg [31: 0] PC_IN;
	reg [31: 0] IR_IN;


	//Outputs
	wire [31: 0] PC_OUT;
	wire [31: 0] IR_OUT;


	//Instantiation of Unit Under Test
	IFID uut (
		.Clk(Clk),
		.PC_IN(PC_IN),
		.IR_IN(IR_IN),
		.PC_OUT(PC_OUT),
		.IR_OUT(IR_OUT)
	);

    initial
	    forever
	        #5 Clk = ~Clk;

	initial begin
	//Wait for the reset
		#100;
		
		PC_IN <= 500;
		IR_IN <= 600;
		
		#100;
		
		PC_IN <= 3100;
		IR_IN <= 62300;

	end

endmodule

