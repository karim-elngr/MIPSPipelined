// file: IDEX.v
// author: @karimkarim

`timescale 1ns/1ns

module IDEX(Clk, WB_IN, MEM_IN, EX_IN, PC_IN, RD1_IN, RD2_IN, IR_LO_EX_IN, WR1_IN, WR2_IN, WB_OUT, MEM_OUT, EX_OUT, PC_OUT, RD1_OUT, RD2_OUT, IR_LO_EX_OUT, WR1_OUT, WR2_OUT);
    
input Clk;

input [31:0] PC_IN, RD1_IN, RD2_IN, IR_LO_EX_IN;
input [4:0] WR1_IN, WR2_IN;
input [1:0] WB_IN;
input [2:0] MEM_IN;
input [3:0] EX_IN;

output reg [31:0] PC_OUT, RD1_OUT, RD2_OUT, IR_LO_EX_OUT;
output reg [4:0] WR1_OUT, WR2_OUT;
output reg [1:0] WB_OUT;
output reg [2:0] MEM_OUT;
output reg [3:0] EX_OUT;

always @(posedge Clk) begin
    PC_OUT <= PC_IN;
    RD1_OUT <= RD1_IN;
    RD2_OUT <= RD2_IN;
    IR_LO_EX_OUT <= IR_LO_EX_IN;
    WR1_OUT <= WR1_IN;
    WR2_OUT <= WR2_IN;
    WB_OUT <= WB_IN;
    MEM_OUT <= MEM_IN;
    EX_OUT <= EX_IN;
end

endmodule

