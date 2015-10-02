#include <stdio.h>
#include <stdlib.h>

// Node struct for the linked list
struct node{
  int val;
  struct node *next;
};

// Create a linked list node
void createNode(int val, struct node** newNode){
  *newNode = (struct node*) malloc(sizeof(struct node));
  (*newNode)->val = val;
  (*newNode)->next = NULL;
}

// Insert an element in the correct location in the linked list
void insert(struct node **head, struct node *newNode){
  // if first entry in the linkedlist
  if (*head == NULL){
    *head = newNode; // make pointer to head the node
    // printf("first\n");
  }
  // if node value is greater than *head value
  else if(newNode->val > (*head)->val){
    newNode->next = *head;
    *head = newNode; // make newNode the new head
    // printf("new head\n");
  }
  // otherwise iterate over the list until correct place is found
  else{
    struct node* p = *head;
    while(p->next != NULL){
      if (newNode->val > p->next->val){
        // printf("inserted in middle\n");
        newNode->next = p->next;
        p->next = newNode;
        return;
      }
      p = p->next;
    }
    // printf("inserted at end\n");
    p->next = newNode;

  }
}

// printing the list
void printList(struct node **head){
  while (*head){
    if ((*head)->next == NULL){
      printf("%d", (*head)->val);
    }else{
      printf("%d, ", (*head)->val);
    }
    *head = (*head)->next;
  }
}

// Freeing the list after I'm done with it
void freeList(struct node **head){
  struct node *curr;
  while((curr = *head) != NULL){
    (*head) = (*head)->next;
    free(curr);
  }
}

// MAIN function
int main(){
  // make a head
  struct node *head, *entry1, *entry2, *entry3;
  head = NULL;
  createNode(8, &entry1);
  createNode(4, &entry2);
  createNode(5, &entry3);
  insert(&head, entry1); // insert entry into the linked list
  insert(&head, entry2);
  insert(&head, entry3);
  // Print out the created list
  printList(&head);
  // Free the memory in the list
  freeList(&head);
  // Lastly free the head
  free(head);
}
