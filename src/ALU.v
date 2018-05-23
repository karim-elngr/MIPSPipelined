// file: ALU.v
// author: @karimkarim

`timescale 1ns/1ns

module ALU(In1, In2, ALUOP, OUT, Zero);
// Input Ports
input [31:0] In1, In2; 
input [2:0] ALUOP;

// Output Ports
output [31:0] OUT;
output Zero;

assign Zero = In1 == In2;

wire [31:0] add, sub, and0, or0, lt;
assign add = In1 + In2;
assign sub = In1 - In2;
assign and0 = In1 & In2;
assign or0 = In1 | In2;
assign lt = In1 < In2;

wire [31:0] alu_table [7: 0];
assign alu_table[3'b000] = and0;
assign alu_table[3'b001] = or0;
assign alu_table[3'b010] = add;
assign alu_table[3'b110] = sub;
assign alu_table[3'b111] = lt;

assign OUT = alu_table[ALUOP];

endmodule

