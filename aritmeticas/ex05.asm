addi $t1, $zero, 160 	# Base em t1
addi $t2, $zero, 120 	# Altura em t2

mult $t1, $t2		# Base x Altura
mflo $t3		# resultado b.h em t3
sra $t3, $t3, 1		# desloca t3 em 1 bit, salvo em t3 (divisão por 2)