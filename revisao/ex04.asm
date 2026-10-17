.data
	n: .word 5
	f: .space 4

.text
	lui $t0, 0x1001		# reg. base
	lw $t1, 0x00($t0)	# n
	
	add $t2, $zero, $t1	# i = n
	
	addi $t3, $zero, 1	# fatorial
	
loop:
	beq $t2, $zero, fim	# enquanto i != 0, continuo calculando
	mult $t2, $t3		# n * (n - 1)...
	mflo $t3		# fatorial = produto
	
	addi $t2, $t2, -1	# i--
	j loop			# volta pro começo do loop

 fim:
 	sw $t3, 0x04($t0)	# armazena o resultado na memória de dados em 0x10010004