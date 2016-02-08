#include <stdio.h>
#include <math.h>

int isPrime(int n){
  int i;
  for (i = 2; i <= floor(sqrt(n)); i++){
    if (n % i == 0)
      return 0;
  }
  return 1;
}

int primeTime(int l, int u){
  int count = 0;
  for (; l <= u; l++){
    if (isPrime(l)){
      count++;
    }
  }
  return count;
}

int main(){
  int l;
  int u;
  printf("Please enter a lower bound: ");
  scanf("%d", &l);
  printf("Please enter an upper bound: ");
  scanf("%d", &u);
  printf("%d", primeTime(l,u));
}
