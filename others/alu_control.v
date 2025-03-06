module alu_control(alu_ctr, function_code, ALUop);
	output [2:0] alu_ctr;

	input [5:0] function_code;
	input [2:0] ALUop;
	
	wire [5:0] notFunction_code;
	not notFunctionCode1(notFunction_code[5], function_code[5]);
	not notFunctionCode2(notFunction_code[4], function_code[4]);
	not notFunctionCode3(notFunction_code[3], function_code[3]);
	not notFunctionCode4(notFunction_code[2], function_code[2]);
	not notFunctionCode5(notFunction_code[1], function_code[1]);
	not notFunctionCode6(notFunction_code[0], function_code[0]);


	wire rType;
	and a1(rType, ALUop[2], ALUop[1], ALUop[0]);
	wire notRType;
	not n1(notRType, rType);

	wire [2:0] notRTypeALUop;
	and a2(notRTypeALUop[2], notRType, ALUop[2]);
	and a3(notRTypeALUop[1], notRType, ALUop[1]);
	and a4(notRTypeALUop[0], notRType, ALUop[0]);

	wire andR, orR, addR, subR, setOnLessThanR, jumpRegisterR;
	and a6(andR, rType, notFunction_code[5], notFunction_code[4], notFunction_code[3], function_code[2], notFunction_code[1], notFunction_code[0]);
	and a7(orR, rType, notFunction_code[5], notFunction_code[4], notFunction_code[3], function_code[2], notFunction_code[1], function_code[0]);
	and a10(addR, rType, notFunction_code[5], notFunction_code[4], notFunction_code[3], notFunction_code[2], function_code[1], notFunction_code[0]);
	and a5(subR, rType, notFunction_code[5], notFunction_code[4], notFunction_code[3], notFunction_code[2], function_code[1], function_code[0]);
	and a8(setOnLessThanR, rType, notFunction_code[5], notFunction_code[4], notFunction_code[3], function_code[2], function_code[1], function_code[0]);
	and a9(jumpRegisterR, rType, notFunction_code[5], notFunction_code[4], function_code[3], notFunction_code[2], notFunction_code[1], notFunction_code[0]);


	or o1(alu_ctr[2], notRTypeALUop[2], addR, subR, setOnLessThanR);
	or o2(alu_ctr[1], notRTypeALUop[1], subR);
	or o3(alu_ctr[0], notRTypeALUop[0], orR, addR);


endmodule