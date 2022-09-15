#FloatAdder.asm

	.data
msg1: .asciiz "Enter the first float point number: "
msg2: .asciiz "Enter the second first float point number: "
tot: .asciiz "Total is : "
	.text
	#print prompt
main:	la $a0, msg1		
	li $v0, 4		
	syscall			
	#read Float
	li $v0, 6		
	syscall			
	mov.s $f1,$f0		
	#print message
	la $a0, msg2		
	li $v0, 4		
	syscall			
	#read Float
	li $v0, 6		
	syscall			
	mov.s $f2,$f0		
	#print message
	la $a0,tot		
	li $v0,4		
	syscall			
	#print float
	add.s $f12,$f2,$f1	
	li $v0, 2		
	syscall			
	#end program
	li $v0, 10		
	syscall			
