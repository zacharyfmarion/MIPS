#include <stdio.h>

void loop(int n){
  int i;
  for (i = 0; i < n; i++){
    printf("%d\n",i);
  }
}

int main(){
  int n;
  printf("Enter an upper bound: ");
  scanf("%d", &n);
  loop(n);
}
