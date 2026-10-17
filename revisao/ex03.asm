.data
	a: .word 3
	b: .word 2
	c: .word 1
	m: .space 4

.text
	lui $t0, 0x1001		# reg. base
	
	lw $t1, 0x00($t0)	# a
	lw $t2, 0x04($t0)	# b
	lw $t3, 0x08($t0)	# c
	
	slt $t4, $t2, $t1	# b < a ?
	beq $t4, $zero, testa	# se não, a e b já estão em ordem
	add $t5, $zero, $t1	# temp = a
	add $t1, $zero, $t2	# a = b
	add $t2, $zero, $t5	# b = temp (agora a <= b)
	
testa:
	slt $t4, $t3, $t1	# c < a ?
	beq $t4, $zero, testb	# se não, vai testar contra b
	add $t6, $zero, $t1	# mediana = a
	j fim
	
testb:
	slt $t4, $t2, $t3	# b < c ?
	beq $t4, $zero, meio	# se não, c está entre a e b
	add $t6, $zero, $t2	# mediana = b
	j fim
	
meio:
	add $t6, $zero, $t3	# mediana = c

fim:
	sw $t6, 0x0C($t0)	# salva a mediana em 0x1001000C