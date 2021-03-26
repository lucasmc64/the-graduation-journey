# 1) 
#	Escreva um programa que some os 1000 primeiros números naturais impares. 
#	Imprima o resultado final usando chamadas do sistema.

.macro printStr(%str)
	la $a0, %str
	addi $v0, $zero, 4
	syscall 
.end_macro 

.macro printInt(%int)
	add $a0, $zero, %int
	addi $v0, $zero, 1
	syscall
.end_macro 

.data
	i: 1
	limit: 1000
	title: .asciiz "Soma dos primeiros 1000 numeros inteiros impares\n"
	result: .asciiz "O resultado e: "
	
.text
	printStr(title) # Macro que imprime strings
	
	la $t0, i # Carrega em $t0 o endereço de i
	lw $s0, 0($t0) # $s0 recebe o valor de i (0)
	
	addi $s3, $zero, 1 # Proximo inteiro
	
	la $t0, limit # Carrega em $t0 o endereço de limit
	lw $s1, 0($t0) # $s1 recebe o valor de i (1000)
	
	add $s7, $zero, $zero # Zerando o somador
	
FOR1:
	slt $t0, $s0, $s1 # i < 1000?
	beq $t0, $zero, END1 # Caso nao seja, sai do for
	
	# Loop _____
	
	add $s7, $s7, $s3
	
	# __________
	
	addi $s3, $s3, 2
	addi $s0, $s0, 1
	j FOR1
	
END1:
	printStr(result)
	printInt($s7)
	
	# Fim do programa (return 0)
	addi $v0, $zero, 10
	syscall 
