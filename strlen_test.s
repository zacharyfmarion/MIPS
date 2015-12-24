.data
  word: .asciiz "a"

.text
  .globl main
  .align 2

main:
  la $a0, word
  jal strlen

  move $a0, $v0                   # move the length of the string into the arguement for the syscall
  li $v0, 1                       # indicates that we are printing out an integer
  syscall                         # print out the length of the string

  li $v0, 10
  syscall

strlen:
  addi $sp, $sp, -8
  sw $ra, 0($sp)
  sw $s0, 4($sp)

  lbu $s0, 0($a0)
  bnez $s0, recurse
  li $v0, 1
  j end

recurse:
  addi $a0, $a0, 1
  jal strlen
  add $v0, $v0, 1

end:
  addi $sp, $sp, 8
  lw $ra, 0($sp)
  lw $s0, 4($sp)
  jr $ra
