# trabalho-1.asm
#
# DESC:
# 	Escreva em assembly um programa que implementa o algoritmo de ordenacao quicksort. 
# 	O programa deve ler um arquivo texto chamado numeros.csv (nos arquivos do grupo) e ordena-los.  
# 	O programa deve ainda possuir uma funcao que converte uma string de numeros para um inteiro.
#
# DDA: 11-04-2021

.macro printStr(%str)
	la $a0, %str
	li $v0, 4
	syscall
.end_macro 

.macro openFile(%file)
	la $a0, %file
	li $a1, 0
	li $a2, 0
	li $v0, 13
	syscall
.end_macro 

.macro closeFile(%file)
	add $a0, $zero, %file
	li $v0, 16
	syscall
.end_macro 

.macro endProgram()
	# Finaliza o programa
	li $v0, 10
	syscall
.end_macro 

.data
	file: .asciiz "/home/lucasmc64/Repositories/the-graduation-journey/4-periodo/arquitetura-e-organizacao-de-computadores-2/trabalho-1/numeros.csv"
	buffer: .space 5
	array: .space 40000
	nan_v: .asciiz ","
	nan_e: .asciiz " "
	title: .asciiz "AOC1 - Trabalho 1\n"
	description: .asciiz "Ler numeros de um arquivo, ordena-los e printa-los.\n\n"
	error: .asciiz "Ih, deu caquinha em algum lugar... Boa sorte debugando!"

.text
	printStr(title) # Imprime titulo do programa
	printStr(description) # Imprime descricao do programa
	
	# $s0: File Descriptor
	# $s1: array
	# $s2: buffer
	# $s3: Contador de carateres lidos no buffer
	# $s6: nan_v
	# $s7: nan_e
	
	# Abrir arquivo
	
	openFile(file) # Abre arquivo em modo de leitura
	slt $t0, $v0, $zero # O File Descriptor e menor que 0? (Retorna 1 se SIM, 0 se NAO)
	bne $t0, $zero, ERROR # Se o File Descriptor e menor que 0, fecha o programa
	add $s0, $v0, $zero # Salva o File Descriptor no $s0

	la $s1, array # Carregar endereco do array
	la $s2, buffer # Carregar endereco do buffer

	# Percorrer o arquivo	

	la $t1, nan_v
	lb $s6, 0($t1)
	la $t1, nan_e
	lb $s7, 0($t1)
START_READ:
	## Limpar o buffer
	
	li $t5, 5
	li $t0, 0
FOR1:	
	slt $t7, $t0, $t5 # $t0 < t5? Se sim, retorna 1, senão 0
	beq $t7, $zero, END_FOR1
	
	### Loop __________
	
	sb $zero, 0($s2) # Zera a posicao do buffer
	
	### _______________
	
	addi $s2, $s2, 1
	addi $t0, $t0, 1
	j FOR1

END_FOR1:
	la $s2, buffer # Volta o buffer para a posicao inicial

	## Ler todos os digitos
	add $s3, $zero, $zero
DO_WHILE1:
	### Loop __________
	
	li $v0, 14 # Carrega o codigo de leitura de arquivo
	add $a0, $zero, $s0 # Carrega o File Descriptor
	la $a1, 0($s2) # Carrega o endereco do buffer
	li $a2, 1 # Carrega o numero de caracteres a serem lidos
	syscall
	
	### _______________
	
	slt $t0, $v0, $zero # O retorno da leitura do arquivo foi um número negativo?
	bne $t0, $zero, ERROR # Se sim, deu erro, encerra o programa
	
	addi $s3, $s3, 1 # Incrementa o contador de caracteres lidos
	lb $t0, 0($s2) # Carrega o caractere lido
	addi $s2, $s2, 1 # O buffer vai para a proxima posicao vazia
	
	beq $t0, $s6, END_DO_WHILE1 # Se o caractere livo for ",", sai
	beq $t0, $s7, END_DO_WHILE1 # Se o caractere livo for " ", sai
	bne $v0, $zero, END_DO_WHILE1 # Se nao houver elementos no arquivo, sai
	
	j DO_WHILE1
	
END_DO_WHILE1:
	## Converter numero
	
	#jal strToInt
	
	## Salvar no memoria

	bne $v0, $zero, START_READ # Se ainda houver elementos no arquivo, continue lendo
	
	closeFile($s0) # Fecha o arquivo

	endProgram()

ERROR:
	printStr(error)
	endProgram()


#strToInt
