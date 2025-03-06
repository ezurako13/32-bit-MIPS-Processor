module CLA32bitMSB(ri, co, zero, V, SET, a, b, ALUop);

	output [31:0]ri;
	output co;
	output zero;
	output V, SET;

	input [31:0]a;
	input [31:0]b;

	// // todo bunlari geri acmayi unutma ve asagidaki less inputlarini duzeltmeyi
	// input c0;
	// input less;
	input[2:0]ALUop;
	
	wire temp;
	not not0(temp, ALUop[0]);

	wire isSubst;
	and and0(isSubst, ALUop[2], temp);

	// // todo bunu da kapat
	wire c0;
	or or0(c0, isSubst, 1'b0);

	wire [2:1]c;
	wire [1:0]zeroin;
	// wire [1:0]G;
	// wire [1:0]P;

	CLA16bit 	Cla0(ri[15:0],  c[1], zeroin[0], 		 a[15:0],  b[15:0],  c0,   SET,  ALUop);
	CLA16bitMSB Cla1(ri[31:16], c[2], zeroin[1], V, SET, a[31:16], b[31:16], c[1], 1'b0, ALUop);

	or or2(co, c[2], 1'b0);
	nor nor0(zero, zeroin[0], zeroin[1]);

endmodule

