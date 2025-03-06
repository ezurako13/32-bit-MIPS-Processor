# addi $v1, $0, 5
# addi $3, $0, 3
# add $2, $0, $ra

# subi $2, $2, 1
# # bne $2, $3, -2
# j 2

# sw $2, 0($0)



addi $t0, $0, 5
subi $s0, $0, -8
beq $t0, $0, 7
move $a0, $t0
addi $ra, $zero, 6
j 10
sw $v0, 0($s0)
addi $s0, $s0, 4
subi $t0, $t0, 1
j 2
bne $s0, $0, 2	
ori $v0, $a0, 2049
j 6
addi $s0, $0, 12
lb $s1, 0($s0)
slt $t1, $s1, $s0


# addi $t0, $0, 5	
# subi $s0, $0 -8	
# beq $t0, $0, 6	
# move $a0, $t0	
# jal 10 			
# sw $v0, 0($s0)	
# addi $s0, $s0, 4
# subi $t0, $t0, 1
# j 2				
# bne $s0, $0, 2	
# ori $v0, $a0, 2049
# jr $ra			
# addi $s0, $0, 12
# lb $s1, 0($s0)	
# slt $t1, $s1, $s0
