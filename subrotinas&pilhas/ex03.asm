.text
	li $t0, 5			# N = 5
	move $a0, $t0			# argumento
	jal fat				# chama a subrotina fat
	move $t1, $v0			# resultado em t1
	
	# fim do programa
	li $v0, 10
	syscall

fat:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)

	slti $t2, $a0, 2		# t2 = 1 se n < 2 (ou seja, n <= 1)
	bne $t2, $zero, base		# se t2 != 0, pula pro caso base

	addi $a0, $a0, -1		# n-1
	jal fat				# v0 = fat(n-1)
	lw $a0, 4($sp)			# recupera n
	mul $v0, $a0, $v0		# v0 = n * fat(n-1)
	j fim

base:
	li $v0, 1			# caso base

fim:	
	# desempilha e volta pra chamada da subrotina
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra