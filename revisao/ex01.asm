.data
	.space 32		# 32 bytes (8 espaços de 4 bytes)

.text
	lui $t0, 0x1001		# reg base
	
	addi $t1, $zero, 0	# contador t1 = 0
	addi $t2, $zero, 2	# constante 2 para divisão
	
loop:
	slti $t3, $t1, 8	# t1 < 8 ?
	beq $t3, $zero, fimloop	# se t1 >= 8, t3 = 0 e vai pro fim do loop
	
	div $t1, $t2		# t1 / 2
	mfhi $t4		# resto da divisão
	
	beq $t4, $zero, par	# t1 % 2 = 0 ?
	bne $t4, $zero, impar 	# t1 % 2 != 0 ?
	
fimsalto:
	addi $t1, $t1, 1	# t1++
	addi $t0, $t0, 4	# próximo endereço do vetor
	j loop			# volta pro começo do loop
	
par:
	mult $t1, $t2		# t1 * 2
	mflo $t5		# resultado de mult
	
	sw $t5, 0x00($t0)	# armazena na memória
	j fimsalto		# volta para terminar o loop
		
impar:
	lw $t6, -0x04($t0)	# vetor[t1-1]
	lw $t7, 0x00 ($t0)	# vetor[t1]
	add $t7, $t6, $t7	# soma dos valores anteriores
	sw $t7, 0x00($t0)	# armazena na memória
	j fimsalto		# volta para terminar o loop
	
fimloop: