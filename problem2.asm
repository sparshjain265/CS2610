# problem2.asm
   .data
   	str1: .ascii "123456789abcedef"
    	str2: .ascii "123456789ABCDEF"
    	str3: .asciiz "123456789abcedef"
    	str4: .asciiz "123456789ABCDEF"
	
	.text
	
	.globl main
main:
	la $t0, str1
	la $t1, str2
	la $t2, str3
	la $t3, str4	


	li $v0, 10
	syscall