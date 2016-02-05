#include <stdio.h>

// Global variables
int x = 9;
int y = 4;

void swap(int *a, int *b){
  int temp = *a;
  *a = *b;
  *b = temp;
}

int main(){
  printf("x=%d, y=%d\n", x, y);
  swap(&x, &y);
  printf("x=%d, y=%d\n", x, y);
}
