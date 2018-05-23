// file: PCRegister_tb.v
// author: @karimkarim
// Testbench for PC_REGISTER

`timescale 1ns/1ns

module PCRegister_tb;

	//Inputs
	reg Clk = 0;
	reg [31: 0] In;


	//Outputs
	wire [31: 0] Out;


	//Instantiation of Unit Under Test
	PC_REGISTER uut (
		.Clk(Clk),
		.In(In),
		.Out(Out)
	);
	
	initial
	    forever
	        #5 Clk = ~Clk;

	initial begin
	//Inputs initialization
		In <= 0;

	//Wait for the reset
		#100;
		In <= 200;
		
		#200;
		In <= 300;

	end

endmodule

