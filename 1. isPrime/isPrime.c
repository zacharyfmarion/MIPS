#include <stdio.h>

int isPrime(int n){
  int i;
  for (i = 2; i < n-1; i++){
    if (n % i == 0)
      return 0;
  }
  return 1;
}

int main(){
  int n;
  printf("Please enter a number: ");
  scanf("%d", &n);
  int res = isPrime(n);
  if (res){
    printf("True");
  }else{
    printf("False");
  }
}
