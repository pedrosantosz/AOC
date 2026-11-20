.data
	resultados: .space 400
	km: .asciiz "Km viajados: "
	litros: .asciiz "Litros consumidos: "
	saida: .asciiz "Km por litro: "

.text
	la $t0, resultados			# t0 = p1 (ponteiro de onde guardar o proximo resultado)

loop:
	# leitura dos km
	li $v0, 4				# 4 em v0 = imprimir string
	la $a0, km				# endereco da string que vai ser impressa
	syscall					# chama o sistema e pergunta os km

	li $v0, 5				# 5 em v0 = ler inteiro
	syscall					# chama o sistema pra ler (resultado em v0)
	move $t1, $v0				# t1 = km
	beq $t1, $zero, fim			# km == 0? sai do programa

	# leitura dos litros
	li $v0, 4				# 4 em v0 = imprimir string
	la $a0, litros				# endereco da string
	syscall					# chama o sistem e pergunta os litros

	li $v0, 5				# 5 em v0 = ler int
	syscall					# chama o sistema pra ler (resultado em v0)
	move $t2, $v0				# t2 = litros

	# calculo dos km/litro
	div $t1, $t2				# km / litros
	mflo $t3				# t3 = quociente (km por litro)

	sw $t3, 0($t0)				# p1 = t3 (guardo o resultado na memoria)
	addi $t0, $t0, 4			# p1++ (proximo endereco)

	li $v0, 4				# 4 em v0 = imprimir string
	la $a0, saida				# endereco da string de saida
	syscall					# chama o sistema e imprime

	li $v0, 1				# 1 em v0 = imprimir inteiro armazenado em a0
	move $a0, $t3				# a0 = resultado
	syscall					# imprime resultado

	li $v0, 11				
	li $a0, 10
	syscall					# "nova linha"

	j loop

fim: