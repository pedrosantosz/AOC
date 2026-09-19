addi $t1, $zero, 1 	# inicializando valor de X em t1
addi $t2, $zero, 1 	# inicializando valor de Y em t2
addi $t3, $zero, 1 	# inicializando valor de Z em t3

# 4x #
addi $t0, $zero, 4 	# inicializando t0 com 4 para multiplicar por X
mult $t0, $t1	   	# multiplicando t0 = 4 por t1 = X
mflo $t0	   	# salvando temporariamente o valor da multiplicação em t0


add $t7, $t0, $zero 	# adicionando o valor ao registrador do resultado final ( 4x + 0 )

# ( a partir daqui é basicamente a repetição dos comandos anteriores )

# -2y #
addi $t0, $zero, -2
mult $t0, $t2
mflo $t0

add $t7, $t0, $t7 	# 4x + (-2y)

# 3y #
addi $t0, $zero, 3
mult $t0, $t3
mflo $t0

add $t7, $t0, $t7 	# 4x + (-2y) + 3y