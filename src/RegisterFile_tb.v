// file: RegisterFile_tb.v
// author: @karimkarim
// Testbench for RegisterFile

`timescale 1ns/1ns

module RegisterFile_tb;

	//Inputs
	reg clk;
	reg register_write;
	reg [4: 0] read_register_1;
	reg [4: 0] read_register_2;
	reg [4: 0] write_register;
	reg [31: 0] write_data;

	//Outputs
	wire [31: 0] read_data_1;
	wire [31: 0] read_data_2;

	//Instantiation of Unit Under Test
	RegisterFile uut (
		.clk(clk),
		.register_write(register_write),
		.read_register_1(read_register_1),
		.read_register_2(read_register_2),
		.write_register(write_register),
		.write_data(write_data),
		.read_data_1(read_data_1),
		.read_data_2(read_data_2)
	);
	
	initial begin
	    #1  clk = 0;
	    forever begin
	        #5  clk =  ! clk;
	    end
    end 

	initial begin
	//Inputs initialization
		clk = 0;
		register_write = 0;
		read_register_1 = 0;
		read_register_2 = 0;
		write_register = 0;
		write_data = 0;

	//Wait for the reset
		#100;

    //Write Register 1
        register_write = 1;
        write_register = 1;
        write_data = 32'hFFDDABCC;
    
    // Wait for write to complete
        #100;
        
    // Stop writing
        register_write = 0;
        write_register = 0;
        write_data = 0;
    
    //Read Register 1
        read_register_1 = 1;
	end

endmodule