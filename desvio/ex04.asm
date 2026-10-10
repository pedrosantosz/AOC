ori $t0, $zero, 80	# temperatura

teste1:
	slti $t1, $t0, 20	# temp < 20?
	bne $t1, $zero, zerar	# se for diferente de 0, é menor do que 20

	slti $t1, $t0, 41	# temp < 41?
	beq $t1, $zero, teste2	# se for igual a 0, NÃO é menor do que 41, mas pode estar no segundo intervalo
	
	j fim			# chegando aqui, está dentro do intervalo

teste2: # se for maior do que o primeiro limite superior, ainda pode estar dentro do segundo intervalo
	slti $t1, $t0, 60	# temp < 60?
	bne $t1, $zero, zerar	# se for diferente de 0, é menor do que 60
	
	slti $t1, $t0, 81	# temp < 81?
	beq $t1, $zero, fim	# se for igual a 0, é NÃO é menor do que 81
	
	j fim			# se chegar até aqui, está dentro do intervalo

zerar: # só entra nessa parte caso seja menor do que os limites inferiores de cada intervalo, se for maior do que os limites superiores, já será 0
	add $t1, $zero, $zero

fim: