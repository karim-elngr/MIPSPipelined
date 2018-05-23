// file: DataMemory.v
// author: @karimkarim

`timescale 1ns/1ns

module DataMemory(Clk, Address, WriteData, MemRead, MemWrite, ReadData);

input Clk;
input [31:0] Address;
input [31:0] WriteData;
input MemWrite, MemRead;

output reg [31:0] ReadData;

reg [7:0] data [0:1 << 16 - 1];

always @(MemRead) begin
    ReadData <= {data[Address], data[Address+1], data[Address+2], data[Address+3]};
end

always @(posedge Clk) begin
    if(MemWrite) begin
        data[0+Address] <= WriteData[31:24];
        data[1+Address] <= WriteData[23:16];
        data[2+Address] <= WriteData[15:8];
        data[3+Address] <= WriteData[7:0];
    end
end

endmodule

