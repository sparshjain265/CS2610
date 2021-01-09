#problem1.asm
   .data
		marks: .word 0:4
		newLine:	.asciiz "\n"
	.text
	
	.globl main
main:
   li $s0, 7
   li $s1, 6
   li $s2, 9
   li $s3, 5

	la $t0, marks
	li $t1, 0
	sw $s0, ($t0)
	sw $s1, 4($t0)
	sw $s2, 8($t0)
 	sw $s3, 12($t0)

	loop:
		beq $t1, 4, finish
		li $v0, 1
		lw $a0, ($t0)
		syscall
		li $v0, 4
		la $a0, newLine
		syscall
		addi $t0, 4
		addi $t1, 1
		j loop
	
	finish:
		li $v0, 10
		syscall
