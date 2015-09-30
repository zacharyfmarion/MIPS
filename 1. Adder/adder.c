#include <stdio.h>

int add(int a, int b){
  return a + b;
}

int main(){
  int a, b;
  printf("Enter a number: ");
  scanf("%d", &a);
  printf("Enter another number: ");
  scanf("%d", &b);
  printf("%d", add(a,b));
}
