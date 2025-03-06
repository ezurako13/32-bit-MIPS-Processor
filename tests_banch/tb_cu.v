// `timescale 1ps/1ps

module tb_cu;
	reg [5:0] opcode;

	wire regDst;
	wire branch;
	wire memRead;
	wire memWrite;
	wire [2:0] ALUop;
	wire ALUsrc;
	wire regWrite;
	wire jump;
	wire byteOperations;
	wire move;
	
	control_unit inst(
		.regDst(regDst),
		.branch(branch),
		.memRead(memRead),
		.memWrite(memWrite),
		.ALUop(ALUop),
		.ALUsrc(ALUsrc),
		.regWrite(regWrite),
		.jump(jump),
		.byteOperations(byteOperations),
		.move(move),
		.opcode(opcode)
	);

	initial begin

		// R type
		opcode = 6'b000000;
		#50
		$display("\nSignals for opcode R type %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// addi
		opcode = 6'b000010;
		#50
		$display("\nSignals for opcode addi: %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// subi
		opcode = 6'b000011;
		#50
		$display("\nSignals for opcode subi: %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// andi
		opcode = 6'b000100;
		#50
		$display("\nSignals for opcode andi: %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// ori
		opcode = 6'b000101;
		#50
		$display("\nSignals for opcode ori: %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// load word
		opcode = 6'b001000;
		#50
		$display("\nSignals for opcode load word %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// store word
		opcode = 6'b010000;
		#50
		$display("\nSignals for opcode store word %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// load byte
		opcode = 6'b001001;
		#50
		$display("\nSignals for opcode load byte %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// store byte
		opcode = 6'b010001;
		#50
		$display("\nSignals for opcode store byte %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// set on less than immediate
		opcode = 6'b000111;
		#50
		$display("\nSignals for opcode set on less thani %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// branch on equal
		opcode = 6'b100011;
		#50
		$display("\nSignals for opcode branch on equal %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// branch on not equal
		opcode = 6'b100111;
		#50
		$display("\nSignals for opcode branch on not equal %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);
		
		// jump
		opcode = 6'b111000;
		#50
		$display("\nSignals for opcode jump: %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

		// jump and link
		opcode = 6'b111001;
		#50
		$display("\nSignals for opcode jump and link %b:\n", opcode);
		$display("regDst: %b", regDst);
		$display("branch: %b", branch);
		$display("memRead: %b", memRead);
		$display("memWrite: %b", memWrite);
		$display("ALUop: %b", ALUop);
		$display("ALUsrc: %b", ALUsrc);
		$display("regWrite: %b", regWrite);
		$display("jump: %b", jump);
		$display("byteOperations: %b", byteOperations);
		$display("move: %b", move);

	end
	

endmodule