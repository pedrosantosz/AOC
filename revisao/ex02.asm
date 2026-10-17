.data
	n: .word 4
	a: .space 4

.text
	lui $t0, 0x1001		# reg. base
	lw $t1, 0x00($t0)	# carrega em t1 o valor de 'n'
	
	addi $t2, $zero, 0	# contador t2 = 0
	addi $t3, $t1, 1	# limite n + 1
	
	addi $t4, $zero, 1	# resultado t4 = 1 (neutro da multiplicacao)
	
loop:
	slt $t5, $t2, $t3	# t2 < t3 (n+1)?
	beq $t5, $zero, fimloop	# se t5 == 0, t2 > n
	
	srl $t5, $t2, 1		# t2 / 2	
	add $t5, $t1, $t5	# n + (t2 / 2)
	multu $t4, $t5		# produtorio
	mflo $t4
	
	addi $t2, $t2, 1	# t2++
	j loop			# volta pro começo do laço
	
fimloop:
	sw $t4, 0x04($t0)	# armazena o resultado na memória de dados em 0x10010004