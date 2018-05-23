// file: ALU_Control.v
// author: @karimkarim

`timescale 1ns/1ns

module ALU_Control(Func, AluOp, AluSig);

input [5:0] Func;
input [1:0] AluOp;

output [2:0] AluSig;

wire AluSig0, AluSig1, AluSig2;

assign AluSig0 = AluOp[1] & (Func[3] | Func[0]);
assign AluSig1 = (~AluOp[1]) | (~Func[2]);
assign AluSig2 = AluOp[0] | (AluOp[1] & Func[1]);

assign AluSig = {AluSig2, AluSig1, AluSig0};

endmodule

