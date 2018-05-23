// file: MUX.v
// author: @karimkarim

`timescale 1ns/1ns

module MUX #( parameter WIDTH = 32 ) (In1, In2, Select, Out);

input Select;
input [WIDTH - 1:0] In1, In2;

output [WIDTH - 1:0] Out;

assign Out = Select? In2 : In1;

endmodule

