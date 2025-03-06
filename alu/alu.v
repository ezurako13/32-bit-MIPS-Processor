module alu(r, zero, A, B, Aluop);
	output [31:0] r;
	output zero;

	input [31:0] A;
	input [31:0] B;
	input [2:0] Aluop;



	wire co;
	wire V;
	wire SET;

	
	CLA32bitMSB cla0(r, co, zero, V, SET, A, B, Aluop);


endmodule