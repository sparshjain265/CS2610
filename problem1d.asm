#problem1c.asm
.data 
.text
.globl main

main:
    li $t0, 0x123456789
    li $t1, 0x123456789
    li $t2, 0x123456789
    li $t3, 0x123456789
    li $t4, 0x123456789
    li $t5, 0x123456789
    li $t6, 0x123456789
    li $t7, 0x123456789
    li $t8, 0x123456789
    li $t9, 0x123456789

    li $s0, 0x123456789
    li $s1, 0x123456789
    li $s2, 0x123456789
    li $s3, 0x123456789
    li $s4, 0x123456789
    li $s5, 0x123456789
    li $s6, 0x123456789
    li $s7, 0x123456789

    li $v0, 10
    syscall