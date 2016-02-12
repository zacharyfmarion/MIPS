.data
  .align 2
  array: .word 5 88 4 56 23 1 90
  COMMA: .asciiz ", "
  NEWLINE: .asciiz "\n"

.text
  .globl main

main:
  # Sort the array
  jal printArray

  # Print newline
  li $v0, 4                   # system call #4 - print string
  la $a0, NEWLINE
  syscall                     # execute

  jal selection_sort
  # Print the sorted array
  jal printArray
  # End the program with a syscall
  li $v0, 10
  syscall

#######################################################
# ---- Function that sorts an array of integers ----- #
#######################################################

selection_sort:
  addi $sp, $sp, -16
  sw $ra, 0($sp)
  sw $s0, 4($sp)
  sw $s1, 8($sp)
  sw $s2, 12($sp)

  la $s0, array
  addi $s0, $s0, 28
  la $s1, array

  outer_loop:
    # if condition not met, branch to end of sort
    beq $s1, $s0, sort_end

    la $s2, array

    inner_loop:
      # if condition not met, branch to outer loop
      beq $s2, $s0, outer_loop_end

      lw $t0, 0($s1)
      lw $t1, 0($s2)

      # if array[i] < array[j]
      bgt $t0, $t1, inner_loop_end

      move $a0, $s1
      move $a1, $s2
      jal swap

    inner_loop_end:
      addi $s2, $s2, 4    # Increment $t1 (j++)
      j inner_loop

  outer_loop_end:
    addi $s1, $s1, 4      # Increment $t0 (i++)
    j outer_loop

  sort_end:
    # restore stack..
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    addi $sp, $sp, 16
    jr $ra

######################################################
# ----- Function that swaps two ints in array ------ #
# @param $a0: address of a                           #
# @param $a1: address of b                           #
######################################################

swap:
  addi $sp, $sp, -8
  sw $s0, 0($sp)
  sw $s1, 4($sp)
  # getting array[i], array[j]
  lw $s0, 0($a0)
  lw $s1, 0($a1)
  # Switching the elements
  sw $s0, 0($a1)
  sw $s1, 0($a0)

  lw $s0, 0($sp)
  lw $s1, 4($sp)
  addi $sp $sp, 8
  jr $ra

printArray:

  la $t0, array
  la $t1, array
  addi $t1, $t1, 28

  print_loop:
    beq $t1, $t0, print_end
    lw $a0, 0($t0)
    li $v0, 1
    syscall

    li $v0, 4               # system call #4 - print string
    la $a0, COMMA
    syscall                 # execute

    addi $t0, $t0, 4
    j print_loop

print_end:
  jr $ra
