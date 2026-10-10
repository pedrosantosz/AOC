.data
	y: .space 4

.text
	lui $t0, 0x1001 	# registrador com endereço base para memória de dados
	
	addi $t1, $zero, 0 	# soma = 0
	addi $t2, $zero, 1 	# contador = 1
	
loop:
	slti $t5, $t2, 334 	# contador < 334?
	beq $t5, $zero, fim 	# se t5 for 0, contador = 334 e então pula pro final
	add $t1, $t1, $t2 	# senão, contador < 334 e então é adicionado à soma
	addi $t2, $t2, 1	# contador ++
	j loop			# volta para o começo do loop
	
fim:	
	sw $t1, 0x00($t0)	# armazena o resultado na memória de dados
	