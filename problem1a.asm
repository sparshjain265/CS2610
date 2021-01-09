#problem1a.asm
    .data
    .text
    .globl main
main:
    li $t0, 0xf
    li $t1, 0xf
    li $t2, 0xf
    li $t3, 0xf
    li $t4, 0xf
    li $t5, 0xf
    li $t6, 0xf
    li $t7, 0xf
    li $t8, 0xf
    li $t9, 0xf

    li $s0, 0xa
    li $s1, 0xa
    li $s2, 0xa
    li $s3, 0xa
    li $s4, 0xa
    li $s5, 0xa
    li $s6, 0xa
    li $s7, 0xa

    move $s4, $t6
    move $t5, $s7

    li $v0, 10
    syscall