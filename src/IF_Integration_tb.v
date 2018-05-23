// file: IF_Integration_tb.v
// author: @karimkarim
// Testbench for IF_Integration

`timescale 1ns/1ns

module IF_Integration_tb;

	//Inputs
	reg Clk = 0;
	reg PCSrc;
	reg [31: 0] BranchPC;


	//Outputs
	wire [31: 0] if_pc_out;
	wire [31: 0] if_instruction_out;


	//Instantiation of Unit Under Test
	IF_Integration uut (
		.Clk(Clk),
		.PCSrc(PCSrc),
		.BranchPC(BranchPC),
		.if_pc_out(if_pc_out),
		.if_instruction_out(if_instruction_out)
	);
	
	initial
	    forever
	        #5 Clk = ~Clk;

	initial begin
	//Inputs initialization
		PCSrc = 0;
		BranchPC = 0;
	end

endmodule

