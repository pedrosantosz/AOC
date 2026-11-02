.data
	vetor: .word 1,2,3,4,5,6,7,8,9,10
	tamanho: .word 10
	
.text
	addi $t0, $zero, 1 			# flag = 1
	la $t1, vetor				# carrega o endereço inicial do vetor
	lw $t2, tamanho				# carrega o tamanho do vetor
	
	addi $t3, $zero, 1 			# contador = 1
	
loop:	
	slt $t4, $t3, $t2			# t3 < t2? // contador < tamanho?
	beq $t4, $zero, fim			# se contador >= tamanho, encerra o programa
	lw $t5, 0x00($t1)			# senao, carrego dois pares pra analizar por vez
	lw $t6, 0x04($t1) 
	
	slt $t0, $t5, $t6			# t5 < t6 ?
	beq $t0, $zero, fim 			# se t5 > t6, então o vetor está desordenado
	addi $t3, $t3, 1			# senão, avança no contador
	addi $t1, $t1, 4			# avança no indice do vetor
	j loop
	
fim: