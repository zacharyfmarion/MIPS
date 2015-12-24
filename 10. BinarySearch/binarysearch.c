#include <stdio.h>
#include <stdlib.h>

int binarySearch(int* array, int val, int lo, int hi){
  // val not found in array
  if (hi < lo){
    return -1;
  }
  // calculate the middle index
  int n = lo + (hi-lo)/2;

  if (val < array[n]){
    return binarySearch(array, val, lo, n-1);
  }else if (val > array[n]){
    return binarySearch(array, val, n+1, hi);
  }else{
    // val was found
    return n;
  }
}

int main(){
  int arr[7] = {0,1,2,3,4,5,6};
  printf("%d", binarySearch(arr, 4, 0, 6));
}
