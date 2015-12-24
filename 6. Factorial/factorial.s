.data
  prompt: .asciiz "Enter a number: "

.text
  .globl main

main:

  li $v0, 4
  la $a0, prompt
  syscall

  li $v0, 5
  syscall

  move $a0, $v0
  jal factorial

  move $a0, $v0
  li $v0, 1
  syscall

  li $v0, 10
  syscall

factorial:
  addi $sp, $sp, -8
  sw $ra, 0($sp)
  sw $s0, 4($sp)

  move $s0, $a0

  bne $s0, $zero, recursive_step
  li $v0, 1 # base case
  j factorial_end

recursive_step:

  addi $a0, $a0, -1
  jal factorial
  mult $v0, $s0
  mflo $v0

factorial_end:
  lw $ra, 0($sp)
  lw $s0, 4($sp)
  addi $sp, $sp, 8

  jr $ra
