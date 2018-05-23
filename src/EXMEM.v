// file: EXMEM.v
// author: @karimkarim

`timescale 1ns/1ns

module EXMEM(Clk, WB_IN, MEM_IN, BranchPC_IN, Zero_IN, AluResult_IN, RD2_IN, WR_IN, WB_OUT, MEM_OUT, BranchPC_OUT, Zero_OUT, AluResult_OUT, RD2_OUT, WR_OUT);

input Clk;
input [1:0] WB_IN;
input [2:0] MEM_IN;

input [31:0] BranchPC_IN, AluResult_IN, RD2_IN;

input Zero_IN;
input [4:0] WR_IN;

output reg [1:0] WB_OUT;
output reg [2:0] MEM_OUT;

output reg [31:0] BranchPC_OUT, AluResult_OUT, RD2_OUT;

output reg [0:0] Zero_OUT;
output reg [4:0] WR_OUT;

always @(posedge Clk) begin
    WB_OUT <= WB_IN;
    MEM_OUT <= MEM_IN;
    BranchPC_OUT <= BranchPC_IN;
    AluResult_OUT <= AluResult_IN;
    RD2_OUT <= RD2_IN;
    Zero_OUT <= Zero_IN;
    WR_OUT <= WR_IN;
end

endmodule

