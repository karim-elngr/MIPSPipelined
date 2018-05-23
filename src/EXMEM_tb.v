// file: EXMEM_tb.v
// author: @karimkarim
// Testbench for EXMEM

`timescale 1ns/1ns

module EXMEM_tb;

	//Inputs
	reg Clk = 0;
	reg [1: 0] WB_IN;
	reg [2: 0] MEM_IN;
	reg [31: 0] BranchPC_IN;
	reg [31: 0] AluResult_IN;
	reg [31: 0] RD2_IN;
	reg Zero_IN;
	reg [4: 0] WR_IN;


	//Outputs
	wire [1: 0] WB_OUT;
	wire [2: 0] MEM_OUT;
	wire [31: 0] BranchPC_OUT;
	wire [31: 0] AluResult_OUT;
	wire [31: 0] RD2_OUT;
	wire [0: 0] Zero_OUT;
	wire [4: 0] WR_OUT;


	//Instantiation of Unit Under Test
	EXMEM uut (
		.Clk(Clk),
		.WB_IN(WB_IN),
		.MEM_IN(MEM_IN),
		.BranchPC_IN(BranchPC_IN),
		.AluResult_IN(AluResult_IN),
		.RD2_IN(RD2_IN),
		.Zero_IN(Zero_IN),
		.WR_IN(WR_IN),
		.WB_OUT(WB_OUT),
		.MEM_OUT(MEM_OUT),
		.BranchPC_OUT(BranchPC_OUT),
		.AluResult_OUT(AluResult_OUT),
		.RD2_OUT(RD2_OUT),
		.Zero_OUT(Zero_OUT),
		.WR_OUT(WR_OUT)
	);
	
	initial
	    forever
	        #5 Clk = ~Clk;


	initial begin
	//Inputs initialization
	    #100;
		WB_IN = 0;
		MEM_IN = 0;
		BranchPC_IN = 0;
		AluResult_IN = 0;
		RD2_IN = 0;
		Zero_IN = 0;
		WR_IN = 0;
		
		#100;
		WB_IN = 1;
		MEM_IN = 1;
		BranchPC_IN = 0;
		AluResult_IN = 0;
		RD2_IN = 1;
		Zero_IN = 0;
		WR_IN = 0;
		
		#100;
		WB_IN = 0;
		MEM_IN = 1;
		BranchPC_IN = 5;
		AluResult_IN = -50;
		RD2_IN = 1;
		Zero_IN = 0;
		WR_IN = 0;
		
		#100;
		WB_IN = 0;
		MEM_IN = 0;
		BranchPC_IN = 0;
		AluResult_IN = 0;
		RD2_IN = 0;
		Zero_IN = 0;
		WR_IN = 0;
		

	end

endmodule

