module Alu1Bit(output ri, gi, pi, input ai, bi, ci, less, input[2:0]ALUop);
	
	wire temp;
	not n0(temp, ALUop[0]);

	wire isSubst;
	and a0(isSubst, ALUop[2], temp);

	wire w1;
	xor x1(w1, isSubst, bi);
	
	wire w2, w3;
	and a1(w2, ai, w1);
	or o1(w3, ai, w1);
	
	wire w4;
	not n1(w4, w2);
	
	wire w5;
	and a2(w5, w4, w3);

	wire w6, w7;
	and a3(w6, w5, ci);
	or o2(w7, w5, ci);

	wire w8;
	not n2(w8, w6);

	// co
	// or o3(co, w2, w6);

	wire w9;
	and a4(w9, w8, w7);

	wire w3not;
	not n3(w3not, w3);

	// gi
	and a5(gi, w2, 1'b1);
	// pi
	or o4(pi, w3, 1'b0);

	// ri
	_1_bit_8e1_mux mux(	ri, 
						ALUop[2], ALUop[1], ALUop[0],
						w2, w3, w5, w3not, less, w9, w9, w9);


endmodule

