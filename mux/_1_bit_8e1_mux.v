module _1_bit_8e1_mux(output o, input s2, s1, s0, input i0, i1, i2, i3, i4, i5, i6, i7);
	
	wire w0, w1, w2, w3, w4, w5, w6, w7;
	wire s2not, s1not, s0not;
	
	not nx2(s2not, s2);
	not nx1(s1not, s1);
	not nx0(s0not, s0);

	and ax0(w0, i0, s2not, s1not, s0not);
	and ax1(w1, i1, s2not, s1not, s0);
	and ax2(w2, i2, s2not, s1, s0not);
	and ax3(w3, i3, s2not, s1, s0);
	and ax4(w4, i4, s2, s1not, s0not);
	and ax5(w5, i5, s2, s1not, s0);
	and ax6(w6, i6, s2, s1, s0not);
	and ax7(w7, i7, s2, s1, s0);
	
	or ox0(o, w0, w1, w2, w3, w4, w5, w6, w7);


endmodule
