// file: Adder_tb.v
// author: @karimkarim
// Testbench for Adder

`timescale 1ns/1ns

module Adder_tb;

	//Inputs
	reg [31: 0] In1;
	reg [31: 0] In2;


	//Outputs
	wire [31: 0] Out;


	//Instantiation of Unit Under Test
	Adder uut (
		.In1(In1),
		.In2(In2),
		.Out(Out)
	);


	initial begin
	//Wait for the reset
		#100;
		In1 = 50;
		In2 = 70;

	end

endmodule

