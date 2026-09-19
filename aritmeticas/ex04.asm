# inicializando o valor de X em t1
addi $t1, $zero, 1

# 9x + 7
addi $t5, $zero, 9
mult $t5, $t1
mflo $t5
addi $t5, $t5, 7

# 2x + 8
addi $t6, $zero, 2
mult $t6, $t1
mflo $t6
addi $t6, $t6, 8

# (9x + 7) / (2x + 8)
div $t5, $t6
mflo $t2
mfhi $t3