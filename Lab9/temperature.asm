#temperature.asm
.data
	error: .word 0:50
	temp: .asciiz "Enter Temperature: "
	err: .asciiz "\nError: "
.text
.globl main
   main:
   
	li $v0, 4
	la $a0, temp
	syscall
	li $v0, 5		#get first temperature
	syscall
	move $t0, $v0	#t0 used to store previous temperature to calculate error

	li $v0, 4
	la $a0, temp
	syscall
	li $v0, 5		#get second temperature
	syscall
	
	sub $t1, $v0, $t0		#get first error
	la $s0, error			#get address of array of errors
	sw $t1, ($s0)			#store error in array
	li $a1, 1				#store the number of errors
	move $t0, $v0			#update previous temperature

	loop1:
		beq $t1, 0, print	#if error is 0, temperature stabilized
		li $v0, 4
		la $a0, temp
		syscall
		li $v0, 5			#get next temperature
		syscall
		sub $t1, $v0, $t0	#get next errors
		addi $s0, 4			#get address of next element in array
		sw $t1, ($s0)		#store error in array
		addi $a1, 1			#increment the number of errors
		move $t0, $v0		#update previous temperature
		j loop1
	
	print:
		li $t0, 0					#initialize counter
		la $t1, error				#initialize address of array
		loop2:
			beq $t0, $a1, exit	#exit after printing all errors
			li $v0, 4
			la $a0, err
			syscall
			li $v0, 1				#print ith error
			lw $a0, ($t1)
			syscall
			addi $t0, 1				#increment counter
			addi $t1, 4				#increment address
			j loop2
	
	exit:
		li $v0, 10
		syscall


	