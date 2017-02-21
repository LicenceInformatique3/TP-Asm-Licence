 .text
 main:
 # Print msg1
 li $v0,4 # print_string syscall code = 4
 la $a0, msg1 
 syscall
 #
 # Get N from user and save
 li $v0,5 # read_int syscall code = 5
 syscall 
 move $t0,$v0 # syscall results returned in $v0 = n
 #
 # Initialize registers
 li $t1, 1 # initialize res
 li $t2,1 # constante 1
 #
  # Main loop body
 fact_tail:
 beq $t0,$t2,exit
 mul $t1,$t1,$t0
 sub $t0,$t0,$t2
 j fact_tail
 # Exit routine - print msg2
 exit:
 li $v0, 4 # print_string syscall code = 4
 la $a0, msg2
 syscall
 #
 # Print sum
 li $v0,1 # print_string syscall code = 4
 move $a0, $t1
 syscall
 #
 # Print newline
 li $v0,4 # print_string syscall code = 4
 la $a0, lf
 syscall
 li $v0,10 # exit
 syscall
 #
 # Start .data segment (data!)
 .data
 msg1: .asciiz "Number of integers (N)? "
 msg2: .asciiz "Facto = "
 lf: .asciiz "\n"
