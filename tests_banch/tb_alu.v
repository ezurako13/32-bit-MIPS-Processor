`timescale 1ps/1ps

module tb_alu;
	reg clk;
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] Aluop;

	wire [31:0] r;
	wire co;
	wire zero;
	wire V;
	wire SET;

	alu al(
		.clk(clk),
		.A(A),
		.B(B),
		.Aluop(Aluop),

		.r(r),
		.co(co),
		.zero(zero),
		.V(V),
		.SET(SET)
	);

	initial begin
		clk = 0;
	end

	always begin
		#5 clk = ~clk;	
	end 
		


	initial begin

		// #200 clk = 0;
		// #2000000000
	
		// and
		#200 A= 32'b0000011111111111;
		#200 B= 32'b1111110001111011;
		#200 Aluop= 3'b000;

		#200 $display("\nAnd:");
		#200 $display("Aluop= %b\nA=      %b\nB=      %b", Aluop, A, B);
		#200 $display("result= %b\n", r);


		// Or
		#200 A= 32'b101000010101100;
		#200 B= 32'b110010001110011;
		#200 Aluop= 3'b001;

		#200 $display("\nOr:");
		#200 $display("Aluop= %b\nA=      %b\nB=      %b", Aluop, A, B);
		#200 $display("result= %b\n", r);


		// Xor
		#200 A= 32'b0001110011111111;
		#200 B= 32'b1111111111111111;
		#200 Aluop= 3'b010;

		#200 $display("\nXor:");
		#200 $display("Aluop= %b\nA=      %b\nB=      %b", Aluop, A, B);
		#200 $display("result= %b\n", r);


		// Nor
		#200 A= 32'b0000011111111111;
		#200 B= 32'b1111110001111011;
		#200 Aluop= 3'b011;

		#200 $display("\nNor:");
		#200 $display("Aluop= %b\nA=      %b\nB=      %b", Aluop, A, B);
		#200 $display("result= %b\n", r);


		// addition
		#200 A= 32'd130;
		#200 B= 32'd4;
		#200 Aluop= 3'b101;

		#200 $display("\nAdd:");
		#200 $display("Aluop= %b\nA=      %d\nB=      %d", Aluop, A, B);
		#200 $display("result= %d\n", r);


		// subs
		#200 A= 32'd25;
		#200 B= 32'd8;
		#200 Aluop= 3'b110;

		#200 $display("\nSubs:");
		#200 $display("Aluop= %b\nA=      %d\nB=      %d", Aluop, A, B);
		#200 $display("result= %d\n", r);


		// less than
		#200 A= 32'd3;
		#200 B= 32'd15;
		#200 Aluop= 3'b100;
		
		#200 $display("\nLess Than:");
		#200 $display("Aluop= %b\nA=      %d\nB=      %d", Aluop, A, B);
		#200 $display("result= %b\n", r);


		// mod
		#200 A= 32'd31;
		#200 B= 32'd4;
		#200 Aluop= 3'b111;
		
		#200 $display("\nMod:");
		#200 $display("Aluop= %b\nA=      %d\nB=      %d", Aluop, A, B);
		#200 $display("result= %d\n", r);

	end
	

endmodule