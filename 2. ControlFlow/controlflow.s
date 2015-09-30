.data
  prompt: .asciiz "Enter an upper bound: "
  STR_NEWLINE: .asciiz "\n"

.text
  .globl main

main:

  li $v0, 4
  la $a0, prompt
  syscall

  li $v0, 5
  syscall

  move $a0, $v0
  jal loop

  li $v0, 10
  syscall

loop:
  addi $sp, $sp, -12
  sw $ra, 0($sp)
  sw $s0, 4($sp)
  sw $s1, 8($sp)

  add $s0, $zero, $zero # $s0 is the counter
  move $s1, $a0 # store the argument into $s1

loop_main:
  beq $s0, $s1, loop_end

  # print the int
  move $a0, $s0
  li $v0, 1
  syscall

  # print newline after int
  li $v0, 4
  la $a0, STR_NEWLINE
  syscall

  addi $s0, $s0, 1 # counter ++
  j loop_main

loop_end:
  # Restore the original values of the registers from the stack

  lw $ra, 0($sp)
  lw $s0, 4($sp)
  lw $s1, 8($sp)
  addi $sp, $sp, 12

  jr $ra
