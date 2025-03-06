`timescale 1ps/1ps

module tb_memory_block;
	reg memRead;
	reg memWrite;
	reg [17:0] address;
	reg [31:0] write_data;
	reg byteOperations;

	wire [31:0] read_data;
	
	memory_block mem(
		.address(address),
		.read_data(read_data),
		.byteOperations(byteOperations),
		.write_data(write_data),
		.memRead(memRead),
		.memWrite(memWrite)
	);


	initial begin

		// read
		#200 address= 18'd1;
		#200 write_data= 32'b0000011110111000;
		#200 memRead= 1'b1;
		#200 memWrite= 1'b0;

		#200 $display("\nRead from %d: %b", address[17:2], read_data);

		//write
		// #200 address= 18'd16;
		#200 write_data= 32'b0000000010111000;
		#200 memRead= 1'b0;
		#200 memWrite= 1'b1;

		#200 $display("\nWrite to  %d: %b", address[17:2], write_data);

		// read
		// #200 address= 18'd16;
		#200 write_data= 32'b0000011011111111;
		#200 memRead= 1'b1;
		#200 memWrite= 1'b0;

		#200 $display("\nRead from %d: %b", address[17:2], read_data);


	end
	

endmodule