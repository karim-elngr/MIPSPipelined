// file: ID_Integration.v
// author: @karimkarim

`timescale 1ns/1ns

module IF_Integration(Clk, PCSrc, BranchPC, if_pc_out, if_instruction_out);
    
	input Clk;
	input PCSrc;
	input [31:0] BranchPC;
    
    output [31:0] if_pc_out;
    output [31:0] if_instruction_out;
    
    wire [31:0] PCPlusFour;
    wire [31:0] PC_IN, PC_OUT;
    
    wire [31:0] instruction;
	
	MUX mux (
		.Select(PCSrc),
		.In1(PCPlusFour),
		.In2(BranchPC),
		.Out(PC_IN)
	);
	
	PC_REGISTER pc_register (
		.Clk(Clk),
		.In(PC_IN),
		.Out(PC_OUT)
	);
	
	Adder adder (
		.In1(PC_OUT),
		.In2(4),
		.Out(PCPlusFour)
	);
	
	InstructionMemory instruction_memory (
		.Clk(Clk),
		.Address(PC_OUT),
		.Instruction(instruction)
	);
	
	IFID ifid (
		.Clk(Clk),
		.PC_IN(PC_OUT),
		.IR_IN(instruction),
		.PC_OUT(if_pc_out),
		.IR_OUT(if_instruction_out)
	);
endmodule

