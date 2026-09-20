.data
	a: .word 3
	b: .word 5
	y: .space 4
	
.text
	lui $t0, 0x1001		# inicializa o registrador base com 0x10010000
	lw $t1, 0x00($t0)	# carrega em t1 o valor armazenado no endereço $t0 + 0 (a)
	lw $t2, 0x04($t0)	# carrega em t2 o valor armazenado no endereço $t0 + 4 (b)
	
	addi $t3, $zero, 32	# inicializa t3 com 32
	mult $t1, $t2		# a * b
	mflo $t4		# t4 = resultado de mult
	mult $t3, $t4		# 32ab
	mflo $t5		# t5 vai ser o registrador temporário pra equação
	
	addi $t3, $zero, -3	# inicializa t3 com -3
	mult $t3, $t1		# -3a
	mflo $t4		# t4 = -3a
	add $t5, $t4, $t5	# 32ab + (-3a)
	
	addi $t3, $zero, 7	# inicializa t3 com 7
	mult $t3, $t2		# 7b
	mflo $t4		# t4 = 7b
	add $t5, $t4, $t5	# 32ab + (-3a) + 7b
	
	addi $t5, $t5, -13	# 32ab + (-3a) + 7b + (-13)
	
	sw $t5, 0x08($t0)	# guarda o valor de $t5 no endereço $t0 + 8 (y)