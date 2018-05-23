// file: RegisterFile.v
// author: @karimkarim

`timescale 1ns/1ns

module RegisterFile(clk, register_write, read_register_1, read_register_2, write_register, write_data, read_data_1, read_data_2);
// Input Ports
input clk;
input register_write;
input [4:0] read_register_1;
input [4:0] read_register_2;
input [4:0] write_register;
input [31:0] write_data;

// Output Ports
output reg [31:0] read_data_1;
output reg [31:0] read_data_2;

// Internal Registers
reg [31:0] registers [0:31];

always @(posedge clk, register_write)
begin: RegisterWrite
    if(write_register > 0)
    begin
        registers[write_register] <= write_data;
    end
end

always @(read_register_1)
begin: RegisterRead1
    if(read_register_1 == 0)
        read_data_1 <= 0;
    else
        read_data_1 <= registers[read_register_1];
end

always @(read_register_2)
begin: RegisterRead2
    if(read_register_2 == 0)
        read_data_2 <= 0;
    else
        read_data_2 <= registers[read_register_2];
end

endmodule

