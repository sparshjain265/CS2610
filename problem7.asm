#problem7.asm
   .data
        

	.text
	
	.globl main
main:
    
    li $t0, 0x4 #initially led2 is on

    rol $t0, $t0, 16    #turn on led18
    rol $t0, $t0, 14    #turn on led0

    ror $t0, $t0, 14    #turn on led18
    ror $t0, $t0, 16    #turn on led2

	li $v0, 10
	syscall
