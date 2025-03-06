module instruction_block (instruction, pc);
	output [31:0] instruction;
	input [31:0] pc;


	reg [31:0] instruction_memory [1023:0];
	

	initial begin
		$readmemb("instructions.mem", instruction_memory);
	end

	// always @(pc) begin
	assign	instruction = instruction_memory[pc[11:2]];
	// end

endmodule 