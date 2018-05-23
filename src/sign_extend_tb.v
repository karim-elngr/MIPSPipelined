// file: sign_extend_tb.v
// author: @karimkarim
// Testbench for sign_extend

`timescale 1ns/1ns

module sign_extend_tb;

	//Inputs
	reg [15:0] in;


	//Outputs
	wire [31:0] out;


	//Instantiation of Unit Under Test
	sign_extend uut (
		.in(in),
		.out(out)
	);


	initial begin
	//Wait for the reset
		#100;
		in = 550;
		
		#100;
		in = -1;
		
		#100;
		in = 0;
        
	end

endmodule

