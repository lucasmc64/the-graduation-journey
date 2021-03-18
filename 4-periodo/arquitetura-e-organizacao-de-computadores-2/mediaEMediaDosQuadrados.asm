# mediaEMediaQuadrados.asm
#
# DESC: Escrever um programa que le 10 inteiros do teclado que calcule a sua media e a media de seus quadrados e informar os resultados ao usuario
# 
# DDA: 18-03-2021

.data
	str1: "Digite um numero: "
	arr: .space 40
	i: 0
	arr_length: 10

.text
	# Ganhar acesso a primeira posicao de arr
	la $s0, arr # Carrega o endereço de arr para $s0
	
	# Ler 10 inteiros do teclado
	la $t0, i # Carrega o endereço de i para $t0
	lw $s1, 0($t0) # s1 = i (0)
	
	la $t0, arr_length # Carrega o endereço de arr_length para $s0
	lw $s2, 0($t0) # s2 = arr_length (10)
	
FOR1:
	slt $t1, $s1, $s2 # i < 10?
	beq $t1, $zero, SAI1
	
	# Loop ______
	
	la $a0, str1 # Carrega str1 para $a0
	addi $v0, $zero, 4 # Carrega o código para printar string
	syscall # Printa str1
	addi $v0, $zero, 5 # Carrega o codigo para ler inteiro
	syscall # Le o inteiro
	sw $v0, 0($s0) # Guarda o inteiro em uma posicao de $s0
	add $s0, $s0, 4 # PERGUNTAR PRO ABDALA PQ ISSO FUNCIONA, deveria ser addi

	# ___________
	
	addi $s1, $s1, 1 # i++
	j FOR1

SAI1:
	# Calcular a media dos 10 inteiros
	la $s0, arr
	add $s1, $zero, $zero
	add $s3, $zero, $zero
	
FOR2:
	slt $t1, $s1, $s2
	beq $t1, $zero, SAI2
	
	# Loop ______
	
	add $s3, $s3, 0($s0)
	add $s0, $s0, 4
	
	# ___________
	
	addi $s1, $s1, 1
	j FOR2
	
	# Elevar os 10 inteiros ao quadrado
	
	# Calcular a media dos quadrados

SAI2:
	# Calcula a media
	div $s3, $s2
	mflo 
	
	# Printar os resultados
	
	
	# Fim do programa (return 0)
	addi $v0, $zero, 10
	syscall
