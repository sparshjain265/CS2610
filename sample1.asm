# sample1.asm
.data
.text
.globl main
main:
addi $t1, $zero, 97  #Can also be written as addi $9, $0, 97
li $v0, 10
syscall