# 2) 
#	Escreva um programa que leia um array de 10 posicoes e armazene seus valores na memória. 
#	A seguir inverta os elementos do array. v[0]<-> v[9], v[1]<-> v[8] .... 
#	Imprima o vetor invertido de maneira formatada  [a,b,c,d,e.....]

.macro printStr(%str)
	la $a0, %str
	addi $v0, $zero, 4
	syscall
.end_macro 

.macro scanInt()
	addi $v0, $zero, 5
	syscall
.end_macro 

.macro printInt(%int)
	add $a0, $zero, %int
	addi $v0, $zero, 1
	syscall
.end_macro 

.data
	array: .space 40
	i: 0
	limit: 10
	title: .asciiz "Invertendo array\n"
	type_int: .asciiz "Digite um valor inteiro: "
	start_array: .asciiz "\n["
	separator_array: .asciiz ", "
	end_array: .asciiz "]\n"
	
.text
	printStr(title) # Macro que imprime strings
	
	la $s5, array # Carrega o endereço de array para $s5
	
	la $t0, i # Carrega em $t0 o endereço de i
	lw $s0, 0($t0) # $s0 recebe o valor de i (0)
	
	la $t0, limit # Carrega em $t0 o endereço de limit
	lw $s1, 0($t0) # $s1 recebe o valor de i (10)
	
FOR1:
	slt $t0, $s0, $s1 # i < 10?
	beq $t0, $zero, END1 # Caso nao seja, sai do for
	
	# Loop _____
	
	printStr(type_int) # Imprime a solicitacao de digitar um numero
	scanInt() # Le um inteiro
	sw $v0, 0($s5) # Guarda o inteiro lido no array
	
	# __________
	
	addi $s5, $s5, 4 # Vai pra próxima posicao do array a ser preenchida
	addi $s0, $s0, 1 # i++
	j FOR1
	
END1:
	addi $s5, $s5, -4 # Retorna pra ultima posicao do array
	
	la $s4, array # Carrega o endereço de array para $s4
	
	la $t0, i # Carrega em $t0 o endereço de i
	lw $s0, 0($t0) # $s0 recebe o valor de i (0)
	
FOR2:
	slt $t0, $s1, $s0 # Verifica se o contador decrescente e menor que o crecente
	bne $t0, $zero, END2 # Caso versadeiro, sai do for
	
	# Loop _____
	
	lw $t1, 0($s4)	#}
	lw $t2, 0($s5)	# } Troca de lugar os valores iniciais
	sw $t1, 0($s5)	# } com os valores finais.
	sw $t2, 0($s4)	#}
	
	# __________
	
	addi $s4, $s4, 4 # Vai pra próxima posicao do array
	addi $s5, $s5, -4 # Vai pra próxima posicao anterior do array
	
	addi $s0, $s0, 1 # i++
	addi $s1, $s1, -1 # i--
	
	j FOR2
	
END2:
	la $s5, array # Carrega o endereço de array para $s5
	
	la $t0, i # Carrega em $t0 o endereço de i
	lw $s0, 0($t0) # $s0 recebe o valor de i (0)
	
	la $t0, limit # Carrega em $t0 o endereço de limit
	lw $s1, 0($t0) # $s1 recebe o valor de i (10)
	
	printStr(start_array) # Imprime a abertura de colchetes
	
FOR3:
	slt $t0, $s0, $s1 # i < 10?
	beq $t0, $zero, END3 # Caso nao seja, sai do for

	# Loop _____
	
	lw $s7, 0($s5) # Carrega o valor
	printInt($s7) # Imprime um inteiro
	
	# __________
	
	addi $s5, $s5, 4 # Vai pra próxima posicao do array a ser preenchida
	addi $s0, $s0, 1 # i++
	
IF1:
	slt $t0, $s0, $s1 # i < 10?
	beq $t0, $zero, END_IF1 # Sair do IF
	printStr(separator_array) # Imprime a vírgula
	
END_IF1:
	j FOR3

END3:
	printStr(end_array) # Imprime o feclamento de colchetes
	
	# Fim do programa (return 0)
	addi $v0, $zero, 10
	syscall