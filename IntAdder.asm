#readAndPrintInteger.asm
	.data
msg1: .asciiz "Enter the first integer: "
msg2: .asciiz "Enter the second integer: "
tot: .asciiz "Total is :"
	.text
	#print prompt
main:	la $a0, msg1		# load address of prompt string to register 4
	li $v0, 4		# load immediate 4 (service 4 - print string) to register 2
	syscall			# issue a system call to print prompt
	#read integer
	li $v0, 5		# load immediate 5 (service 5 - read integer) to register 2
	syscall			# issue a system call to read integer
	add $t0, $v0, $zero	# copy integer in register 2 to register 8
	#print message
	la $a0, msg2		# load address of message string to register 2
	li $v0, 4		# load immediate 4 (service 4 - print string) to register 2
	syscall			# issue a system call to print message
	#read integer
	li $v0, 5		# load immediate 5 (service 5 - read integer) to register 2
	syscall			# issue a system call to read integer
	add $t1, $v0, $zero	# copy integer in register 2 to register 8
	#print message
	la $a0,tot
	li $v0,4
	syscall
	#print integer
	add $a0, $t0, $t1	# copy integer in register 8 to register 2
	li $v0, 1		# load immediate 1 (service 1 - print integer) to register 2
	syscall			# issue a system call to print integer
	#end program
	li $v0, 10		# load immediate 10 (service 10 - terminate program) to register 2
	syscall			# issue a system call to terminate program
