.data
	.word 1
	.word 7
	.word 6
	.word 4
	.word 5
	.space 4
	
.text
	addi $s0, $zero, 1		# limite inferior
	addi $s1, $zero, 5		# limite superior
	
	addi $s1, $s1, 1		# limite superior + 1 (pra usar o slt)
	
	lui $s3, 0x1001			# registrador base com inicio do vetor
	addi $s4, $zero, 5 		# tamanho do vetor
	
	addi $t0, $zero, 0		# i = 0
	addi $t8, $zero, 0		# soma = 0
	
percorreVetor:
	slt $t1, $t0, $s4		# i < tamanho
	beq $t1, $zero, fim		# se t1 == 0, o vetor já foi percorrido

	sll $t2, $t0, 2			# calcular o deslocamento (i x 4)
	add $t2, $t2, $s3		# calcular o endereço com base (s3) + deslocamento (t2)
	
	lw $t3, 0x00($t2)		# carrega o valor do endereço t2 do vetor
	
	slt $t4, $t3, $s1		# 1 se < superior + 1
	slt $t5, $t3, $s0		# 0 se >= inferior
	bne $t4, $t5, incremento	# se t4 e t5 forem direfentes, então tá dentro do intervalo

percorreFim:	
	addi $t0, $t0, 1		# i++
	j percorreVetor			# repete o laço

incremento:
	addi $t8, $t8, 1		# soma++
	j percorreFim			# volta de onde parou
	
fim:
	# ( não precisava, mas só pra ficar mais fácil de visualizar
	#   guardo o resultado (t8) no endereço seguinte ao final do vetor )
	sll $t2, $t0, 2
	add $t2, $t2, $s3
	sw $t8, 0x00($t2)