#problem1b.asm
.data 
.text
.globl main

main:
    li $t0, 0xffff
    li $t1, 0xffff
    li $t2, 0xffff
    li $t3, 0xffff
    li $t4, 0xffff
    li $t5, 0xffff
    li $t6, 0xffff
    li $t7, 0xffff
    li $t8, 0xffff
    li $t9, 0xffff

    li $s0, 0xaaaa
    li $s1, 0xaaaa
    li $s2, 0xaaaa
    li $s3, 0xaaaa
    li $s4, 0xaaaa
    li $s5, 0xaaaa
    li $s6, 0xaaaa
    li $s7, 0xaaaa

    li $v0, 10
    syscall