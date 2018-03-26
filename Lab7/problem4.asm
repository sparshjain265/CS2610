#problem4.asm
   .data
		
	.text
	
	.globl main
main:
   li $s0, 5
	li $s1, 4
	li $s2, 6
	li $s3, 7
	li $s4, 6
	li $s5, 2
	li $s6, 1
	li $s7, 3

	addiu $sp, -4	#add a word in stack
	sw $s0, ($sp)	#store s0 in stack
	addi $s0, 1		#increment s0
	addiu $sp, -4	#add a word in stack
	sw $s1, ($sp)	#store s1 in stack
	addi $s1, 1		#increment s1
	addiu $sp, -4	#add a word in stack
	sw $s2, ($sp)	#store s2 in stack
	addi $s2, 1		#increment s2
	addiu $sp, -4	#add a word in stack
	sw $s3, ($sp)	#store s3 in stack
	addi $s3, 1		#increment s3
	addiu $sp, -4	#add a word in stack
	sw $s4, ($sp)	#store s4 in stack
	addi $s4, 1		#increment s4
	addiu $sp, -4	#add a word in stack
	sw $s5, ($sp)	#store s5 in stack
	addi $s5, 1		#increment s5
	addiu $sp, -4	#add a word in stack
	sw $s6, ($sp)	#store s6 in stack
	addi $s6, 1		#increment s6
	addiu $sp, -4	#add a word in stack
	sw $s7, ($sp)	#store s7 in stack
	addi $s7, 1		#increment s7

	lw $t7, ($sp)		#load old s7 from stack to t7
	addiu $sp, 4		#remove a word from stack
	add $t7, $t7, $s7	#add old and new value of s7
	lw $t6, ($sp)		#load old s6 from stack to t6
	addiu $sp, 4		#remove a word from stack
	add $t6, $t6, $s6	#add old and new value of s6
	lw $t5, ($sp)		#load old s5 from stack to t5
	addiu $sp, 4		#remove a word from stack
	add $t5, $t5, $s5	#add old and new value of s5
	lw $t4, ($sp)		#load old s4 from stack to t4
	addiu $sp, 4		#remove a word from stack
	add $t4, $t4, $s4	#add old and new value of s4
	lw $t3, ($sp)		#load old s3 from stack to t3
	addiu $sp, 4		#remove a word from stack
	add $t3, $t3, $s3	#add old and new value of s3
	lw $t2, ($sp)		#load old s2 from stack to t2
	addiu $sp, 4		#remove a word from stack
	add $t2, $t2, $s2	#add old and new value of s2
	lw $t1, ($sp)		#load old s1 from stack to t1
	addiu $sp, 4		#remove a word from stack
	add $t1, $t1, $s1	#add old and new value of s1
	lw $t0, ($sp)		#load old s0 from stack to t0
	addiu $sp, 4		#remove a word from stack
	add $t0, $t0, $s0	#add old and new value of s0	

	li $v0, 10
	syscall
