// i will continue my project with strictly following this table
// Instruction						Example				Meaning								Type	OPCODE	FUNC. CODE
// add								add $1,$2,$3		$1 = $2 + $3							R	000000	000010		// -
// subtract						sub $1,$2,$3		$1 = $2 - $3							R	000000	000011		// -
// add immediate					addi $1,$2,100		$1 = $2 + 100							I	000010	NA			// -
// subtract immediate				subi $1,$2,100		$1 = $2 - 100							I	000011	NA			// -
// and								and $1,$2,$3		$1 = $2 & $3							R	000000	000100		// -
// or								or $1,$2,$3			$1 = $2 | $3							R	000000	000101		// -
// and immediate					andi $1,$2,100		$1 = $2 & 100							I	000100	NA			// -
// or immediate					or $1,$2,100		$1 = $2 | 100							I	000101	NA			// -
// load word						lw $1,100($2)		$1 = Memory [$2 + 100]					I	001000	NA			// -
// store word						sw $1,100($2)		Memory [$2 + 100] = $1					I	010000	NA				
// load byte						lb $1,100($s2)		$1={24’b0,M[R[rs]+SignExtImm](7:0)}		I	001001	NA			// -		
// store byte						sb $1,100($2)		M[R[rs]+SignExtImm](7:0)=R[rt](7:0)		I	010001	NA						
// set on less than				slt $1,$2,$3		if ($2 < $3) $1 = 1; else $1 = 0		R	000000	000111		// -
// set on less than immediate		slti $1,$2,100		if ($2 < 100) $1 = 1; else $1 = 0		I	000111	NA			// -
// branch on equal					beq $1,$2,100		if ($1 == $2) go to PC + 4 + 100		I	100011	NA						
// branch on not equal				bne $1,$2,100		if ($1 != $2) go to PC + 4 + 100		I	100111	NA						
// jump							j 1000				go to address 1000						J	111000	NA				
// jump and link					jal 1000			$ra = PC + 4; go to address 1000		J	111001	NA			// -
// jump register					jr $1				go to address stored in $1				R	000000	001000				
// move							move $rt,$rs		$rt = $rs								I	100000	NA			// -


module control_unit (regDst, branch, branchNotEqual, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move, opcode, clk);
	output regDst;	// 1 for rd, 0 for rt
	output branch;	// 1 for branch, 0 for not branch
	output branchNotEqual;	// 1 for branchNotEqual, 0 for not branchNotEqual
	output memRead;		// 1 for read, 0 for not read
	output memWrite;	// 1 for write, 0 for not write
	output [2:0] ALUop;	// 000 for add, 001 for sub, 010 for and, 011 for or, 100 for slt, 
	output ALUsrc;		// 1 for ALUsrc, 0 for not ALUsrc
	output regWrite;	// 1 for write, 0 for not write
	output jump;	// 1 for jump, 0 for not jump
	output byteOperations;	// 1 for byte operations, 0 for not byte operations
	output move;	// 1 for move, 0 for not move

	input [5:0] opcode;
	input clk;



	wire [5:0] notOpcode;
	not notOpcode1 (notOpcode[5], opcode[5]);
	not notOpcode2 (notOpcode[4], opcode[4]);
	not notOpcode3 (notOpcode[3], opcode[3]);
	not notOpcode4 (notOpcode[2], opcode[2]);
	not notOpcode5 (notOpcode[1], opcode[1]);
	not notOpcode6 (notOpcode[0], opcode[0]);


	and a0 (regDst, notOpcode[5], notOpcode[4], notOpcode[3], notOpcode[2], notOpcode[1], notOpcode[0]);
	and a1 (branch, opcode[5], notOpcode[4], notOpcode[3], notOpcode[2], opcode[1], opcode[0]);
	and a13 (branchNotEqual, opcode[5], notOpcode[4], notOpcode[3], opcode[2], opcode[1], opcode[0]);
	and a2 (jump, opcode[5], opcode[4], opcode[3]);
	and a3 (byteOperations, notOpcode[5], notOpcode[2], notOpcode[1], opcode[0]);
	and a6 (move, opcode[5], notOpcode[4], notOpcode[3], notOpcode[2], notOpcode[1], notOpcode[0]);

	nor n2 (ALUsrc, regDst, jump, branch, branchNotEqual);


	wire setOnLessThani, jumpAndLink, andi, ori, less, addi, subi;
	and a15 (setOnLessThani, notOpcode[5], notOpcode[4], notOpcode[3], opcode[2], opcode[1], opcode[0]);
	and a16 (jumpAndLink, opcode[5], opcode[4], opcode[3], notOpcode[2], notOpcode[1], opcode[0]);
	and a7 (andi, notOpcode[5], notOpcode[4], notOpcode[3], opcode[2], notOpcode[1], notOpcode[0]);
	and a9 (ori, notOpcode[5], notOpcode[4], notOpcode[3], opcode[2], notOpcode[1], opcode[0]);
	and a12 (less, notOpcode[5], notOpcode[4], notOpcode[3], opcode[2], opcode[1], opcode[0]);
	and a10 (addi, notOpcode[5], notOpcode[4], notOpcode[3], notOpcode[2], opcode[1], notOpcode[0]);
	and a11 (subi, notOpcode[5], notOpcode[4], notOpcode[3], notOpcode[2], opcode[1], opcode[0]);


	wire memReadWire, memWriteWire;
	and a4 (memReadWire, notOpcode[5], notOpcode[4], opcode[3]);
	and a5 (memWriteWire, notOpcode[5], opcode[4], notOpcode[3]);

	and #(10) a14 (memRead, memReadWire, clk);
	and #(10) a17 (memWrite, memWriteWire, clk);


	wire regWriteWire;
	or o4 (regWriteWire, regDst, memRead, andi, ori, addi, subi, setOnLessThani, jumpAndLink, move);
	and #(20) a8 (regWrite, regWriteWire, clk);


	or o1 (ALUop[2], regDst, less, addi, subi, memRead, memWrite, branch, branchNotEqual);
	or o2 (ALUop[1], regDst, subi, branch, branchNotEqual);
	or o3 (ALUop[0], regDst, ori, addi, memRead, memWrite);


endmodule


















