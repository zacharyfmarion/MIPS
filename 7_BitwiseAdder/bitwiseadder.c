#include <stdio.h>

int add(int a, int b){
  int sum = a ^ b;
  int carry = a & b;
  while(carry != 0){
    carry = carry << 1;
    int temp = sum ^ carry;
    carry = sum & carry;
    sum = temp;
  }
  return sum;
}

int main(){
  int a, b;
  printf("Enter a number: ");
  scanf("%d", &a);
  printf("Enter another number: ");
  scanf("%d", &b);
  printf("%d", add(a,b));
}
