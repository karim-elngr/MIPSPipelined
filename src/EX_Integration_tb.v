// file: EX_Integration_tb.v
// author: @karimkarim
// Testbench for EX_Integration

`timescale 1ns/1ns

module EX_Integration_tb;

	//Inputs
	reg Clk = 0;
	reg PCSrc;
	reg [31: 0] BranchPC;
	reg RegWrite;
	reg [4: 0] WriteReg;
	reg [31: 0] WriteData;


	//Outputs
	wire [1: 0] WB_OUT;
	wire [2: 0] MEM_OUT;
	wire [31: 0] BranchPC_OUT;
	wire Zero_OUT;
	wire [31: 0] AluResult_OUT;
	wire [31: 0] RD2_OUT;
	wire [4: 0] WR_OUT;


	//Instantiation of Unit Under Test
	EX_Integration uut (
		.Clk(Clk),
		.PCSrc(PCSrc),
		.BranchPC(BranchPC),
		.RegWrite(RegWrite),
		.WriteReg(WriteReg),
		.WriteData(WriteData),
		.WB_OUT(WB_OUT),
		.MEM_OUT(MEM_OUT),
		.BranchPC_OUT(BranchPC_OUT),
		.Zero_OUT(Zero_OUT),
		.AluResult_OUT(AluResult_OUT),
		.RD2_OUT(RD2_OUT),
		.WR_OUT(WR_OUT)
	);
	
	initial
	    forever
	        #5 Clk = ~Clk;


	initial begin
	//Inputs initialization
		Clk = 0;
		PCSrc = 0;
		BranchPC = 0;
		RegWrite = 0;
		WriteReg = 0;
		WriteData = 0;
	end

endmodule

