// file: EX_Integration.v
// author: @karimkarim

`timescale 1ns/1ns

module EX_Integration(Clk, PCSrc, BranchPC, RegWrite, WriteReg, WriteData, WB_OUT, MEM_OUT, BranchPC_OUT, Zero_OUT, AluResult_OUT, RD2_OUT, WR_OUT);

input Clk;
input PCSrc;
input [31: 0] BranchPC;
input RegWrite;
input [4: 0] WriteReg;
input [31: 0] WriteData;

// ID Outputs
wire [31: 0] ID_PC_OUT;
wire [31: 0] ID_RD1_OUT;
wire [31: 0] ID_RD2_OUT;
wire [31: 0] ID_IR_LO_EX_OUT;
wire [4: 0] ID_WR1_OUT;
wire [4: 0] ID_WR2_OUT;
wire [1: 0] ID_WB_OUT;
wire [2: 0] ID_MEM_OUT;
wire [3: 0] ID_EX_OUT;

// MUX WR Output
wire [4:0] WR_MUX_OUT;

// ID_IR_LO_EX_OUT lesat significant 6 bits
wire [5:0] func;
assign func = ID_IR_LO_EX_OUT[5:0];

// wire ALU_SIG_OUT
wire [2:0] ALU_SIG_OUT;

// ALU_IN_2
wire [31:0] ALU_IN_2;

// Wires for ALU
wire Zero_ALU_OUT;
wire [31:0] Result_ALU_OUT;

// Branch offset
wire [31:0] BranchOffset;
assign BranchOffset = ID_IR_LO_EX_OUT << 2;

// BranchPC calculation wires
wire[31:0] BranchPCWire;
assign BranchPCWire = ID_PC_OUT + BranchOffset;

// Outputs
output [1:0] WB_OUT;
output [2:0] MEM_OUT;
output [31:0] BranchPC_OUT;
output Zero_OUT;
output [31:0] AluResult_OUT;
output [31:0] RD2_OUT;
output [4:0] WR_OUT;

ID_Integration id (
		.Clk(Clk),
		.PCSrc(PCSrc),
		.BranchPC(BranchPC),
		.RegWrite(RegWrite),
		.WriteReg(WriteReg),
		.WriteData(WriteData),
		.PC_OUT(ID_PC_OUT),
		.RD1_OUT(ID_RD1_OUT),
		.RD2_OUT(ID_RD2_OUT),
		.IR_LO_EX_OUT(ID_IR_LO_EX_OUT),
		.WR1_OUT(ID_WR1_OUT),
		.WR2_OUT(ID_WR2_OUT),
		.WB_OUT(ID_WB_OUT),
		.MEM_OUT(ID_MEM_OUT),
		.EX_OUT(ID_EX_OUT)
	);
	

MUX #(.WIDTH(5)) wr_mux (
		.Select(ID_EX_OUT[3]),
		.In1(ID_WR1_OUT),
		.In2(ID_WR2_OUT),
		.Out(WR_MUX_OUT)
	);
	
MUX alu_in_2_mux (
        .Select(ID_EX_OUT[0]),
        .In1(ID_RD2_OUT),
        .In2(ID_IR_LO_EX_OUT),
        .Out(ALU_IN_2)
    );
	
ALU_Control aluc (
		.Func(func),
		.AluOp(ID_EX_OUT[2:1]),
		.AluSig(ALU_SIG_OUT)
	);
	
ALU alu (
		.In1(ID_RD1_OUT),
		.In2(ALU_IN_2),
		.ALUOP(ALU_SIG_OUT),
		.OUT(Result_ALU_OUT),
		.Zero(Zero_ALU_OUT)
	);
	
EXMEM exmem (
		.Clk(Clk),
		.WB_IN(ID_WB_OUT),
		.MEM_IN(ID_MEM_OUT),
		.BranchPC_IN(BranchPCWire),
		.AluResult_IN(Result_ALU_OUT),
		.RD2_IN(ID_RD2_OUT),
		.Zero_IN(Zero_ALU_OUT),
		.WR_IN(WR_MUX_OUT),
		.WB_OUT(WB_OUT),
		.MEM_OUT(MEM_OUT),
		.BranchPC_OUT(BranchPC_OUT),
		.AluResult_OUT(AluResult_OUT),
		.RD2_OUT(RD2_OUT),
		.Zero_OUT(Zero_OUT),
		.WR_OUT(WR_OUT)
	);

endmodule

