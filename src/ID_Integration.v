// file: ID_Integration.v
// author: @karimkarim

`timescale 1ns/1ns

module ID_Integration(Clk, PCSrc, BranchPC, RegWrite, WriteReg, WriteData, WB_OUT, MEM_OUT, EX_OUT, PC_OUT, RD1_OUT, RD2_OUT, IR_LO_EX_OUT, WR1_OUT, WR2_OUT);
    
    wire [31: 0] if_pc_out;
	wire [31: 0] if_instruction_out;
	
	wire [31: 0] RD1_IN;
	wire [31: 0] RD2_IN;
	wire [31: 0] IR_LO_EX_IN;
	wire [1: 0] WB_IN;
	wire [2: 0] MEM_IN;
	wire [3: 0] EX_IN;
	
	wire [4:0] read_register_1;
	assign read_register_1 = if_instruction_out[25:21];
	
	wire [4:0] read_register_2;
	assign read_register_2 = if_instruction_out[20:16];
	
	wire [15:0] IR_LO_EX;
	assign IR_LO_EX = if_instruction_out[15:0];
	
	wire [5:0] op_code;
	assign op_code = if_instruction_out[31:26];
	
	wire [4: 0] WR1_IN;
	assign WR1_IN = if_instruction_out[20:16];
	
	wire [4: 0] WR2_IN;
	assign WR2_IN = if_instruction_out[15:11];
	
	input Clk;
	input PCSrc;
	input [31:0] BranchPC;
	
	input RegWrite; 
	input [4:0] WriteReg; 
	input [31:0] WriteData;
	
	output [31:0] PC_OUT, RD1_OUT, RD2_OUT, IR_LO_EX_OUT;
    output [4:0] WR1_OUT, WR2_OUT;
    output [1:0] WB_OUT;
    output [2:0] MEM_OUT;
    output [3:0] EX_OUT;
    
    IF_Integration ifid (
		.Clk(Clk),
		.PCSrc(PCSrc),
		.BranchPC(BranchPC),
		.if_pc_out(if_pc_out),
		.if_instruction_out(if_instruction_out)
	);
	
	RegisterFile regfile (
		.clk(Clk),
		.register_write(RegWrite),
		.read_register_1(read_register_1),
		.read_register_2(read_register_2),
		.write_register(WriteReg),
		.write_data(WriteData),
		.read_data_1(RD1_IN),
		.read_data_2(RD2_IN)
	);
	
	sign_extend sign_ex (
		.in(IR_LO_EX),
		.out(IR_LO_EX_IN)
	);
	
	ControlUnit uut (
		.OpCode(op_code),
		.WB(WB_IN),
		.MEM(MEM_IN),
		.EX(EX_IN)
	);
	
	
	IDEX idex (
		.Clk(Clk),
		.PC_IN(if_pc_out),
		.RD1_IN(RD1_IN),
		.RD2_IN(RD2_IN),
		.IR_LO_EX_IN(IR_LO_EX_IN),
		.WR1_IN(WR1_IN),
		.WR2_IN(WR2_IN),
		.WB_IN(WB_IN),
		.MEM_IN(MEM_IN),
		.EX_IN(EX_IN),
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

endmodule

