.data
	tamanho: .word 7
	vetor1: .word -30, -23, 56, -43, 72, -18, 71
	vetor2: .word 45, 23, 21, -23, -82, 0, 69
	soma: .word 0, 0, 0, 0, 0, 0, 0

.text
	la $t0, vetor1			# t0 = p1 (ponteiro do vetor1)
	la $t1, vetor2			# t1 = p2 (ponteiro do vetor2)
	la $t2, soma			# t2 = p3 (ponteiro do soma)
	lw $t3, tamanho			# t3 = tamanho (7)
	
	add $t4, $zero, $zero		# t4 = contador = 0
	
loop:
	slt $t5, $t4, $t3		# t5 = (contador < tamanho)?
	beq $t5, $zero, fim		# se t5 == 0, terminou
	
	lw $t6, 0($t0)			# t6 = p1
	lw $t7, 0($t1)			# t7 = p2
	add $t8, $t6, $t7		# t8 = t6 + t7
	sw $t8, 0($t2)			# p3 = t8
	
	addi $t0, $t0, 4		# p1++
	addi $t1, $t1, 4		# p2++
	addi $t2, $t2, 4		# p3++
	addi $t4, $t4, 1		# contador++
	j loop
	
fim: