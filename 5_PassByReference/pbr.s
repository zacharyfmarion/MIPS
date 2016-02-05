.data
  .align 2
  x: .word 9
  y: .word 4
  STR_NEWLINE: .asciiz "\n"
  COMMA: .asciiz ", "

.text
  .align 2
  .globl main

main:
  # Load locations in memory of x and y global variables
  la $s0, x
  la $s1, y

  # printing x
  li $v0, 1
  lw $a0, 0($s0)
  syscall

  # formatting
  li $v0, 4
  la $a0, COMMA
  syscall

  # printing y
  li $v0, 1
  lw $a0, 0($s1)
  syscall

  # newline
  li $v0, 4
  la $a0, STR_NEWLINE
  syscall

  move $a0, $s0
  move $a1, $s1
  jal swap

  # printing x
  li $v0, 1
  lw $a0, 0($s0)
  syscall

  # formatting
  li $v0, 4
  la $a0, COMMA
  syscall

  # printing y
  li $v0, 1
  lw $a0, 0($s1)
  syscall

  # Exit program exectution
  li $v0, 10
  syscall

swap:
  # Allocate space in stack to save registers
  addi $sp, $sp, -8
  sw $s0, 0($sp)
  sw $s1, 4($sp)

  lw $s0, 0($a0) # s0 = *x
  lw $s1, 0($a1) # s1 = *y

  sw $s0, 0($a1) # *y = *x
  sw $s1, 0($a0) # *x = *y

  # Pop saved variables off the stack
  lw $s0, 0($sp)
  lw $s1, 4($sp)
  addi $sp, $sp, 8
  # Jump to return address
  jr $ra
