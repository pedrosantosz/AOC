.data
	vetor: .word 1,2,3,4,5

.text
	la $t0, vetor			# ponteiro do começo
	addi $t1, $t0, 16		# ponteiro do fim (vetor + 4*4 bytes)
	
loop:
	slt $t2, $t0, $t1		# começo < fim?
	beq $t2, $zero, fim		# senão, encerra o programa
	
	lw $t3, 0($t0)			# t3 = p1
	lw $t4, 0($t1)			# t4 = p2
	
	sw $t4, 0($t0)			# p1 = t4
	sw $t3, 0($t1)			# p2 = t3
	
	addi $t0, $t0, 4		# começo avança
	addi $t1, $t1, -4		# fim recua
	j loop
	
fim: