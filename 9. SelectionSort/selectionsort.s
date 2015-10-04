.data
  array: .word 5 88 4 56 23 1 90

.text
  .globl main

main:
  jal selection_sort

  # End the program with a syscall
  li $v0, 10
  syscall

#######################################################
# ---- Function that sorts an array of integers ----- #
#######################################################

selection_sort:
  # TODO: We need to use a nested loop...shouldn't be too
  # bad but keep the code readable with indentations

  outer_loop:
    # if condition not met, branch to end of sort

    inner_loop:
      # if condition not met, branch to outer loop


    j inner_loop

  j outer_loop

  sort_end:
    # restore stack..
    jr $ra

######################################################
# ----- Function that swaps two ints in array ------ #
# @param $a0: a                                      #
# @param $a1: b                                      #
######################################################

swap:
  addi $sp, $sp, -12
  sw $s0, 0($sp)
  sw $s1, 4($sp)
  sw $s2, 8($sp)

  la $s0, array # now have a reference to the array
  add $s1, $a0, $s0 # $s1 = reference to array[a]
  lw $t0, 0($s1) # $t0 = array[a]

  add $t1, $a1, $s0
  add $s2, $a0, $s0 # $s2 = reference to array[b]
  lw $t1, 0($s2) # $t1 = array[b]

  sw $t0, 0($s2)
  sw $t1, 0($s1)

  lw $s0, 0($sp)
  lw $s1, 4($sp)
  lw $s2, 8($sp)
  addi $sp $sp, 12
  jr $ra
