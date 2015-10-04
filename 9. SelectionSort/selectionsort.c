#include <stdio.h>

void swap(int *array, int a, int b){
  int temp = array[a];
  array[a] = array[b];
  array[b] = temp;
}

void selectionSort(int *array, int size){
  int i, j;
  for (i = 0; i < size; i++){
    for (j = 0; j < size; j++){
      if (array[i] < array[j]){
        swap(array, i, j);
      }
    }
  }
}

void printArray(int *array, int size){
  int i;
  for (i = 0; i < size; i++){
    printf("%d ", array[i]);
  }
}

int main(){
  int arr[8] = {2,56,2,35,6,4,2,87};
  printArray(arr, sizeof arr / sizeof *arr);
  printf("\n");
  selectionSort(arr, sizeof arr / sizeof *arr);
  printArray(arr, sizeof arr / sizeof *arr);
}
