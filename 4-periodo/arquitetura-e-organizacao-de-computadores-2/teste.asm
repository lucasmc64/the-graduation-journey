.data
	str1: .asciiz "Hello, World!\n"
.text
	# Coloca a string em um registrador usado para argumentos de funções
	la $a0, str1
	# Coloca 4 (código para printar na tela) em um registrador "especial"
	addi $v0, $zero, 4
	# Faz uma chamada de sistema que precebe os dados nos registradores acima e executa o comando de print
	syscall 
	
	# Coloca 10 (código para encerrar o programa, sem erros) em um registrador "especial"
	addi $v0, $zero, 10
	# Encerra o programa
	syscall
