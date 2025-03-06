// `timescale 1ps/1ps

module tb_alu_ctr;
	reg [5:0] function_code;
	reg [2:0] ALUop;
	
	wire [2:0] alu_ctr;
	
	alu_control inst(
		.alu_ctr(alu_ctr),
		.function_code(function_code),
		.ALUop(ALUop)
	);

	initial begin

		ALUop = 3'b111;
		function_code = 6'b000101;
		#50
		$display("\nALUop: %b", ALUop);
		$display("function_code: %b", function_code);
		$display("alu_ctr: %b", alu_ctr);

		ALUop = 3'b010;
		function_code = 6'b100100;
		#50
		$display("\nALUop: %b", ALUop);
		$display("function_code: %b", function_code);
		$display("alu_ctr: %b", alu_ctr);


	end
	

endmodule