.data
	a: .half 30
	b: .half 5
	y: .space 4

.text 
	lui $t0, 0x1001		# registrador base com endereço do começo da memória de dados
	lh $t1, 0x00($t0)	# carrega em t1 a meia palavra 'a' da memória de dados
	lh $t2, 0x02($t0)	# carrega em t2 a meia palavra 'b' da memória de dados
	
	bne $t1, $t2, divisao	# se os valores não forem iguais, desvia para as instruções de divisão
	
	# se o desvio falhar, são iguais e então continua para a multiplicação
	
	mult $t1, $t2		# multiplicação de 'a' e 'b'
	mflo $t3		# guarda em t3 o resultado da multiplicação
	
	j end			# pula para o final do programa, evitando rodar as instruções de divisão
	
divisao:
	div $t1, $t2		# divisão de 'a' por 'b'
	mflo $t3		# guarda em t3 o resultado da divisão			
	
end:
	sw $t3, 0x04($t0)	# armazena na memória de dados o valor de t3, sendo resultado da mult ou div
