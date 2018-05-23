// file: InstructionMemory_tb.v
// author: @karimkarim
// Testbench for InstructionMemory

`timescale 1ns/1ns

module InstructionMemory_tb;

	//Inputs
	reg Clk = 0;
	reg [31: 0] Address;


	//Outputs
	wire [31: 0] Instruction;


	//Instantiation of Unit Under Test
	InstructionMemory uut (
		.Clk(Clk),
		.Address(Address),
		.Instruction(Instruction)
	);

    initial begin
      $dumpfile("InstructionMemory_tb.vcd");
      $dumpvars(0,InstructionMemory_tb);
    end

    initial
	    forever
	        #5 Clk = ~Clk;

	initial begin
	//Inputs initialization
	    #100;
		Address = 0;

	//Wait for the reset
		#100;
		Address = 4;
		
		#100;
		Address = 8;
	end

endmodule

