// file: IFID.v
// author: @karimkarim

`timescale 1ns/1ns

module IFID(Clk, PC_IN, IR_IN, PC_OUT, IR_OUT);

input Clk;
input [31:0] PC_IN, IR_IN;

output reg [31:0] PC_OUT, IR_OUT;

always @(posedge Clk) begin
    PC_OUT <= PC_IN;
    IR_OUT <= IR_IN;
end

endmodule

