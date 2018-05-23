// file: ControlUnit.v
// author: @karimkarim

`timescale 1ns/1ns

module ControlUnit(OpCode, WB, MEM, EX);

input [5:0] OpCode;

output [1:0] WB;
output [2:0] MEM;
output [3:0] EX;

wire r_format, lw, sw, beq;

wire RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, AluOp0, AluOp1;

assign r_format = &(~OpCode[5:0]);
assign lw = (&OpCode[1:0]) & (&(~OpCode[4:2])) & OpCode[5];
assign sw = ~OpCode[4] & ~OpCode[2] & (&OpCode[1:0]) & OpCode[3] & OpCode[5];
assign beq = (&(~OpCode[5:3])) & (&(~OpCode[1:0])) & OpCode[2];

assign RegDst = r_format;
assign ALUSrc = lw | sw;
assign MemToReg = lw;
assign RegWrite = r_format | lw;
assign MemRead = lw;
assign MemWrite = sw;
assign Branch = beq;
assign AluOp0 = beq;
assign AluOp1 = r_format;

assign WB = {RegWrite, MemToReg};
assign MEM = {Branch, MemRead, MemWrite};
assign EX = {RegDst, AluOp1, AluOp0, ALUSrc};

endmodule

