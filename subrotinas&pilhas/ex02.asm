.text
	li $t0, 150			# X = 150
	li $t1, 230			# Y = 230
	li $t2, 991			# Z = 991
	li $t3, 0			# R = 0
	
	move $a0, $t0			# a0 = x
	move $a1, $t1			# a1 = y
	move $a2, $t2			# a2 = z
	
	jal soma3n			# chamada da subrotina soma3n
	
	move $t3, $v0			# R = resultado da subrotina soma3n(X, Y, Z)
	
	# fim do programa
	li $v0, 10
	syscall

# subrotina soma3n
soma3n:
	addi $sp, $sp, -4		# push($ra) na pilha pra poder chamar outra subrotina
	sw $ra, ($sp)			# sem perder o endereco de retorno
	
	jal soma			# chamada da subrotina soma (X + Y)
	
	move $a1, $v0			# Y = Z
	move $a0, $a2			# X = soma(X + Y)
	
	jal soma			# soma (X + Y) onde seria algo como soma(Z, soma(X, Y))
	
	lw $ra, ($sp)			# pop($ra) na pilha pra poder pegar
	addi $sp, $sp, 4		# o endereco anterior de retorno de novo
	
	jr $ra				# volta pra chamada da subrotina

# subrotina soma	
soma:
	add $t4, $a0, $a1		# t4 = a0 + a1 = (x + y)
	move $v0, $t4			# v0 = resultado da soma para retorno da subrotina
	jr $ra				# volta para a chamada da subortina