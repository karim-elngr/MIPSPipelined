// file: DataMemory_tb.v
// author: @karimkarim
// Testbench for DataMemory

`timescale 1ns/1ns

module DataMemory_tb;

	//Inputs
	reg Clk = 0;
	reg [31: 0] Address;
	reg [31: 0] WriteData;
	reg MemWrite;
	reg MemRead;


	//Outputs
	wire [31: 0] ReadData;
	
	initial
	    forever
	        #5 Clk = ~Clk;


	//Instantiation of Unit Under Test
	DataMemory uut (
		.Clk(Clk),
		.Address(Address),
		.WriteData(WriteData),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.ReadData(ReadData)
	);


	initial begin
	//Inputs initialization
		Address = 50;
		WriteData = 3321;
		MemWrite = 1;
		MemRead = 0;


	//Wait for the reset
		#100;
		MemWrite = 0;
		MemRead = 1;
		WriteData = 5;

	end

endmodule

