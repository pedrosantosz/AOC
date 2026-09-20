# calcular y = 9a³ - 5a² + 7a + 15 usando o método de Horner
# Horner:  y = 15 + a ( 7 + a ( -5 + a ( 9 ) ) )

.data
	a: .word 3
	y: .space 4
	
.text
	lui $t0, 0x1001		# inicializa o registrador t0 com o endereço base
	
	lw $t1, 0x00($t0)	# carrega o valor de 'a' em t1
	
	addi $t2, $zero, 9	# t2 = 9
	
	mult $t1, $t2		# a ( 9 )
	mflo $t2		# t2 recebe o resultado da multiplicação
	addi $t2, $t2, -5	# t2 = -5 + a ( 9 )
	
	mult $t1, $t2		# a ( -5 + a ( 9 ) )
	mflo $t2		# t2 recebe o resultado da multiplicação
	addi $t2, $t2, 7	# t2 = 7 + ( a ( -5 + a ( 9 ) ) )
	
	mult $t1, $t2		# a ( 7 + ( a ( -5 + a ( 9 ) ) ) )
	mflo $t2		# t2 recebe o resultado da multiplicação
	addi $t2, $t2, 15	# 15 +	a ( 7 + ( a ( -5 + a ( 9 ) ) ) )
	
	sw $t2, 0x04($t0)	# guarda o valor de t2 no endereço t0 + 4 (y)