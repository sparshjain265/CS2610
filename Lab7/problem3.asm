#problem3.asm
   .data
		age: .word 40, 35, 20, 10, 60, 55
		
	.text
	
	.globl main
main:
   
	la $t0, age
	li $t1, 0		#sum
	li $t2, 0		#counter
	li $t3, 0
	
	loop:
		beq $t2, 6, print
		lw	$t3, ($t0)
		add $t1, $t1, $t3
		addi $t0, 4
		addi $t2, 1
		j loop
	
	print:
		li $v0, 1
		la $a0, ($t1)
		syscall

		li $v0, 10
		syscall
