#problem1c.asm
.data 
.text
.globl main

main:
    li $t0, 0xffffffff
    li $t1, 0xffffffff
    li $t2, 0xffffffff
    li $t3, 0xffffffff
    li $t4, 0xffffffff
    li $t5, 0xffffffff
    li $t6, 0xffffffff
    li $t7, 0xffffffff
    li $t8, 0xffffffff
    li $t9, 0xffffffff

    li $s0, 0xaaaaaaaa
    li $s1, 0xaaaaaaaa
    li $s2, 0xaaaaaaaa
    li $s3, 0xaaaaaaaa
    li $s4, 0xaaaaaaaa
    li $s5, 0xaaaaaaaa
    li $s6, 0xaaaaaaaa
    li $s7, 0xaaaaaaaa

    li $v0, 10
    syscall