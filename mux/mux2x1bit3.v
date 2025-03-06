module mux2x1bit3(o, s0, i0, i1);
	output [2:0] o;

	input s0;
	input [2:0] i0;
	input [2:0] i1;
	
	wire [2:0] w1;
	wire [2:0] w2;
	wire s0not;
	
	not nx0(s0not, s0);

		
	and  a0(w1[0],  s0not, i0[0]);
	and  a1(w1[1],  s0not, i0[1]);
	and  a2(w1[2],  s0not, i0[2]);

	and  ab0(w2[0],  s0, i1[0]);
	and  ab1(w2[1],  s0, i1[1]);
	and  ab2(w2[2],  s0, i1[2]);

	or  o0(o[0], w1[0], w2[0]);
	or  o1(o[1], w1[1], w2[1]);
	or  o2(o[2], w1[2], w2[2]);


endmodule

