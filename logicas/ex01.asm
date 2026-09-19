ori $t7, $zero, 0xD 	# inicializa t7 com 0xD
sll $t7, $t7, 4 	# desloca t7 4 bits à esquerda para adicionar o próximo digito

ori $t7, $t7, 0xE	# faz uma or entre 0xD0 e 0x0E e salva em t7
sll $t7, $t7, 4		# desloca 4 bits pra esquerda
			
# repetição das últimas duas instruções para cada dígito:

ori $t7, $t7, 0xC
sll $t7, $t7, 4

ori $t7, $t7, 0xA
sll $t7, $t7, 4

ori $t7, $t7, 0xD
sll $t7, $t7, 4

ori $t7, $t7, 0xA
sll $t7, $t7, 4

ori $t7, $t7, 0x7
sll $t7, $t7, 4

ori $t7, $t7, 0x0