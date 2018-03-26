# problem2.asm
#   .data
#   str1: .ascii "123456789abcedef"
#   str2: .ascii "123456789ABCDEF"
#	
#	.text
#	
#	.globl main
#main:
#    la $a0, str1
#    la $a1, str2
#
#    li $t0, 0
#    li $t1, 1
#    li $t2, 2
#    	
#
#
#	li $v0, 10
#	syscall

#problem2.asm
    .data
    str1: .ascii "123456789abcedef"
    str2: .ascii "123456789ABCDEF"

    .text

    .globl main
main:
    la $s0, str1
    la $s1, str2

    lb $t0, 0($s0)
    lb $t1, 1($s0)
    lb $t2, 2($s0)

    sb $t3, 14($s1)
    sb $t4, 13($s1)
    sb $t5, 12($s1)

    lhu $t6, 0($s1)
    lhu $t7, 2($s1)
    sh $t8, 14($s0)

    lw $t9, 12($s1)
    sw $s2, 12($s0)

    li $v0, 10
    syscall
