.data
	pergunta: .asciiz "(1) circunferencia; (2) triangulo; (3) retangulo. Escolha: "

.text
	li $v0, 4
	la $a0, pergunta
	syscall

	li $t5, 1			# 1 = circunferencia
	li $t6, 2			# 2 = triangulo
	li $t7, 3			# 3 = retangulo
	
	li $v0, 5			# le inteiro (escolha da forma geometrica)
	syscall
	move $t0, $v0			# t0 = leitura
	
	beq $t0, $t5, circunferencia	# se t0 = 1, executa o codigo de circunferencia
	beq $t0, $t6, triangulo		# se t0 = 2, executa o codigo de triangulo
	beq $t0, $t7, retangulo		# se t0 = 3, executa o codigo de retangulo
	
	j fim 				# caso leitura de valor invalido

circunferencia:
	li $v0, 5			# le inteiro (raio)
	syscall
	move $t0, $v0			# resultado da leitura
	
	move $a0, $t0			# parametro da subrotina
	
	jal areaCircunferencia		# chama subrotina
	
	j fim				# fim do programa
	
triangulo:
	li $v0, 5			# le inteiro ( base )
	syscall
	move $t0, $v0
	
	li $v0, 5			# le inteiro (altura)
	syscall
	move $t1, $v0
	
	move $a0, $t0			# parametro base da subrotina
	move $a1, $t1			# parametro altura da subrotina
	
	jal areaTriangulo		# chamada da subrotina
	
	j fim				# fim do programa

retangulo:
	li $v0, 5			# le inteiro (base)
	syscall
	move $t0, $v0
	
	li $v0, 5			# le inteiro (altura)
	syscall
	move $t1, $v0
	
	move $a0, $t0			# parametro base
	move $a1, $t1			# parametro altura
	
	jal areaRetangulo		# chamada da subrotina
	
	j fim				# fim do programa

fim:
	move $a0, $v0			# a0 = informacao pra ser impressa

	li $v0, 1			# v0 = 1 -> imprime inteiro
	syscall
	
	# fim do programa
	li $v0, 10
	syscall	
	
areaCircunferencia:
	li $t2, 3 			# pi = 3
	mult $a0, $a0			# r^2
	mflo $t3			# t3 = resposta
	mult $t2, $t3			# pi x r^2
	mflo $v0			# v0 = retorno da subrotina
	jr $ra				# volta pra chamada da subrotina

areaTriangulo:
	mult $a0, $a1			# base x altura
	mflo $t2			# t2 = resposta
	srl $t2, $t2, 1			# (base x altura) / 2
	move $v0, $t2			# retorno da subrotina
	jr $ra				# volta pra chamada da subrotina

areaRetangulo:
	mult $a0, $a1			# base x altura
	mflo $t2			# t2 = resposta
	move $v0, $t2			# v0 = valor de retorno
	jr $ra				# volta pra chamada da subrotina
