.data
	res: .asciiz "Resultado: "
.text
	li $v0, 5			# v0 = 5 -> le inteiro
	syscall			
	move $a0, $v0			# guarda o resultado em a0
	
	li $v0, 5			# le inteiro
	syscall
	move $a1, $v0			# guarda em a1
	
	li $v0, 5			# le inteiro
	syscall
	move $a2, $v0			# guarda em a2

	jal media			# chamada da subrotina
	
	# depois da chamada da subrotina:
	
	move $t5, $v0			# guarda o retorno da subrotina (v0) em t5
	
	li $v0, 4			# v0 = 4 -> imprime string
	la $a0, res			# a0 guarda o endereco da string que vai ser impressa
	syscall				# imprime "Resultado: "
	
	li $v0, 1			# v0 = 1 -> imprime inteiro
	move $a0, $t5			# a0 = t5 (valor que vai ser impresso)
	syscall				# imprime o resultado da subrotina
	
	li $v0, 10			# v0 = 10 -> saida do programa
	syscall				# fim do programa

# subrotina:

media:
	li $t0, 3			# inicializa t0 com 3 (pra divisao)
	add $t1, $a0, $a1		# t1 = a0 + a1
	add $t1, $t1, $a2		# t1 = (a0 + a1) + a2
	
	div $t1, $t0			# (a0 + a1 + a2) / 3
	
	mflo $v0			# v0 = quociente para retorno da subrotina
	
	jr $ra				# volta onde a subrotina foi chamada