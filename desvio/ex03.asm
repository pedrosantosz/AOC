.data
	x: .word 7
	y: .space 4
	
.text
	lui $t0, 0x1001 	# Registrador com Endereço Base da Memória de Dados
	lw $t1, 0x00($t0)	# le um valor da memória
	
	addi $t2, $zero, 2	# contador = 2, começar em 2 pois n1 e n2 já são base

	addi $t4, $zero, 1	# n1 = 1
	addi $t5, $zero, 1	# n2 = 1
	
loop:
	slt $t3, $t2, $t1	# contador < x ?
	beq $t3, $zero, fim	# se contador >= x, pula pro final
	
	add $t6, $t4, $t5	# temp = n1 + n2
	add $t4, $zero, $t5	# n1 = n2
	add $t5, $zero, $t6	# n2 = temp
	
	addi $t2, $t2, 1	# contador ++
	
	j loop			# volta pro começo do loop
	
fim:	
	sw $t5, 0x04($t0)	# guarda o resultado no segundo endereço da memória de dados