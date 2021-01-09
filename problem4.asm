 #problem4.asm
   .data
		my_roll_no: .word 1126
		str1:		.asciiz "My roll no is: "
		str2:		.asciiz "\nPlease enter your name: "
		name:		.space 40
		str3:		.asciiz "Please enter your roll no: " 
		str4:		.asciiz "Your name is: "
		str5:		.asciiz "Your roll no is: "
		str6:		.asciiz "\nPlease enter a floating point number: "
		str7:		.asciiz "You have entered: "

	.text
	
	.globl main
main:

	li $v0, 4				#print string
	la $a0, str1
	syscall
	li $v0, 1				#print integer
	lw $a0, my_roll_no
	syscall

	li $v0, 4				#print string
	la $a0, str2
	syscall
	li $v0, 8				#read string
	la $a0, name
	la $a1, 40
	syscall

	li $v0, 4				#print string
	la $a0, str3
	syscall
	li $v0, 5				#read integer(word)
	syscall					
	move $s0, $v0			#store the integer read from v0 to s0

	li $v0, 4				#print name
	la $a0, str4
	syscall
	li $v0, 4
	la $a0, name 
	syscall
	li $v0, 4				#print roll no
	la $a0, str5
	syscall
	li $v0, 1
	la $a0, ($s0)
	syscall

	li $v0, 4				#print string
	la $a0, str6
	syscall
	li $v0, 6				#read float
	syscall
	li $v0, 4				#print string
	la $a0, str7
	syscall
	li $v0, 2				#print float
	mov.s $f12, $f0
	syscall

	li $v0, 10
	syscall
