#problem5.asm
   .data
        str1:   .asciiz "Enter first number : "
        str2:   .asciiz "Enter second number : "
        str3:   .asciiz "Sum = "
        str4:   .asciiz "\nDifference = "
        str5:   .asciiz "\nProduct = "
        str6:   .asciiz "\nQuotient = "
        str7:   .asciiz "\nRemainder = "
        str8:   .asciiz "\n 8*4 = "
        str9:   .asciiz "\n 8/4 = "

	.text
	
	.globl main
main:
    li $v0, 4       #get first number
    la $a0, str1
    syscall
    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 4       #get second number
    la $a0, str2
    syscall
    li $v0, 5
    syscall
    move $s1, $v0

    add $s2, $s1, $s0   #Add s0 & s1 in s2
    sub $s3, $s0, $s1   # s1-s0 = s3
    mult $s1, $s0       #multiply s1 & s0
    mflo $s4            #less significant bits of multiplication
    mfhi $s5            #more significant bits of multiplication
    div $s0, $s1        #s0/s1
    mflo $s6            #quotient
    mfhi $s7            #remainder
    li $t0, 8           #storing 8 in t0
    sll $t1, $t0, 2     #left shift t0 by 2 and store in t1 = multiply by 4
    srl $t2, $t0, 2     #right shift t0 by 2 and store in t2 = divide by 4

    li $v0, 4
    la $a0, str3
    syscall
    li $v0, 1
    la $a0, ($s2)
    syscall
    li $v0, 4
    la $a0, str4
    syscall
    li $v0, 1
    la $a0, ($s3)
    syscall
    li $v0, 4
    la $a0, str5
    syscall
    li $v0, 1
    la $a0, ($s5)
    syscall
    li $v0, 1
    la $a0, ($s4)
    syscall
    li $v0, 4
    la $a0, str6
    syscall
    li $v0, 1
    la $a0, ($s6)
    syscall
    li $v0, 4
    la $a0, str7
    syscall
    li $v0, 1
    la $a0, ($s7)
    syscall
    li $v0, 4
    la $a0, str8
    syscall
    li $v0, 1
    la $a0, ($t1)
    syscall
    li $v0, 4
    la $a0, str9
    syscall
    li $v0, 1
    la $a0, ($t2)
    syscall

	li $v0, 10
	syscall
