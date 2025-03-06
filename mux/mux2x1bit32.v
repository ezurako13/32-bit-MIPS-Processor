module mux2x1bit32(o, s0, i0, i1);
	output [31:0] o;

	input s0;
	input [31:0] i0;
	input [31:0] i1;
	
	wire [31:0] w1;
	wire [31:0] w2;
	wire s0not;
	
	not nx0(s0not, s0);

		
	and  a0(w1[0],  s0not, i0[0]);
	and  a1(w1[1],  s0not, i0[1]);
	and  a2(w1[2],  s0not, i0[2]);
	and  a3(w1[3],  s0not, i0[3]);
	and  a4(w1[4],  s0not, i0[4]);
	and  a5(w1[5],  s0not, i0[5]);
	and  a6(w1[6],  s0not, i0[6]);
	and  a7(w1[7],  s0not, i0[7]);
	and  a8(w1[8],  s0not, i0[8]);
	and  a9(w1[9],  s0not, i0[9]);
	and a10(w1[10], s0not, i0[10]);
	and a11(w1[11], s0not, i0[11]);
	and a12(w1[12], s0not, i0[12]);
	and a13(w1[13], s0not, i0[13]);
	and a14(w1[14], s0not, i0[14]);
	and a15(w1[15], s0not, i0[15]);
	and a16(w1[16], s0not, i0[16]);
	and a17(w1[17], s0not, i0[17]);
	and a18(w1[18], s0not, i0[18]);
	and a19(w1[19], s0not, i0[19]);
	and a20(w1[20], s0not, i0[20]);
	and a21(w1[21], s0not, i0[21]);
	and a22(w1[22], s0not, i0[22]);
	and a23(w1[23], s0not, i0[23]);
	and a24(w1[24], s0not, i0[24]);
	and a25(w1[25], s0not, i0[25]);
	and a26(w1[26], s0not, i0[26]);
	and a27(w1[27], s0not, i0[27]);
	and a28(w1[28], s0not, i0[28]);
	and a29(w1[29], s0not, i0[29]);
	and a30(w1[30], s0not, i0[30]);
	and a31(w1[31], s0not, i0[31]);


	and  ab0(w2[0],  s0, i1[0]);
	and  ab1(w2[1],  s0, i1[1]);
	and  ab2(w2[2],  s0, i1[2]);
	and  ab3(w2[3],  s0, i1[3]);
	and  ab4(w2[4],  s0, i1[4]);
	and  ab5(w2[5],  s0, i1[5]);
	and  ab6(w2[6],  s0, i1[6]);
	and  ab7(w2[7],  s0, i1[7]);
	and  ab8(w2[8],  s0, i1[8]);
	and  ab9(w2[9],  s0, i1[9]);
	and ab10(w2[10], s0, i1[10]);
	and ab11(w2[11], s0, i1[11]);
	and ab12(w2[12], s0, i1[12]);
	and ab13(w2[13], s0, i1[13]);
	and ab14(w2[14], s0, i1[14]);
	and ab15(w2[15], s0, i1[15]);
	and ab16(w2[16], s0, i1[16]);
	and ab17(w2[17], s0, i1[17]);
	and ab18(w2[18], s0, i1[18]);
	and ab19(w2[19], s0, i1[19]);
	and ab20(w2[20], s0, i1[20]);
	and ab21(w2[21], s0, i1[21]);
	and ab22(w2[22], s0, i1[22]);
	and ab23(w2[23], s0, i1[23]);
	and ab24(w2[24], s0, i1[24]);
	and ab25(w2[25], s0, i1[25]);
	and ab26(w2[26], s0, i1[26]);
	and ab27(w2[27], s0, i1[27]);
	and ab28(w2[28], s0, i1[28]);
	and ab29(w2[29], s0, i1[29]);
	and ab30(w2[30], s0, i1[30]);
	and ab31(w2[31], s0, i1[31]);

	or  o0(o[0], w1[0], w2[0]);
	or  o1(o[1], w1[1], w2[1]);
	or  o2(o[2], w1[2], w2[2]);
	or  o3(o[3], w1[3], w2[3]);
	or  o4(o[4], w1[4], w2[4]);
	or  o5(o[5], w1[5], w2[5]);
	or  o6(o[6], w1[6], w2[6]);
	or  o7(o[7], w1[7], w2[7]);
	or  o8(o[8], w1[8], w2[8]);
	or  o9(o[9], w1[9], w2[9]);
	or o10(o[10], w1[10], w2[10]);
	or o11(o[11], w1[11], w2[11]);
	or o12(o[12], w1[12], w2[12]);
	or o13(o[13], w1[13], w2[13]);
	or o14(o[14], w1[14], w2[14]);
	or o15(o[15], w1[15], w2[15]);
	or o16(o[16], w1[16], w2[16]);
	or o17(o[17], w1[17], w2[17]);
	or o18(o[18], w1[18], w2[18]);
	or o19(o[19], w1[19], w2[19]);
	or o20(o[20], w1[20], w2[20]);
	or o21(o[21], w1[21], w2[21]);
	or o22(o[22], w1[22], w2[22]);
	or o23(o[23], w1[23], w2[23]);
	or o24(o[24], w1[24], w2[24]);
	or o25(o[25], w1[25], w2[25]);
	or o26(o[26], w1[26], w2[26]);
	or o27(o[27], w1[27], w2[27]);
	or o28(o[28], w1[28], w2[28]);
	or o29(o[29], w1[29], w2[29]);
	or o30(o[30], w1[30], w2[30]);
	or o31(o[31], w1[31], w2[31]);


endmodule

