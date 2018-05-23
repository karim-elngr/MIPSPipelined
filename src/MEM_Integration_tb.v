// file: MEM_Integration_tb.v
// author: @karimkarim
// Testbench for MEM_Integration

`timescale 1ns/1ns

module MEM_Integration_tb;

	//Inputs
	reg Clk = 0;
	reg EX_RegWrite;
	reg [4: 0] EX_WriteReg;
	reg [31: 0] EX_WriteData;


	//Outputs
	wire [1: 0] WB_OUT;
	wire [31: 0] READ_DATA_OUT;
	wire [31: 0] ALU_RESULT_OUT;
	wire [4: 0] WRITE_REG_OUT;


	//Instantiation of Unit Under Test
	MEM_Integration uut (
		.Clk(Clk),
		.EX_RegWrite(EX_RegWrite),
		.EX_WriteReg(EX_WriteReg),
		.EX_WriteData(EX_WriteData),
		.WB_OUT(WB_OUT),
		.READ_DATA_OUT(READ_DATA_OUT),
		.ALU_RESULT_OUT(ALU_RESULT_OUT),
		.WRITE_REG_OUT(WRITE_REG_OUT)
	);
	
	initial
	    forever
	        #5 Clk = ~Clk;

endmodule

