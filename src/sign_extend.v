// file: sign_extend.v
// author: @karimkarim

`timescale 1ns/1ns

module sign_extend(in, out);

input signed [15:0] in;

output signed [31:0] out;

assign out = in;

endmodule