// file: MEM_Integration.v
// author: @karimkarim

`timescale 1ns/1ns

module MEM_Integration(Clk, EX_RegWrite, EX_WriteReg, EX_WriteData, WB_OUT, READ_DATA_OUT, ALU_RESULT_OUT, WRITE_REG_OUT);

input Clk;

reg EX_PCSrc = 0;
wire [31: 0] EX_BranchPC;

input EX_RegWrite;
input [4: 0] EX_WriteReg;
input [31: 0] EX_WriteData;

output [1:0] WB_OUT; 
output [31:0] READ_DATA_OUT, ALU_RESULT_OUT;
output [4:0] WRITE_REG_OUT;

wire [1: 0] EX_WB_OUT;
wire [2: 0] EX_MEM_OUT;
wire [31: 0] EX_BranchPC_OUT;
wire EX_Zero_OUT;
wire [31: 0] EX_AluResult_OUT;
wire [31: 0] EX_RD2_OUT;
wire [4: 0] EX_WR_OUT;

wire [31:0] readDataWire;

always @(posedge Clk) begin
    if(EX_MEM_OUT[2] && EX_Zero_OUT)
        EX_PCSrc <= 1;
    else
        EX_PCSrc <= 0;
end

EX_Integration ex (
		.Clk(Clk),
		.PCSrc(EX_PCSrc),
		.BranchPC(EX_BranchPC_OUT),
		.RegWrite(EX_RegWrite),
		.WriteReg(EX_WriteReg),
		.WriteData(EX_WriteData),
		.WB_OUT(EX_WB_OUT),
		.MEM_OUT(EX_MEM_OUT),
		.BranchPC_OUT(EX_BranchPC_OUT),
		.Zero_OUT(EX_Zero_OUT),
		.AluResult_OUT(EX_AluResult_OUT),
		.RD2_OUT(EX_RD2_OUT),
		.WR_OUT(EX_WR_OUT)
	);
	
DataMemory dm (
		.Clk(Clk),
		.Address(EX_AluResult_OUT),
		.WriteData(EX_RD2_OUT),
		.MemWrite(EX_MEM_OUT[0]),
		.MemRead(EX_MEM_OUT[1]),
		.ReadData(readDataWire)
	);
	
MEMWB memwb (
		.Clk(Clk),
		.WB(EX_WB_OUT),
		.ReadData(readDataWire),
		.AluResult(EX_RD2_OUT),
		.WriteReg(EX_WR_OUT),
		.WB_OUT(WB_OUT),
		.ReadData_OUT(READ_DATA_OUT),
		.AluResult_OUT(ALU_RESULT_OUT),
		.WriteReg_OUT(WRITE_REG_OUT)
	);

endmodule

