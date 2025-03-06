module register_block (regWrite, read_reg1, read_reg2, read_data1, read_data2, byteOperations, write_reg, write_data, clk, regDst);
	input regWrite;
	input [4:0] read_reg1;
	input [4:0] read_reg2;
	output [31:0] read_data1;
	output [31:0] read_data2;

	input byteOperations; // (This is an optional signal for lb and sb operations)
	input [4:0] write_reg;
	input signed [31:0] write_data;

	input clk;
	input regDst;


	reg [31:0] registers [31:0];

	initial begin
		$readmemb("registers.mem", registers);
	end
	assign read_data1 = registers[read_reg1];
	assign read_data2 = registers[read_reg2];

	// initial begin
	// 	// $display("\ninitial:");

	// 	read_data1 = 32'b0;
	// 	read_data2 = 32'b0;
	// 	$display("clk: rs[%d] = %d", read_reg1, read_data1);
	// 	$display("clk: rt[%d] = %d", read_reg2, read_data2);
		
	// end

	// always @ (posedge clk, posedge read_reg1, posedge read_reg2) begin
	// 	$display("\nalways (clk: %d, reg1: %d, reg2: %d):", clk, read_reg1, read_reg2);

	// 	read_data1 = registers[read_reg1];
	// 	read_data2 = registers[read_reg2];
	// 	$display("clk: rs[%d] = %d", read_reg1, read_data1);
	// 	$display("clk: rt[%d] = %d", read_reg2, read_data2);

	// end

	always @ (negedge clk) begin
		
		$display("rs[%d] = %d", read_reg1, read_data1);
		if(regDst == 1'b1)
			$display("rt[%d] = %d", read_reg2, read_data2);
	end

	
	always @ (posedge regWrite) begin
		$display("\n(reg block write:)");
		// $display("write_reg = %d   write_data = %d   regWrite=%d", write_reg, write_data, regWrite);
		registers[write_reg] = write_data;
		$writememb("registers.mem", registers);
		// $readmemb("registers.mem", registers);
		if(regDst == 1'b1)
			$display("rd[%d] = %d", write_reg, write_data);
		else
			$display("rt[%d] = %d", write_reg, write_data);

	end
	
	


endmodule 