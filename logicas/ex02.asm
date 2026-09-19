# o operador imediato de instruções tipo I possui no máximo 16 bits
# como cada dígito em hexa é o equivalente a 4 bits em binário
# 4 A's atingem esse limite, por isso tem que mandar de 4 em 4 dígitos
# fazendo um deslocamento de 4 dígitos * 4 bits (16 bits) à esquerda entre eles

ori $t1, $zero, 0xAAAA
sll $t1, $t1, 16
ori $t1, $t1, 0xAAAA

srl $t2, $t1, 1

or $t3, $t1, $t2

and $t4, $t1, $t2

xor $t5, $t1, $t2

# t1 = 0xAAAAAAAA = 1010101010101010b
# t2 = 0x55555555 = 0101010101010101b

# todos os valores bit a bit são diferentes, então OR e XOR vão dar tudo 1, e AND vai dar tudo 0