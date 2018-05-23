// file: MEMWB.v
// author: @karimkarim

`timescale 1ns/1ns

module MEMWB(Clk, WB, ReadData, AluResult, WriteReg, WB_OUT, ReadData_OUT, AluResult_OUT, WriteReg_OUT);

input Clk;
input [1:0] WB;
input [31:0] ReadData, AluResult;
input [4:0] WriteReg;

output reg [1:0] WB_OUT;
output reg [31:0] ReadData_OUT, AluResult_OUT;
output reg [4:0] WriteReg_OUT;

always @(posedge Clk) begin
    WB_OUT <= WB;
    ReadData_OUT <= ReadData;
    AluResult_OUT <= AluResult;
    WriteReg_OUT <= WriteReg;
end

endmodule

