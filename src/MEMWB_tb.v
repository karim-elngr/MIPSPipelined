// file: MEMWB_tb.v
// author: @karimkarim
// Testbench for MEMWB

`timescale 1ns/1ns

module MEMWB_tb;

	//Inputs
	reg Clk = 0;
	reg [1: 0] WB;
	reg [31: 0] ReadData;
	reg [31: 0] AluResult;
	reg [4: 0] WriteReg;


	//Outputs
	wire [1: 0] WB_OUT;
	wire [31: 0] ReadData_OUT;
	wire [31: 0] AluResult_OUT;
	wire [4: 0] WriteReg_OUT;


	//Instantiation of Unit Under Test
	MEMWB uut (
		.Clk(Clk),
		.WB(WB),
		.ReadData(ReadData),
		.AluResult(AluResult),
		.WriteReg(WriteReg),
		.WB_OUT(WB_OUT),
		.ReadData_OUT(ReadData_OUT),
		.AluResult_OUT(AluResult_OUT),
		.WriteReg_OUT(WriteReg_OUT)
	);
	
	initial
	    forever
	        #5 Clk = ~Clk;


	initial begin
	//Inputs initialization
	    #100
		WB = 0;
		ReadData = 0;
		AluResult = 0;
		WriteReg = 0;
		
		#100
		WB = 01;
		ReadData = 01;
		AluResult = 01;
		WriteReg = 01;
		
		#100
		WB = 02;
		ReadData = 02;
		AluResult = 02;
		WriteReg = 02;


	end

endmodule

