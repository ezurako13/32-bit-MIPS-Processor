module adder(r, A, B);
	output [31:0] r;

	input [31:0] A;
	input [31:0] B;

	wire [2:0] Aluop;
	or  o0(Aluop[0], 1'b1, 1'b0);
	or  o1(Aluop[1], 1'b0, 1'b0);
	or  o2(Aluop[2], 1'b1, 1'b0);

	wire co;
	wire zero;
	wire V;
	wire SET;

	CLA32bitMSB cla0(r, co, zero, V, SET, A, B, Aluop);


endmodule