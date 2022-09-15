#EvenSum.asm

		.data
vara: 	.word 1			
varb:	.word 0			
varc:	.word			
prompt: .asciiz "Enter the first integer: "
	.text
	
	# load addresses of variables a, b and c
main: 	la $a0, vara		
	la $a1, varb		
	la $a2, varc		
	# load values of variables a and b 
	lw $t0, ($a0)		
	lw $t1, ($a1)		
	
	#print prompt
	la $a0, prompt		
	li $v0, 4		
	syscall			
			
	#read integer
	li $v0, 5		
	syscall			
	la $t2, ($v0)
	
	
	
loop:	bgt $t0, $t2, endLoop	
	# loop body b = b + a;
	
	li $t4,2 
	
	div $t0, $t4
	mfhi $t3
	
	bne $t3, 0, else
	add $t1, $t1, $t0	
	sw $t1, ($a1)		
	
	# loop body a = a + 1;
else:	addi $t0, $t0, 1	
	sw $t0, ($a0)		
	# jump to loop condtion
	j loop			
	
endLoop:sw $t1, ($a2)		
	# print result in c
	lw $a0, ($a2)		
	li $v0, 1		
	syscall			
	# end program
	li $v0, 10		
	syscall			
