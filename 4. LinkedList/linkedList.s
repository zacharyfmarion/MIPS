.data
  prompt: .asciiz "Enter a number: "

.text
  .globl main

main:
  

  li $v0, 10
  syscall
