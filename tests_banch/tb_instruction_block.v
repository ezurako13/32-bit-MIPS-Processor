`timescale 1ps/1ps

module tb_instruction_block;
	reg [31:0] pc;

	wire [31:0] instruction;

	
	instruction_block inst(
		.instruction(instruction),
		.pc(pc)
	);

	initial begin

		// read
		#200 pc = 32'd16;
		#200 $display("\nRead from %d: %b", pc[11:2], instruction);

	end
	

endmodule