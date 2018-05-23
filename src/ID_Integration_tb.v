// file: ID_Integration_tb.v
// author: @karimkarim
// Testbench for ID_Integration

`timescale 1ns/1ns

module ID_Integration_tb;

	//Inputs
	reg Clk = 0;
	reg PCSrc;
	reg [31: 0] BranchPC;
	reg RegWrite;
	reg [4: 0] WriteReg;
	reg [31: 0] WriteData;


	//Outputs
	wire [31: 0] PC_OUT;
	wire [31: 0] RD1_OUT;
	wire [31: 0] RD2_OUT;
	wire [31: 0] IR_LO_EX_OUT;
	wire [4: 0] WR1_OUT;
	wire [4: 0] WR2_OUT;
	wire [1: 0] WB_OUT;
	wire [2: 0] MEM_OUT;
	wire [3: 0] EX_OUT;


	//Instantiation of Unit Under Test
	ID_Integration uut (
		.Clk(Clk),
		.PCSrc(PCSrc),
		.BranchPC(BranchPC),
		.RegWrite(RegWrite),
		.WriteReg(WriteReg),
		.WriteData(WriteData),
		.PC_OUT(PC_OUT),
		.RD1_OUT(RD1_OUT),
		.RD2_OUT(RD2_OUT),
		.IR_LO_EX_OUT(IR_LO_EX_OUT),
		.WR1_OUT(WR1_OUT),
		.WR2_OUT(WR2_OUT),
		.WB_OUT(WB_OUT),
		.MEM_OUT(MEM_OUT),
		.EX_OUT(EX_OUT)
	);

    initial
        forever
            #5 Clk = ~Clk;

	initial begin
	//Inputs initialization
		PCSrc = 0;
		BranchPC = 0;
		RegWrite = 0;
		WriteReg = 0;
		WriteData = 0;
	end

endmodule

