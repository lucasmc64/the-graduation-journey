		.data
askForN:	.asciiz		"Digite um valor inteiro: "
answer1:	.asciiz		"O inteiro "
answer2:	.asciiz		" possui "
answer3:	.asciiz		" algarismo(s)."

		.text
contadigitos:
	li	$v0, 4
	la	$a0, askForN
	syscall			# request n
	li	$v0, 5
	syscall			# $v0 <- n
	move	$t0, $v0	# $t0 = n
	
if:	bnez	$t0, endIf	# if ($t0 != 0) go to endIf
	addi	$t3, $0, 1	# $t3 = 1 (contador)
	j	end		# jump to end
	
endIf:	move	$t1, $t0	# $t1 = n
	addi	$t2, $0, 10	# $t2 = 10
	addi	$t3, $0, 0	# $t3 = 0 (contador)

loop:	beqz	$t1, end	# if ($t1 == 0) go to end
	div	$t1, $t2	# n/10 
	mflo	$t1		# $t1 = n/10 (from LO)
	addi	$t3, $t3, 1	# $t3 = $t3 + 1
	j	loop		# jump to loop
	
end:	li	$v0, 4
	la	$a0, answer1
	syscall			# print answer1
	li	$v0, 1
	move	$a0, $t0
	syscall			# print n
	li	$v0, 4
	la	$a0, answer2
	syscall			# print answer2
	li	$v0, 1
	move	$a0, $t3
	syscall			# print contador
	li	$v0, 4
	la	$a0, answer3
	syscall			# print answer3
	li	$v0, 10		# end program
	syscall