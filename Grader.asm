#Grader.asm
		.data
printD: .asciiz "Your Grade is D"
prompt: .asciiz "Enter Marks: "
printA: .asciiz "Your Grade is A"
printB: .asciiz "Your Grade is B"
printC: .asciiz "Your Grade is C"
gradeA: .word 70
gradeB: .word 60
gradeC: .word 50
	.text
	
main:	la $a0, prompt
	li $v0, 4
	syscall
	
	#read Marks
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	lw $t1, gradeA
	lw $t2, gradeB
	lw $t3, gradeC
	
if:	blt  $t0, $t1, else
	la $a0, printA
	li $v0, 4
	syscall
	j endif
	
else:	blt  $t0, $t2, else1
	la $a0, printB
	li $v0, 4
	syscall
	j endif

else1:	blt  $t0, $t3, else2
	la $a0, printC
	li $v0, 4
	syscall
	j endif
	
else2:	la $a0, printD
	li $v0, 4
	syscall

endif:	li $v0, 10		# load immediate 10 (service 10: terminate program) to register 2
	syscall			# issue a system call to terminate program