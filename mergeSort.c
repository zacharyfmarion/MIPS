#include <stdio.h>
#include <stdlib.h>

void arrayPrint(int *arr, int size){
  int i;
  for (i = 0; i < size; i++){
    if (i == size-1){
      printf("%d", arr[i]);
    }else{
      printf("%d, ", arr[i]);
    }
  }
}

void mergeSort(int *arr, int size){

}

void merge(int *arr1, int *arr2){

}

int main(){
  int array[10] = {6,23,5,2,186,2,21,53,1,36};
  arrayPrint(array, 10);
}
