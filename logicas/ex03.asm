ori $t1, $zero, 0x01 	# inicializo t1 com 1

sll $t2, $t1, 1 	# desloco pra esquerda, fica 10
xor $t2, $t1, $t2	# somo 10 + 01 = 11

sll $t3, $t2, 2		# desloco 2 bits pra esquerda, fica 1100
xor $t2, $t2, $t3	# somo 1100 + 0011 = 1111, chego no primeiro F

sll $t3, $t2, 4		# desloco 4 bits pra esquerda
xor $t2, $t2, $t3	# somo 0xF0 com 0x0F, fica 0xFF

sll $t3, $t2, 8		# desloco 8 bits pra esquerda, fica 0xFF00
xor $t2, $t2, $t3	# somo 0xFF00 com 0x00FF, fica 0xFFFF (metade dos 32 bits foram preenchidos)

sll $t3, $t2, 16	# desloco 16 bits pra esquerda, fica 0xFFFF0000
xor $t1, $t2, $t3	# somo 0xFFFF0000 com 0x0000FFFF, fica 0xFFFFFFFF, que era o objetivo (salvo em t1)

####################### RASCUNHO ########################

######## a ideia é preencher todos os bits com 1 ########

# 0000 0000 0000 0000 0000 0000 0000 0001 # inicialização

# 0000 0000 0000 0000 0000 0000 0000 0010 # deslocamento
# 0000 0000 0000 0000 0000 0000 0000 0011 # soma

# 0000 0000 0000 0000 0000 0000 0000 1100 # deslocamento
# 0000 0000 0000 0000 0000 0000 0000 1111 # soma

# 0000 0000 0000 0000 0000 0000 1111 0000 # deslocamento
# 0000 0000 0000 0000 0000 0000 1111 1111 # soma

# 0000 0000 0000 0000 1111 1111 0000 0000 # deslocamento
# 0000 0000 0000 0000 1111 1111 1111 1111 # soma

# 1111 1111 1111 1111 0000 0000 0000 0000 # deslocamento
# 1111 1111 1111 1111 1111 1111 1111 1111 # soma

# obs, na soma pode ser OR ou XOR, só botei XOR por pensar como uma "soma"