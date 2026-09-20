# y = - ax^4 + bx³ - cx² + dx - e
# y = -e + x ( d + x ( -c + x ( b + x ( -a ) ) ) )

.data
	a: .word -3 	# +0x00
	b: .word 7	# +0x04
	c: .word 5	# +0x08
	d: .word -2	# +0x0c
	e: .word 8	# +0x10
	x: .word 4	# +0x14
	y: .space 4	# +0x18
	
.text
	lui $t0, 0x1001		# base
	
	# carregamento das variáveis da memória para os registradores
	lw $t1, 0x14($t0) 	# x
	lw $t2, 0x00($t0) 	# a
	lw $t3, 0x04($t0) 	# b	
	lw $t4, 0x08($t0) 	# c
	lw $t5, 0x0c($t0) 	# d
	lw $t6, 0x10($t0) 	# e	

	# arrumando os valores das variáveis com o - na frente (daria pra usar sub, mas preferi assim)
	nor $t2, $t2, $zero	# complemento de 1
	addi $t2, $t2, 1	# complemento de 2 (-a)
	
	nor $t4, $t4, $zero	# complemento de 1
	addi $t4, $t4, 1	# complemento de 2 (-c)
	
	nor $t6, $t6, $zero	# complemento de 1
	addi $t6, $t6, 1	# complemento de 2 (-e)
	
	
	# cálculo do polinômio
	mult $t1, $t2		# x ( -a )
	mflo $t2		# t2 <- resultado de mult
	add $t2, $t2, $t3	# b + x ( -a )
	
	mult $t1, $t2		# x ( b + ( x ( -a ) ) )
	mflo $t2		# t2 <- resultado de mult
	add $t2, $t2, $t4	# -c + x ( b + x ( -a ) )
	
	mult $t1, $t2		# x ( -c + x ( b + x ( -a ) ) )
	mflo $t2		# t2 <- resultado de mult
	add $t2, $t2, $t5	# d + x ( -c + x ( b + x ( -a ) ) )
	
	mult $t1, $t2		# x ( d + x ( -c + x ( b + x ( -a ) ) ) )
	mflo $t2		# t2 <- resultado de mult
	add $t2, $t2, $t6	# -e + x ( d + x ( -c + x ( b + x ( -a ) ) ) )
	
	sw $t2, 0x18($t0)	# guarda o valor de t2 na memória no endereço t0 + 0x18 (y)