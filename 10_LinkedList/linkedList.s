.data
  head: .word 0
  NEWLINE: .asciiz "\n"

.text
	.globl main

main:
  # Insert node into linked list
  li $a0, 4
  jal createNode
  move $a0, $v0
  jal insertNode

  li $a0, 3
  jal createNode
  move $a0, $v0
  jal insertNode

  li $a0, 5
  jal createNode
  move $a0, $v0
  jal insertNode

  jal printList

	# Exit the program
	li		$v0, 10
	syscall

createNode:
  addi  $sp, $sp, -8
  sw    $ra, 0($sp)
  sw    $s0, 4($sp)

  move $t0, $a0

  li $v0, 9
  li $a0, 8
  syscall

  sw $t0, 0($v0)      # set node value
  sw $zero, 4($v0)    # node->next = NULL

  lw    $s0, 4($sp)
  lw    $ra, 0($sp)
  addi  $sp, $sp, 8
  jr    $ra

# Insert node into the linked list
insertNode:
  addi  $sp, $sp, -8
  sw    $ra, 0($sp)
  sw    $s0, 4($sp)

  # $a0 stores address of the node
  move $s0, $a0
  # temp reference to head
  lw $t0, head

  bnez $t0, insert_while
  # if head not defined
  sw $s0, head
  j insertNode_end

  insert_while:
    lw $t1, 4($t0)
    beqz $t1, insert_while_end
    move $t0, $t1
    j insert_while

  insert_while_end:
    sw $s0, 4($t0)

insertNode_end:
  lw    $s0, 4($sp)
  lw    $ra, 0($sp)
  addi  $sp, $sp, 8
  jr    $ra

# Print the linked list
printList:
  addi  $sp, $sp, -8
  sw    $ra, 0($sp)
  sw    $s0, 4($sp)

  # Get ref to head
  lw $s0, head

  print_while:
    beqz $s0, printList_end

    li    $v0, 1    # system call #1 - print integer
    lw $a0, 0($s0)
    syscall        # execute

    li    $v0, 4    # system call #4 - print string
    la    $a0, NEWLINE
    syscall        # execute

    # node = node -> next
    lw $s0, 4($s0)
    j print_while

printList_end:
  lw    $s0, 4($sp)
  lw    $ra, 0($sp)
  addi  $sp, $sp, 8
  jr    $ra
