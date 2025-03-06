module mux2x1bit5(o, s0, i0, i1);
	output [4:0] o;

	input  s0;
	input [4:0] i0;
	input [4:0] i1;

	mux2x1bit1 mux0(o[0], s0, i0[0], i1[0]);
	mux2x1bit1 mux1(o[1], s0, i0[1], i1[1]);
	mux2x1bit1 mux2(o[2], s0, i0[2], i1[2]);
	mux2x1bit1 mux3(o[3], s0, i0[3], i1[3]);
	mux2x1bit1 mux4(o[4], s0, i0[4], i1[4]);

endmodule

