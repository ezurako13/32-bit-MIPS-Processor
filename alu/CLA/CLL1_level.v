module CLL1_level(c, Gi, Pi, c0, g, p);

	output [3:1]c;
	output Gi;
	output Pi;

	input c0;
	input [3:0]g;
	input [3:0]p;


	wire w3, w2, w1, w0;
	and and0(w0, p[0], c0);
	and and1(w1, w0, p[1]);
	and and2(w2, w1, p[2]);
	and and3(w3, w2, p[3]);

	wire w6, w5, w4;
	and and4(w4, p[1], g[0]);
	and and5(w5, w4, p[2]);
	and and6(w6, w5, p[3]);

	wire w7, w8;
	and and7(w7, p[2], g[1]);
	and and8(w8, w7, p[3]);

	wire w9;
	and and9(w9, p[3], g[2]);


	or or0(c[1], g[0], w0);
	or or1(c[2], g[1], w1, w4);
	or or2(c[3], g[2], w2, w5, w7);
	// or or3(c[4], g[3], w3, w6, w8, w9);

	or or4(Gi, g[3], w6, w8, w9);
	and and10(Pi, p[3], p[2], p[1], p[0]);

endmodule