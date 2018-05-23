// file: MUX_tb.v
// author: @karimkarim
// Testbench for MUX

`timescale 1ns/1ns

module MUX_tb;

	//Inputs
	reg Select;
	reg [31: 0] In1;
	reg [31: 0] In2;


	//Outputs
	wire [31: 0] Out;


	//Instantiation of Unit Under Test
	MUX uut (
		.Select(Select),
		.In1(In1),
		.In2(In2),
		.Out(Out)
	);


	initial begin
	//Wait for the reset
		#100;
		Select <= 1;
		In1 <= 50;
		In2 <= 10;

	end

endmodule

