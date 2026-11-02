.data
	texto: .asciiz " o rato roeu a roupa do rei de roma "
	
.text 
	la $t0, texto 			# carrega o endereço do começo da string
	lb $t1, 0x00($t0)		# carrega o caractere do endereço atual
	beq $t1, 0x20, capitaliza
	beq $t1, $zero, fim
	addi $t1, $t1, -32		# como é o primeiro char, se for diferente de espaço vai capitalizar
	sb $t1, 0x00($t0)		# e guardar o valor na memória
	
	addi $t0, $t0, 1		# proximo char
loop:
	lb $t1, 0x00($t0)		# carrega char
	beq $t1, $zero, fim		# char == null?
	beq $t1, 0x20, capitaliza	# char == espaço?
fimloop:
	addi $t0, $t0, 1		# próximo char
	j loop
capitaliza:
	lb $t2, 0x01($t0)		# carrega o char que vem depois de um espaço
	beq $t2, $zero, fim		# se for o fim, acaba o programa
	beq $t2, 0x20, fimloop		# se for um espaço também, volta pro fim do loop
	addi $t2, $t2, -32		# senao, capitaliza
	sb $t2, 0x01($t0)		# guarda o char capitalizado
	j fimloop
fim: