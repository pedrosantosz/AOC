.data
	texto: .asciiz " o rato roeu a roupa do rei de roma "
	
.text
	la $t0, texto			# endereço do começo da string
	li $t1, 0x20			# space
	
loop:
	lb $t2, 0x00($t0)		# carrega o char atual
	beq $t2, $zero, fim		# char == null?
	
	beq $t1, $t2, removeespaco 	# se for um espaço, entra na subrotina
fimloop:
	addi $t0, $t0, 1		# próximo char
	j loop
	
removeespaco:
	move $t3, $t0			# copia o endereço do caractere atual
aindaremovendo:
	lb $t4, 0x00($t3)		# carrega o caractere atual
	beq $t4, $zero, loop		# se chegar no final da string, volta pro começo do loop
	lb $t5, 1($t3)			# carrega o char seguinte
	sb $t5, 0x00($t3)		# guarda no endereço atual, o char seguinte
	addi $t3, $t3, 1		# próximo char
	j aindaremovendo
	
fim: