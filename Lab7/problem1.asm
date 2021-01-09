#problem1.asm
   .data
		str1:	.asciiz "A is less than B\n"
		str2:	.asciiz "B is less than A\n"
	.text
	
	.globl main
main:
   
	li $s0, 0xffffffff	#A
	li $s1, 0x0000000f	#B

	comp1:
		slt $t1, $s0, $s1		#Signed comparision
		beq $t1, 1, msg1a		#print str1 if true
		beq $t1, 0, msg1b		#print str2 if false
	comp2:
		sltu $t1, $s0, $s1 	#unsigned comparision
		beq $t1, 1, msg2a		#print str1 if true
		beq $t1, 0, msg2b		#print str2 if false

	msg1a:
		li $v0, 4
		la $a0, str1
		syscall
		j comp2
	
	msg1b:
		li $v0, 4
		la $a0, str2
		syscall
		j comp2
	
	msg2a:
		li $v0, 4
		la $a0, str1
		syscall
		j finish

	msg2b:
		li $v0, 4
		la $a0, str2
		syscall
		j finish

	finish:
		li $v0, 10
		syscall
