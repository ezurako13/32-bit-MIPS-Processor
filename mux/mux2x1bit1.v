module mux2x1bit1(o, s0, i0, i1);
	output o;

	input s0;
	input i0;
	input i1;
	
	wire w1;
	wire w2;
	wire s0not;
	
	not nx0(s0not, s0);

	and  a0(w1, s0not, i0);
	and  ab0(w2, s0, i1);

	or  o0(o, w1, w2);

endmodule

