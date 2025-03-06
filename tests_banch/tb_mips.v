module tb_mips;
	reg clk;

	integer i;
	initial begin
		clk = 0;
		#10;

		for(i = 0; i < 80; i = i + 1) begin
			clk = ~clk;
			#50;
		end

		// repeat(10) 
		// 	#50 clk = ~clk;
	end
	

	// always begin
	// 	#50 clk = ~clk;
	// end

	mips mips(.clk(clk));

endmodule