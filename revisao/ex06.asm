ori $t1, $0, 0x8000		# inicializa o valor

addi $t2, $zero, 0		# contador = 0 (bits significativos)

loop:
	beq $t1, $zero, fim	# enquanto o valor for != 0 (enquanto não deslocar todos os bits significativos pra fora)
	srl $t1, $t1, 1		# desloca 1 bit à direita
	addi $t2, $t2, 1	# contador++
	j loop			# repete
	
fim: