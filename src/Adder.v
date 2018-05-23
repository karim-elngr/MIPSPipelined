// file: Adder.v
// author: @karimkarim

`timescale 1ns/1ns

module Adder(In1, In2, Out);

input [31:0] In1, In2;

output [31:0] Out;

assign Out = In1 + In2;

endmodule

