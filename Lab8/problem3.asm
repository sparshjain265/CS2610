#problem3.asm
#checks delay slots and compares performance with and without delayed load instruction option turned on
.data
	num1: .word	65
	num2:	.word 15
.text
.globl main
   main:

		lw $t1, num1
		lw $t2, num2
		lw $t1, num2
		li $v0, 10
		add $t3, $t1, $0
		add $t4, $t1, $0

		
		syscall