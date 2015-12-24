.data
  array: .word 0, 1, 2, 3, 4, 5, 6

.text
  .globl main
  .align 2

main:
  la $a0, array
  jal binarySearch
  move $s0, $v0 # copy res into $s0

  # print out res

  # end program
  li $v0, 10
  syscall

binarySearch:
  # recursive alg to find element in an array
