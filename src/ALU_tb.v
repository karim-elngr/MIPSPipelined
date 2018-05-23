// file: ALU_tb.v
// author: @karimkarim
// Testbench for ALU

`timescale 1ns/1ns

module ALU_tb;

	//Inputs
	reg [31: 0] In1;
	reg [31: 0] In2;
	reg [2: 0] ALUOP;


	//Outputs
	wire [31: 0] OUT;
	wire Zero;


	//Instantiation of Unit Under Test
	ALU uut (
		.In1(In1),
		.In2(In2),
		.ALUOP(ALUOP),
		.OUT(OUT),
		.Zero(Zero)
	);


	initial begin
	//Inputs initialization
	    #100;
		In1 = 3;
		In2 = 7;
		ALUOP = 3'b000;
		
		#100;
		In1 = 5;
		In2 = 5;
		ALUOP = 3'b001;
		
		#100;
		In1 = 5;
		In2 = 10;
		ALUOP = 3'b010;
		
		#100;
		In1 = -5;
		In2 = 5;
		ALUOP = 3'b110;
		
		#100;
		In1 = 1;
		In2 = 10;
		ALUOP = 3'b111;

	end

endmodule

