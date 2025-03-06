// `timescale 1ps/1ps

module tb_shift_l2;
	reg [31:0] address;
	
	wire [31:0] shifted_address;
	
	shift_left_2 inst(
		.shifted_address(shifted_address),
		.address(address)
	);

	initial begin

		address = 32'd31;
		#50
		$display("\naddress: %d", address);
		$display("shifted_address: %d", shifted_address);

		address = 32'd5;
		#50
		$display("\naddress: %d", address);
		$display("shifted_address: %d", shifted_address);



	end
	

endmodule