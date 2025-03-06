module CLA4bitMSB(ri, zero, V, SET, Gi, Pi, ai, bi, c0, less, ALUop);

	output [3:0]ri;
	output zero;
	output V, SET;
	output Gi;
	output Pi;

	input [3:0]ai;
	input [3:0]bi;

	// // todo bunlari geri acmayi unutma ve asagidaki less inputlarini duzeltmeyi
	input c0;
	input less;
	input [2:0]ALUop;
	
	// wire temp;
	// not not0(temp, ALUop[0]);

	// wire isSubst;
	// and and0(isSubst, ALUop[2], temp);

	// // todo bunu da kapat
	// wire c0;
	// or or0(c0, isSubst, 1'b0);

	wire [3:1]c;
	wire [3:0]g;
	wire [3:0]p;

	Alu1Bit 	alu0(ri[0], g[0], p[0], 			ai[0], bi[0],   c0, less, ALUop);
	Alu1Bit 	alu1(ri[1], g[1], p[1], 			ai[1], bi[1], c[1], 1'b0, ALUop);
	Alu1Bit 	alu2(ri[2], g[2], p[2], 			ai[2], bi[2], c[2], 1'b0, ALUop);
	Alu1BitMSB 	alu3(ri[3], g[3], p[3], V, SET, 	ai[3], bi[3], c[3], 1'b0, ALUop);

	CLL1_level cll1(c, Gi, Pi, c0, g, p);

	// or or2(co, c[4], 1'b0);

	// sonradan not i aliniyor
	or or3(zero, ri[0], ri[1], ri[2], ri[3]);


endmodule

