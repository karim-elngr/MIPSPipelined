// file: ALU_Control_tb.v
// author: @karimkarim
// Testbench for ALU_Control

`timescale 1ns/1ns

module ALU_Control_tb;

	//Inputs
	reg [5: 0] Func;
	reg [1: 0] AluOp;


	//Outputs
	wire [2: 0] AluSig;


	//Instantiation of Unit Under Test
	ALU_Control uut (
		.Func(Func),
		.AluOp(AluOp),
		.AluSig(AluSig)
	);


	initial begin
	//Inputs initialization
	    #100;
		Func = 6'b000000;
		AluOp = 2'b00;
		
		#100;
		Func = 6'b000000;
		AluOp = 2'b01;
		
		#100;
		Func = 6'b000000;
		AluOp = 2'b10;
		
		#100;
		Func = 6'b000010;
		AluOp = 2'b10;
		
		#100;
		Func = 6'b000100;
		AluOp = 2'b10;
		
		#100;
		Func = 6'b000101;
		AluOp = 2'b10;
		
		#100;
		Func = 6'b001010;
		AluOp = 2'b10;
	end

endmodule

