#problem1.asm
#uses procedures to compute x raised to the power y
.data
.text
.globl main
	main:
		li $s0, 7	#x
		li $s1, 3	#y

		move $a0, $s0	#setting x as first argument
		move $a1, $s1	#setting y as second argument

		jal power		#call function power to calculate x raised to the power y

		move $a0, $v0	#display the returned value
		li $v0, 1		#print integer
		syscall

		li $v0, 10		#exit
		syscall

	power:
		beq $a1, 0, terminate	#if power is 1, go to terminate label

		addi $a1, -1				#reduce power by 1
		addi $sp, -4				#store the current caller's address in stack
		sw $ra, ($sp)			
		jal power					#recursive call to calculate x raised to power y-1
		lw $ra, ($sp)				#restore the current caller's address in stack
		addi $sp, 4
		
		mul $v0, $v0, $a0			#multiply x raised to power y-1 with x to get x raised to power y
		jr $ra						#return

		terminate:					# if power is 1, x power y is x itself
		li $v0, 1					#setting return values
		jr $ra						#go back to calling function

