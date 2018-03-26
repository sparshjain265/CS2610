#problem1.asm
   .data
		sgpa:	.float 8.96, 7.64, 9.4, 7.8
		newLine: .asciiz "\n"
	.text
	
	.globl main
main:
   la $t0, sgpa
	li $t1, 0			#counter
	li.s $f0, 0.0		#sum
	li.s $f1, 1.0 		#product
	li.s $f2, 0.0 		#average
	l.s $f3, ($t0) 	#minimum
	l.s $f4, ($t0)		#maximum


	loop:
		beq $t1, 4, average
		l.s $f5, ($t0)
		add.s $f0, $f0, $f5
		mul.s $f1, $f1, $f5
		c.lt.s $f5, $f3
		bc1t min
		next:
		c.lt.s $f4, $f5
		bc1t max
		now:
		addi $t0, 4
		addi $t1, 1
		j loop

	min:
		mov.s $f3, $f5
		j next
	
	max:
		mov.s $f4, $f5
		j now

	average:
		li.s $f6, 4.0
		div.s $f2, $f0, $f6

	li $v0, 2				#print float
	mov.s $f12, $f0		#print sum
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
	li $v0, 2				#print float
	mov.s $f12, $f1		#print product
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
	li $v0, 2				#print float
	mov.s $f12, $f2		#print average
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
	li $v0, 2				#print float
	mov.s $f12, $f3		#print minimum
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
	li $v0, 2				#print float
	mov.s $f12, $f4		#print maximum
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
	
		li $v0, 10
		syscall
