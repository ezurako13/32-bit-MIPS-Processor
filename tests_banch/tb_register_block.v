`timescale 1ps/1ps

module tb_register_block;
	reg regWrite;
	reg [4:0] read_register1;
	reg [4:0] read_register2;
	reg [4:0] write_register;
	reg [31:0] write_data;
	reg byteOperations;

	wire [31:0] read_data1;
	wire [31:0] read_data2;

	
	register_block registers(
		.regWrite(regWrite),
		.read_reg1(read_register1),
		.read_reg2(read_register2),
		.read_data1(read_data1),
		.read_data2(read_data2),
		.byteOperations(byteOperations),
		.write_reg(write_register),
		.write_data(write_data)
	);

	initial begin

		// read
		#200 write_register= 5'd1;
		#200 write_data= 32'b0000011111111000;
		#200 regWrite= 1'b0;
		#200 read_register1= 5'd0;
		#200 read_register2= 5'd1;

		#200 $display("\nRead from %d: %b\nRead from %d: %b", read_register1, read_data1, read_register2, read_data2);


		// write
		#200 write_register= 5'd2;
		#200 write_data= 32'b0000011111111000;
		#200 regWrite= 1'b1;
		#200 read_register1= 5'd1;
		#200 read_register2= 5'd2;
		#200 $display("\nWrite to  %d: %b", write_register, write_data);

		
		// read
		#200 write_register= 5'd1;
		#200 write_data= 32'b0000011111111111;
		#200 regWrite= 1'b0;
		#200 read_register1= 5'd2;
		#200 read_register2= 5'd0;

		#200 $display("\nRead from %d: %b\nRead from %d: %b", read_register1, read_data1, read_register2, read_data2);




	end
	

endmodule