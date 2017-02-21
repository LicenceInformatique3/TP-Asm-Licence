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
 move $t0,$v0 # syscall results returned in $v0 t0 = b
 
  # Print msg3
 li $v0,4 # print_string syscall code = 4
 la $a0, msg3 
 syscall
 
 li $v0,5 # read_int syscall code = 5
 syscall 
 move $t3,$v0 # syscall results returned in $v0 t3 = a
 
 # Initialize registers
 li $t2, 0 # initialize sum p
 li $t1, 2 # initialize 2
 
 # Main loop body
 loop:
 div $t0,$t1 # b%2
 Mfhi $t4 #reste de b%2
 Beq $t4,1,cond
 continue:
 mul $t3,$t3,$t1 # $t3 = $t3 * 2 
 div $t0,$t0,$t1 # b = b/2
 Blez  $t0,exit
 j loop
 #
 # hi Exit routine - print msg2
 exit:
 li $v0, 4 # print_string syscall code = 4
 la $a0, msg2
 syscall
 #
 # Print sum
 li $v0,1 # print_string syscall code = 4
 move $a0, $t2
 syscall
 #
 # Print newline
 li $v0,4 # print_string syscall code = 4
 la $a0, lf
 syscall
 li $v0,10 # exit
 syscall
 #
 
 cond:
 add $t2,$t2,$t3 # p = p +a
 j continue
 
 # Start .data segment (data!)
 .data
 msg1: .asciiz "b = "
 msg2: .asciiz "Mul = "
 msg3: .asciiz "a = "
 lf: .asciiz "\n"
