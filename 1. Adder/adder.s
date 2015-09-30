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
  jal adder

  move $a0, $v0
  li, $v0, 1
  syscall

  # end the program

  li $v0, 10
  syscall

  ########################################
  # ---- Add two integers together ----- #
  # @param $a0: first number             #
  # @param $a1: second number            #
  ########################################

adder:
  add $v0, $a0, $a1
  jr $ra
