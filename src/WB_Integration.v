// file: WB_Integration.v
// author: @karimkarim

`timescale 1ns/1ns

module WB_Integration(Clk);

input Clk;
wire EX_RegWrite;
assign EX_RegWrite = WB_OUT[1];

wire write_data_mux_select;
assign write_data_mux_select = WB_OUT[0];

wire [31: 0] EX_WriteData;
wire [1: 0] WB_OUT;
wire [31: 0] READ_DATA_OUT;
wire [31: 0] ALU_RESULT_OUT;
wire [4: 0] WRITE_REG_OUT;

MUX write_data_mux (
		.Select(write_data_mux_select),
		.In1(READ_DATA_OUT),
		.In2(ALU_RESULT_OUT),
		.Out(EX_WriteData)
	);

MEM_Integration mem (
		.Clk(Clk),
		.EX_RegWrite(EX_RegWrite),
		.EX_WriteReg(WRITE_REG_OUT),
		.EX_WriteData(EX_WriteData),
		.WB_OUT(WB_OUT),
		.READ_DATA_OUT(READ_DATA_OUT),
		.ALU_RESULT_OUT(ALU_RESULT_OUT),
		.WRITE_REG_OUT(WRITE_REG_OUT)
	);
	
endmodule

