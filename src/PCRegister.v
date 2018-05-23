// file: PCRegister.v
// author: @karimkarim

`timescale 1ns/1ns

module PC_REGISTER(Clk, In, Out);

input Clk;
input [31:0] In;

output reg [31:0] regval = 0;

output [31:0] Out;
assign Out = regval;

always @(posedge Clk) begin
    regval <= In;
end

endmodule

