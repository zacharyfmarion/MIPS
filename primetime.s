.data
  lowPrompt: .asciiz "Enter a lower bound: "
  highPrompt: .asciiz "Enter an upper bound: "

.text
  .globl main

main:

  li $v0, 4
  la $a0, lowPrompt
  syscall

  li $v0, 5
  syscall
  move $t0, $v0 # store lower bound in temp register

  li $v0, 4
  la $a0, highPrompt
  syscall

  li $v0, 5
  syscall
  move $a1, $v0
  move $a0, $t0

  jal primeTime

  # print out how many primes between 4 and 10 there are

  move $a0, $v0
  li $v0, 1
  syscall

  li $v0, 10
  syscall

primeTime:
  addi $sp, $sp, -16
  sw $ra, 0($sp)
  sw $s0, 4($sp)
  sw $s1, 8($sp)
  sw $s2, 12($sp) # will hold the result

  # Move arguments into permanent registers

  move $s0, $a0
  move $s1, $a1

  add $s2, $zero, $zero

loop:

  beq $s0, $s1, loop_end

  li $t0, 1
  beq $s0, $t0, loop_continue # if lower val == 1, continue

  move $a0, $s0 # make $s0 the argument to isPrime macro
  jal isPrime

  add $s2, $s2, $v0 # res = res + isPrime($s0)

loop_continue:
  addi $s0, $s0, 1 # increment $s0
  j loop

loop_end:

  move $v0, $s2

  lw $ra, 0($sp)
  lw $s0, 4($sp)
  lw $s1, 8($sp)
  lw $s2, 12($sp)
  addi $sp, $sp, 16
  jr $ra

####################################################
# ---- Function to check if integer is prime ----- #
####################################################

isPrime:
  addi $sp, $sp, -8
  sw $ra, 0($sp)
  sw $s0, 4($sp)

  li $s0, 2 # $s0 starts at 2 and goes up to n-1

isPrimeLoop:

  beq $a0, $s0, prime # if $s0 = n, end

  div $a0, $s0
  mfhi $t0
  beq $t0, $zero, notPrime

  addi $s0, $s0, 1
  j isPrimeLoop

prime:
  addi $v0, $zero, 1
  j isPrimeEnd

notPrime:
  add $v0, $zero, $zero

isPrimeEnd:
  lw $ra, 0($sp)
  lw $s0, 4($sp)
  addi $sp, $sp, 8
  jr $ra
