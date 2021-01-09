#problem4.asm
#find determinant of 2x2 matrix using procedure
#use row major implementation of 2D array

.data
	matrix:	.word 	2, 3
				.word		3, 4
	output: .asciiz "Determinant is: "

.text
.globl main
   main:
		la $a0, matrix		#base address
		
		jal determinant	#calculate determinant

		move $t0, $v0		#extracting output

		li $v0, 4			#display output
		la $a0, output
		syscall
		li $v0, 1
		move $a0, $t0
		syscall

		li $v0, 10
		syscall

	determinant:
		addi $sp, -4	#store return point address
		sw $ra, ($sp)
		
		li $a1, 0		#row
		li $a2, 0		#column
		jal value		#get value
		move $t1, $v0 	#access value

		li $a1, 0		#row
		li $a2, 1		#column
		jal value		#get value
		move $t2, $v0 	#access value

		li $a1, 1		#row
		li $a2, 0		#column
		jal value		#get value
		move $t3, $v0 	#access value

		li $a1, 1		#row
		li $a2, 1		#column
		jal value		#get value
		move $t4, $v0 	#access value

		mul $t5, $t1, $t4	#calculate determinant
		mul $t6, $t2, $t3	
		sub $v0, $t5, $t6

		lw $ra, ($sp)
		addi $sp, 4
		jr $ra

	value:
		mul $t0, $a1, 2	#row index * column size
		add $t0, $t0, $a2	#add column index
		mul $t0, $t0, 4	#multiply by the size of data
		add $t0, $t0, $a0	#add base address
		lw $v0, ($t0)		#access value at the calculate address in the return register
		jr $ra