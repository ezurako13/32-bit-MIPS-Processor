module CLA16bit(ri, co, zero, a, b, c0, less, ALUop);

	output [15:0]ri;
	output co;
	output zero;
	// output Gi;
	// output Pi;

	input [15:0]a;
	input [15:0]b;

	// // todo bunlari geri acmayi unutma ve asagidaki less inputlarini duzeltmeyi
	input c0;
	input less;
	input[2:0]ALUop;
	
	// wire temp;
	// not not0(temp, ALUop[0]);

	// wire isSubst;
	// and and0(isSubst, ALUop[2], temp);

	// // todo bunu da kapat
	// wire c0;
	// or or0(c0, isSubst, 1'b0);

	wire [4:1]c;
	wire [3:0]zeroin;
	wire [3:0]G;
	wire [3:0]P;

	// // todo zerolari duzelt
	// // todo Vleri ekle
	// // todo zero, V ve SET icin duzgun b mantik bul
	// // todo bunlari 32 bite cikarmak icin mumkun oldugunca az gereksiz baglanti ve gate iceren ve az ugrastirici ayni zamanda kolay olceklendirilebilir bir cozum bul.
	CLA4bit Cla0(ri[3:0],   zeroin[0], G[0], P[0], a[3:0],   b[3:0],   c0,   less, ALUop);
	CLA4bit Cla1(ri[7:4],   zeroin[1], G[1], P[1], a[7:4],   b[7:4],   c[1], 1'b0, ALUop);
	CLA4bit Cla2(ri[11:8],  zeroin[2], G[2], P[2], a[11:8],  b[11:8],  c[2], 1'b0, ALUop);
	CLA4bit Cla3(ri[15:12], zeroin[3], G[3], P[3], a[15:12], b[15:12], c[3], 1'b0, ALUop);

	CLL2_level cll2(c, c0, G, P);

	or or2(co, c[4], 1'b0);

	// sonradan not i aliniyor
	or or3(zero, zeroin[0], zeroin[1], zeroin[2], zeroin[3]);


endmodule

