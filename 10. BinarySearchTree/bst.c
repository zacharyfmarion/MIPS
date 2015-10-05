#include <stdio.h>
#include <stdlib.h>

struct node{
  int val;
  struct node *left;
  struct node *right;
};

void addNode(int x, struct node **curr){
  if (*curr == NULL){
    *curr = (struct node*) malloc(sizeof(struct node));
    (*curr)->val = x;
    (*curr)->left = NULL;
    (*curr)->right = NULL;
  }else if(x < (*curr)->val){
    addNode(x, &((*curr)->left));
  }else{
    addNode(x, &((*curr)->right));
  }
}

void printTree(struct node *curr){
  if (curr == NULL){
    return;
  }
  printf("%d ", curr->val);
  printTree(curr->left);
  printTree(curr->right);
}

int main(){
  struct node *head = NULL;
  addNode(5, &head);
  addNode(8, &head);
  addNode(19, &head);
  addNode(6, &head);
  addNode(19, &head);
  addNode(4, &head);
  addNode(1, &head);
  addNode(9, &head);
  addNode(23, &head);
  addNode(6, &head);
  printTree(head);
}
