module mips(clk);
	input clk;

	// reg regWrite;
	reg [31:0] pc;
	wire [31:0] instruction;

	// Instruction memory
	instruction_block im(instruction, pc);

	// Control unit
	wire [2:0] ALUop;
	wire regDst, branch, branchNotEqual, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move;
	control_unit cu(regDst, branch, branchNotEqual, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move, instruction[31:26], clk);

	// Write register mux
	wire [4:0] write_register;
	mux2x1bit5 mux_write_register(write_register, regDst, instruction[20:16], instruction[15:11]);

	// Read registers
	wire [4:0] read_reg1, read_reg2;
	assign read_reg1 = instruction[25:21];
	assign read_reg2 = instruction[20:16];

	// Register file
	wire [31:0] read_data1, read_data2;
	wire [31:0] write_data;
	register_block reg_block(regWrite, read_reg1, read_reg2, read_data1, read_data2, byteOperations, write_register, write_data, clk, regDst);

	// Sign extend
	wire [31:0] sign_extended_immediate;
	sign_extend se(sign_extended_immediate, instruction[15:0]);

	// ALU control
	wire [2:0] alu_ctr;
	alu_control alu_ct(alu_ctr, instruction[5:0], ALUop);

	// ALU input mux
	wire [31:0] alu_input2;
	mux2x1bit32 mux_alu_input2(alu_input2, ALUsrc, read_data2, sign_extended_immediate);

	// ALU
	wire zero, notZero;
	wire [31:0] alu_result;
	alu al(alu_result, zero, read_data1, alu_input2, alu_ctr);
	not notZero1(notZero, zero);

	// Data memory
	wire [31:0] read_data;
	memory_block dm(read_data, byteOperations, alu_result[17:0], read_data2, memRead, memWrite);

	// Write data mux
	mux2x1bit32 mux_write_data(write_data, memRead, alu_result, read_data);



	// BARNCH PART

	// PC + 4
	wire [31:0] pc_plus4;
	adder adder_pc_plus4(pc_plus4, pc, 32'd4);

	// Shift left 2
	wire [31:0] shift_left2;
	shift_left_2 shift_leftx(shift_left2, sign_extended_immediate);

	// PC + 4 + branch address
	wire [31:0] pc_plus_branch_address;
	adder adder_pc_plus_branch_address(pc_plus_branch_address, pc_plus4, shift_left2);

	// Branch AND zero
	wire branch_eq_decision, branch_not_decision;
	and and_branch_decision(branch_eq_decision, branch, zero);
	and and_branch_not_decision(branch_not_decision, branchNotEqual, notZero);
	or or_branch_decision(branch_decision, branch_eq_decision, branch_not_decision);

	// Branch mux
	wire [31:0] branchAddress;
	mux2x1bit32 mux_branch_mux(branchAddress, branch_decision, pc_plus4, pc_plus_branch_address);



	// JUMP PART

	// Shift left 2
	wire [31:0] jump_address;
	shift_left_2 shift_left2_jump(jump_address[27:0], instruction[25:0]);
	assign jump_address[31:28] = pc_plus4[31:28];

	// Jump mux
	wire [31:0] PC_next;
	mux2x1bit32 mux_jump_mux(PC_next, jump, branchAddress, jump_address);



	initial begin
		// regWrite = regWriteWire;
		pc = -4;
	end

	wire [5:0] opcode;
	wire [5:0] funct;
	assign opcode = instruction[31:26];
	assign funct = instruction[5:0];

	always @(posedge clk) begin
		// $display("PC_next: %d", PC_next[8:0]);

		// $display("(pc << 2): ", (pc << 2));
		// $display("(pc << 2) < 16: ", (pc << 2) < 16);


		// if((pc >> 2) < 4) begin
		if (pc == -4)
			pc = 0;
		else
			pc = PC_next;

		$display("\n\n\nPC: %d", pc[16:0]);


	end

	// always @ (regWrite, write_register, write_data) begin
	// 	$display("\n\n\nPC: %d", pc[16:0]);
	// end

	always @(negedge clk) begin

		if(branch == 1'b1 || branchNotEqual == 1'b1)
			$display("branch_decision: %d", branch_decision);
		// $display("zero: %d", zero);
		// $display("alu_result: %d", alu_result);
		// $display("ALUsrc: %d", ALUsrc);
		
		if (regDst == 1'b0 && branch == 1'b0)
			$display("imm = %d", sign_extended_immediate[15:0]);
		
		if (opcode == 6'b000000) begin  // R-type instructions
			if (funct == 6'b000010) $display("add");
			else if (funct == 6'b000011) $display("subtract");
			else if (funct == 6'b000100) $display("and");
			else if (funct == 6'b000101) $display("or");
			else if (funct == 6'b000111) $display("set on less than");
			else if (funct == 6'b001000) $display("jump register");

		end
		else if (opcode == 6'b000010) $display("add immediate");
		else if (opcode == 6'b000011) $display("subtract immediate");
		else if (opcode == 6'b000100) $display("and immediate");
		else if (opcode == 6'b000101) $display("or immediate");
		else if (opcode == 6'b001000) $display("load word");
		else if (opcode == 6'b010000) $display("store word");
		else if (opcode == 6'b001001) $display("load byte");
		else if (opcode == 6'b010001) $display("store byte");
		else if (opcode == 6'b000111) $display("set on less than immediate");
		else if (opcode == 6'b100011) $display("branch on equal");
		else if (opcode == 6'b100111) $display("branch on not equal");
		else if (opcode == 6'b111000) $display("jump");
		else if (opcode == 6'b111001) $display("jump and link");
		else if (opcode == 6'b100000) $display("move");
	end


endmodule