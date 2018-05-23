// file: ControlUnit_tb.v
// author: @karimkarim
// Testbench for ControlUnit

`timescale 1ns/1ns

module ControlUnit_tb;

	//Inputs
	reg [5: 0] OpCode;


	//Outputs
	wire [1: 0] WB;
	wire [2: 0] MEM;
	wire [3: 0] EX;


	//Instantiation of Unit Under Test
	ControlUnit uut (
		.OpCode(OpCode),
		.WB(WB),
		.MEM(MEM),
		.EX(EX)
	);


	initial begin
	//Wait for the reset
		#100;
		OpCode = 6'b100011; // LW
		
		#100;
		OpCode = 6'b101011; // SW
		
		#100;
		OpCode = 6'b000100; // BEQ
		
		#100;
		OpCode = 6'b000000; // R-Format
	end

endmodule

