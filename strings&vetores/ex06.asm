.data
	resultados: .space 400			# primeiro do .data, então começa em 0x10010000
	km: .asciiz "Km viajados: "
	litros: .asciiz "Litros consumidos: "
	saida: .asciiz "Km por litro: "

.text
	la $t0, resultados			# t0 = p1 (ponteiro de onde guardar o próximo resultado)

loop:
	li $v0, 4
	la $a0, km
	syscall					# pergunta os km

	li $v0, 5
	syscall					# lê int
	move $t1, $v0				# t1 = km
	beq $t1, $zero, fim			# km == 0? sai do programa

	li $v0, 4
	la $a0, litros
	syscall					# pergunta os litros

	li $v0, 5
	syscall
	move $t2, $v0				# t2 = litros

	div $t1, $t2				# km / litros
	mflo $t3				# t3 = quociente (km por litro)

	sw $t3, 0($t0)				# p1 = t3
	addi $t0, $t0, 4			# p1++

	li $v0, 4
	la $a0, saida
	syscall

	li $v0, 1
	move $a0, $t3
	syscall					# imprime t3

	li $v0, 11
	li $a0, 10
	syscall					# pula linha

	j loop

fim: