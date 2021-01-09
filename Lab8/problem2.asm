#problem2a.asm
#uses only main procedure to calculate the sum of first n squares
.data
.text
.globl main
    main:
        li $s0, 5   #n
        li $s1, 0   #initially the sum is set to 0
        li $t0, 1   #start with 1
        
        loop:               #loop to add ith square in ith run   
        mul $t1, $t0, $t0
        addi $t0, 1
        ble $t0, $s0, loop
        add $s1, $s1, $t1

        li $v0, 1           #display result
        move $a0, $s1         
        syscall

        li $v0, 10          #exit
        syscall