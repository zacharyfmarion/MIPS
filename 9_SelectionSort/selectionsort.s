.data
  .align 2
  array: .word 5 88 4 56 23 1 90
  COMMA: .asciiz ", "
  NEWLINE: .asciiz "\n"

.text
  .globl main

main:
  # Print the original array
  jal printArray

  # Print newline
  li $v0, 4                   # system call #4 - print string
  la $a0, NEWLINE
  syscall                     # execute

  # Call the sort function
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
  # Savingc callee saved registers in stack
  addi $sp, $sp, -16
  sw $ra, 0($sp)
  sw $s0, 4($sp)
  sw $s1, 8($sp)
  sw $s2, 12($sp)

  la $s0, array               # Load address of array into $s0
  addi $s0, $s0, 28           # $s0 = address of last el
  la $s1, array               # $s1 = address of first el (for outer loop)

  outer_loop:
    # if at end of list, branch to end of sort
    beq $s1, $s0, sort_end

    la $s2, array             # $s2 = address of first el (for inner loop)

    inner_loop:
      # if at end of list, branch to outer loop end
      beq $s2, $s0, outer_loop_end

      # Load contents of array[i], array[j]
      lw $t0, 0($s1)          # $t0 = array[i]
      lw $t1, 0($s2)          # $t1 = array[j]

      # if array[i] < array[j]
      bgt $t0, $t1, inner_loop_end

      # pass in address locations of array[i], array[j] into swap
      move $a0, $s1
      move $a1, $s2
      jal swap

    # End of inner loop
    inner_loop_end:
      addi $s2, $s2, 4    # Increment $t1 (j++)
      j inner_loop

  # End of outer loop
  outer_loop_end:
    addi $s1, $s1, 4      # Increment $t0 (i++)
    j outer_loop

  sort_end:
    # restore registers from stack
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    addi $sp, $sp, 16
    jr $ra                # Exit function

######################################################
# ----- Function that swaps two ints in array ------ #
# @param $a0: address of a                           #
# @param $a1: address of b                           #
######################################################

swap:
  # getting array[i], array[j]
  lw $t0, 0($a0)
  lw $t1, 0($a1)
  # Switching the elements
  sw $t0, 0($a1)
  sw $t1, 0($a0)
  # Exiting function
  jr $ra

#######################################################
# ---- Function that prints an array of integers ---- #
#######################################################

printArray:

  # Load address of first el and last el + 4
  la $t0, array
  la $t1, array
  addi $t1, $t1, 28

  print_loop:
    # End loop if at end of array
    beq $t1, $t0, print_end
    lw $a0, 0($t0)
    li $v0, 1
    syscall                 # Printing the integer

    # Printing a comma
    li $v0, 4               # system call #4 - print string
    la $a0, COMMA
    syscall                 # execute

    # Incrementing address by 4 bytes
    addi $t0, $t0, 4
    j print_loop

print_end:
  jr $ra
