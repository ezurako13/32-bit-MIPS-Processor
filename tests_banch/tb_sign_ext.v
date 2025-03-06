// `timescale 1ps/1ps

module tb_sign_ext;
	reg [15:0] imm;
	
	wire [31:0] sign_ext_imm;
	
	sign_extend inst(
		.sign_ext_imm(sign_ext_imm),
		.imm(imm)
	);

	initial begin

		imm = 16'b110;
		#50
		$display("\nimm: %b", imm);
		$display("sign_ext_imm: %b", sign_ext_imm);

		imm = 16'b1111111111110110;
		#50
		$display("\nimm: %b", imm);
		$display("sign_ext_imm: %b", sign_ext_imm);



	end
	

endmodule