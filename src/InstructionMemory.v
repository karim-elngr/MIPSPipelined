// file: InstructionMemory.v
// author: @karimkarim

`timescale 1ns/1ns

module InstructionMemory(Clk, Address, Instruction);

input Clk;
input [31:0] Address;

output wire [31:0] Instruction;

reg [7:0] memory [0:1 << 16 - 1];

assign Instruction = {memory[Address], memory[Address+1], memory[Address+2], memory[Address+3]};


initial begin
    memory[0] = 8'hac;
    memory[1] = 8'h00;
    memory[2] = 8'h00;
    memory[3] = 8'h00;
    
    memory[0+4] = 8'h8c;
    memory[1+4] = 8'h00;
    memory[2+4] = 8'h00;
    memory[3+4] = 8'h00;
end

endmodule

