module memory_block (read_data, byteOperations, address, write_data, memRead, memWrite);
	output reg [31:0] read_data;
	
	input byteOperations; //(This is an optional signal for lb and sb operations)
	input [17:0] address;
	input [31:0] write_data;
	input memRead;
	input memWrite;


	// reg [31:0] memory [10239:0];
	reg [31:0] memory [1023:0];


	
	initial begin
		$readmemb("memory.mem", memory);
		// read_data = 32'd0;
	end
	
	always @ (posedge memWrite) begin
		// $display("\nxd\n");

		if(byteOperations == 1'b0)
			memory[address[17:2]] = write_data;
		else begin
			memory[address[17:2]] = 32'b0;
			memory[address[17:2]][address[1:0]*8 +: 8] = write_data[7:0];
		end

		$display("\n(mem block:) ");
		// $display("byteOperations = %d", byteOperations);
		if(byteOperations == 1'b0)
			$display("memory[%d] = %d", address[8:2], write_data);
		else
			$display("memory[%d:%d] = %d", address[8:2], address[1:0], write_data[7:0]);

		// memory[address[17:2]] = write_data;
		$writememb("memory.mem", memory);
		// $readmemb("registers.mem", registers);
		// $display("write_reg = %d\nwrite_data = %b", write_reg, write_data);

	end

	always @ (posedge memRead) begin
		// $display("\n(mem block:) ");
		if(byteOperations == 1'b0)
			$display("memory[%d] = %d", address[8:2], memory[address[17:2]]);
		else
			$display("memory[%d:%d] = %d", address[8:2], address[1:0], memory[address[17:2]][address[1:0]*8 +: 8]);

		if (byteOperations == 1'b0) begin
			read_data = memory[address[17:2]];
		end
		else begin
			read_data[31:8] = 24'b0;
			read_data[7:0] = memory[address[17:2]][address[1:0]*8 +: 8];
		end
		// $display("read_data = %d", read_data);
	end
	
	


endmodule
