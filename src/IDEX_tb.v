// file: IDEX_tb.v
// author: @karimkarim
// Testbench for IDEX

`timescale 1ns/1ns

module IDEX_tb;

	//Inputs
	reg Clk = 0;
	reg [31: 0] PC_IN;
	reg [31: 0] RD1_IN;
	reg [31: 0] RD2_IN;
	reg [31: 0] IR_LO_EX_IN;
	reg [4: 0] WR1_IN;
	reg [4: 0] WR2_IN;
	reg [1: 0] WB_IN;
	reg [2: 0] MEM_IN;
	reg [3: 0] EX_IN;


	//Outputs
	wire [31: 0] PC_OUT;
	wire [31: 0] RD1_OUT;
	wire [31: 0] RD2_OUT;
	wire [31: 0] IR_LO_EX_OUT;
	wire [4: 0] WR1_OUT;
	wire [4: 0] WR2_OUT;
	wire [1: 0] WB_OUT;
	wire [2: 0] MEM_OUT;
	wire [3: 0] EX_OUT;


	//Instantiation of Unit Under Test
	IDEX uut (
		.Clk(Clk),
		.PC_IN(PC_IN),
		.RD1_IN(RD1_IN),
		.RD2_IN(RD2_IN),
		.IR_LO_EX_IN(IR_LO_EX_IN),
		.WR1_IN(WR1_IN),
		.WR2_IN(WR2_IN),
		.WB_IN(WB_IN),
		.MEM_IN(MEM_IN),
		.EX_IN(EX_IN),
		.PC_OUT(PC_OUT),
		.RD1_OUT(RD1_OUT),
		.RD2_OUT(RD2_OUT),
		.IR_LO_EX_OUT(IR_LO_EX_OUT),
		.WR1_OUT(WR1_OUT),
		.WR2_OUT(WR2_OUT),
		.WB_OUT(WB_OUT),
		.MEM_OUT(MEM_OUT),
		.EX_OUT(EX_OUT)
	);
    
    initial
        forever
            #5 Clk = ~Clk;

	initial begin
	//Wait for the reset
		#100;
		PC_IN = 5;
		RD1_IN = 2;
		RD2_IN = 31;
		IR_LO_EX_IN = 5;
		WR1_IN = 2;
		WR2_IN = 3;
		WB_IN = 3;
		MEM_IN = 4;
		EX_IN = 5;
		
		#100;
		PC_IN = 50;
		RD1_IN = 1;
		RD2_IN = 1;
		IR_LO_EX_IN = 1;
		WR1_IN = 1;
		WR2_IN = 0;
		WB_IN = 1;
		MEM_IN = 2;
		EX_IN = 9;

	end

endmodule

