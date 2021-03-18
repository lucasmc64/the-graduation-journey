# Par ou Impar? (COM A INSTRUCAO BNE)
#
# DESC: Programa que le um inteiro da entrada padrao, testa se ele e par ou impar e informa ao usuario
#
# DAA: 15.03.2021

.data
	str1: .asciiz "Programa que testa a paridade de um numero lido pelo teclado\n"
	str2: .asciiz "Digite um numero: "
	str3: .asciiz "O numero e par\n"
	str4: .asciiz "O numero e impar\n"
	
.text
	# Imprimir na tela uma mensagem informando o proposito do programa
	
	la $a0, str1
	addi $v0, $zero, 4
	syscall 
	
	# Ler numero inteiro (pular teste de adequação de entrada)
	
	la $a0, str2
	addi $v0, $zero, 4
	syscall 
	
	addi $v0, $zero, 5
	syscall
	
	add $s7, $zero, $v0 # Move o inteiro lido para o registrador S7
	
	# Testar se o número lido e par ou impae e informar ao usuario a paridade do numero lido
	
	addi $s0, $zero, 1
	and $t0, $s7, $s0
	bne $t0, $zero, IMPAR
	
PAR:
	la $a0, str3
	addi $v0, $zero, 4
	syscall 
	j SAI

IMPAR:
	la $a0, str4
	addi $v0, $zero, 4
	syscall 
	
SAI:
	# Informar ao SO que o programa terminou sem erros
	
	addi $v0, $zero, 10
	syscall

