.data
  prompt1: .asciiz "Enter a number: "
  prompt2: .asciiz "Enter another number: "

.text
  .globl main

main:
  # Get first number

  li $v0, 4
  la $a0, prompt1
  syscall

  li, $v0, 5
  syscall
  move $s0, $v0

  # Get second number

  li $v0, 4
  la $a0, prompt2
  syscall

  li, $v0, 5
  syscall
  move $s1, $v0

  # loading the arguments and calling the adder function

  move $a0, $s0
  move $a1, $s1
  jal bitwise_adder

  move $a0, $v0
  li, $v0, 1
  syscall

  # end the program

  li $v0, 10
  syscall

######################################################################
# ---- Add two integers together using only bitwise operations ----- #
# @param $a0: first number                                           #
# @param $a1: second number                                          #
######################################################################

bitwise_adder:
  addi $sp, $sp, -12
  sw $ra, 0($sp)
  sw $s0, 4($sp)
  sw $s1, 8($sp)

  xor $s0, $a0, $a1 # $s0 holds the sum
  and $s1, $a0, $a1 # $s1 holds the carry

adder_loop:
  beq $s1, $zero, adder_end

  sll $s1, $s1, 1 # carry = carry << 1
  xor $t0, $s0, $s1 # temp = sum ^ carry
  and $s1, $s0, $s1 # carry = sum & carry
  move $s0, $t0 # sum = temp
  j adder_loop

adder_end:
  move $v0, $s0 # move sum into return value

  # Restore the original values of the registers from the stack

  lw $ra, 0($sp)
  lw $s0, 4($sp)
  lw $s1, 8($sp)
  addi $sp, $sp, 12

  jr $ra
