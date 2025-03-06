# i will continue my project with strictly following this table
# Instruction						Example				Meaning								Type	OPCODE	FUNC. CODE
# add								add $1,$2,$3		$1 = $2 + $3							R	000000	000010		// -
# subtract						sub $1,$2,$3		$1 = $2 - $3							R	000000	000011		// -
# add immediate					addi $1,$2,100		$1 = $2 + 100							I	000010	NA			// -
# subtract immediate				subi $1,$2,100		$1 = $2 - 100							I	000011	NA			// -
# and								and $1,$2,$3		$1 = $2 & $3							R	000000	000100		// -
# or								or $1,$2,$3			$1 = $2 | $3							R	000000	000101		// -
# and immediate					andi $1,$2,100		$1 = $2 & 100							I	000100	NA			// -
# or immediate					or $1,$2,100		$1 = $2 | 100							I	000101	NA			// -
# load word						lw $1,100($2)		$1 = Memory [$2 + 100]					I	001000	NA			// -
# store word						sw $1,100($2)		Memory [$2 + 100] = $1					I	010000	NA				
# load byte						lb $1,100($s2)		$1={24’b0,M[R[rs]+SignExtImm](7:0)}		I	001001	NA			// -		
# store byte						sb $1,100($2)		M[R[rs]+SignExtImm](7:0)=R[rt](7:0)		I	010001	NA						
# set on less than				slt $1,$2,$3		if ($2 < $3) $1 = 1; else $1 = 0		R	000000	000111		// -
# set on less than immediate		slti $1,$2,100		if ($2 < 100) $1 = 1; else $1 = 0		I	000111	NA			// -
# branch on equal					beq $1,$2,100		if ($1 == $2) go to PC + 4 + 100		I	100011	NA						
# branch on not equal				bne $1,$2,100		if ($1 != $2) go to PC + 4 + 100		I	100111	NA						
# jump							j 1000				go to address 1000						J	111000	NA				
# jump and link					jal 1000			$ra = PC + 4; go to address 1000		J	111001	NA			// -
# jump register					jr $1				go to address stored in $1				R	000000	001000				
# move							move $rt,$rs		$rt = $rs								I	100000	NA			// -


class Assembler:
	def __init__(self):
		self.register_dict = {
			"$zero": 0, "$at": 1, "$v0": 2, "$v1": 3,
			"$a0": 4, "$a1": 5, "$a2": 6, "$a3": 7,
			"$t0": 8, "$t1": 9, "$t2": 10, "$t3": 11, "$t4": 12, "$t5": 13, "$t6": 14, "$t7": 15,
			"$s0": 16, "$s1": 17, "$s2": 18, "$s3": 19, "$s4": 20, "$s5": 21, "$s6": 22, "$s7": 23,
			"$t8": 24, "$t9": 25,
			"$k0": 26, "$k1": 27, "$gp": 28, 
			"$sp": 29, "$fp": 30, "$ra": 31
		}

	def assemble(self, instruction):
		instruction = instruction.replace(',', ' ')  # Replace commas with spaces
		parts = instruction.split()
		opcode = parts[0]

		if opcode == 'nop':
			return 2**31 + 2**30  # Machine code for nop
		
		# Rest of the assemble method...
		args = parts[1:]
		
		if opcode in ['lw', 'sw', 'lb', 'sb']:  # Handle memory instructions
			rt, offset_rs = args
			offset, rs = offset_rs.replace(')', '').split('(')
			args = [rt, rs, offset]
		if opcode in ['add', 'sub', 'and', 'or', 'slt']:
			return self.encode_r_type(opcode, *args)
		elif opcode == 'jr':  # Handle jump register instruction
			return self.encode_jr_type(opcode, *args)
		elif opcode in ['addi', 'subi', 'andi', 'ori', 'lw', 'sw', 'lb', 'sb', 'slti', 'beq', 'bne']:
			return self.encode_i_type(opcode, *args)
		elif opcode == 'move':
			return self.encode_i_type('move', *args, 0)  # Treat move as addi with immediate 0
		elif opcode in ['j', 'jal']:
			return self.encode_j_type(opcode, *args)
		else:
			raise ValueError(f'Unknown opcode: {opcode}')



	def encode_r_type(self, opcode, rs, rt, rd):
		funct_codes = {'add': 0x2, 'sub': 0x3, 'and': 0x4, 'or': 0x5, 'slt': 0x7, 'jr': 0x8}
		rs = self.register_dict.get(rs, int(rs[1:]) if rs[1:].isdigit() else rs)  # Only convert to int if it's a number
		rt = self.register_dict.get(rt, int(rt[1:]) if rt[1:].isdigit() else rt)  # Only convert to int if it's a number
		rd = self.register_dict.get(rd, int(rd[1:]) if rd[1:].isdigit() else rd)  # Only convert to int if it's a number
		# print(opcode, rs, rt, rd)
		# print(f'{(0 << 26) | (rs << 21) | (rt << 16) | (rd << 11) | funct_codes[opcode]:032b}')
		return (0 << 26) | (rs << 21) | (rt << 16) | (rd << 11) | funct_codes[opcode]

	def encode_jr_type(self, opcode, rs):
		funct_codes = {'jr': 0x8}
		rs = self.register_dict.get(rs, int(rs[1:]) if rs[1:].isdigit() else rs)  # Only convert to int if it's a number
		return (0 << 26) | (rs << 21) | funct_codes[opcode]
	
	def encode_i_type(self, opcode, rt, rs, imm):
		opcode_codes = {'addi': 0x2, 'subi': 0x3, 'andi': 0x4, 'ori': 0x5, 'lw': 0x8, 'sw': 0x10, 'lb': 0x9, 'sb': 0x11, 'slti': 0x7, 'beq': 0x23, 'bne': 0x27, 'move': 0x20}
		rt = self.register_dict.get(rt, int(rt[1:]) if rt[1:].isdigit() else rt)  # Only convert to int if it's a number
		rs = self.register_dict.get(rs, int(rs[1:]) if rs[1:].isdigit() else rs)  # Only convert to int if it's a number
		imm = int(imm)
		return (opcode_codes[opcode] << 26) | (rs << 21) | (rt << 16) | (imm & 0xFFFF)

	def encode_j_type(self, opcode, address):
		opcode_codes = {'j': 0x38, 'jal': 0x39}
		address = int(address)
		return (opcode_codes[opcode] << 26) | (address & 0x03FFFFFF)



	def assemble_file(self, input_file, output_file):
		with open(input_file, 'r') as f_in, open(output_file, 'w') as f_out:
			lines = f_in.readlines()
			for line in lines:
				line = line.strip()  # Remove leading/trailing whitespace
				if line and not line.startswith('#'):  # Ignore empty lines and comments
					print(line)
					machine_code = self.assemble(line)
					f_out.write(f'{machine_code:032b}\n')

			# If there are fewer than 1024 instructions, fill in the rest with zeros
			for _ in range(len(lines), 1024):
				f_out.write('0' * 32 + '\n')



assembler = Assembler()

assembler.assemble_file('program.asm', 'simulation\\modelsim\\instructions.mem')
