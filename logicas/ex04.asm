# inicialização do valor inicial
ori $t1, $zero, 0x1234
sll $t1, $t1, 16
ori $t1, $t1, 0x5678

sll $t2, $t1, 28 	# desloco o primeiro dígito do valor para o final já em t2

srl $t1, $t1, 4		# descarto em t1 o valor já armazenado em t2
sll $t3, $t1, 28	# desloco o primeiro dígito de t1 para isolar ele na esquerda
srl $t3, $t3, 4		# desloco ele pra ficar à direita do bit que teria o valor anterior, pra poder  somar
xor $t2, $t2, $t3	# junto os dois 

# repito o mesmo processo, mudando o valor do deslocamento à direita do valor
# que eu preciso juntar com os números já armazenados, pra poder juntar na posição certa

srl $t1, $t1, 4
sll $t3, $t1, 28
srl $t3, $t3, 8		# 4 bits à direita do último valor (4)
xor $t2, $t2, $t3

srl $t1, $t1, 4
sll $t3, $t1, 28
srl $t3, $t3, 12	# 4 bits à direita do último valor (8), e assim por diante...
xor $t2, $t2, $t3

srl $t1, $t1, 4
sll $t3, $t1, 28
srl $t3, $t3, 16
xor $t2, $t2, $t3

srl $t1, $t1, 4
sll $t3, $t1, 28
srl $t3, $t3, 20
xor $t2, $t2, $t3

srl $t1, $t1, 4
sll $t3, $t1, 28
srl $t3, $t3, 24
xor $t2, $t2, $t3

srl $t1, $t1, 4 	# como aqui o último valor vai ser um número só, e ele já vai estar na posição certa
xor $t2, $t1, $t2	# só preciso juntar ele com o valor já armazenado.