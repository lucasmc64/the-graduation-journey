# AOC 2 - Aula 4

# Programa exemplo para instrucoes aritmeticas inteiras

.data


.text 
main:
	add $s2, $s2, $s1 # Dane-se se tem overflow
	addu $s2, $s2, $s1 # Trata o overflow
	addi $s2, $zero, 42 # Um dos operandos é um número constante
	sub $s2, $s2, $s1
	
	addi $s2, $zero, 42
	addi $s1, $zero, 5
	
	div $s2, $s1 # HI = Resto, LO = Resultado inteiro
	mflo $s3 # Move From LO
	mfhi $s4 # Move From HI
	
	mult $s2, $s1