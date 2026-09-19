addi $t5, $zero, 1 	#inicializando valor de X em t5

addi $t0, $zero, 3	# inicializo t0 com 3 para multiplicar por x² depois
mult $t5, $t5 		# x * x
mflo $t6		# salvo x² no reg. do resultado

mult $t0, $t6		# 3 * x²
mflo $t6		# 3x² no reg. resultado

addi $t0, $zero, -5	# inicializo t0 com -5 pra multiplicar por x
mult $t0, $t5		# (-5) * x
mflo $t0		# salvo -5x em t0
add $t6, $t0, $t6	# 3x² + (-5x)

addi $t6, $t6, 13	# 3x² + (-5x) + 13