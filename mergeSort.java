import java.util.*;

public class mergeSort{

  public static void mergeSort(int[] array){
    if (array.length >1){
      int n = array.length-1; // pivot = end of array
      // Loop over array
      int i = 0, j = array.length-2; // i = bottom index, j = top
      while(i < j){
        if (array[i] < array[n]){
          i++;
          continue;
        }
        if (array[j] > array[n]){
          j--;
          continue;
        }
        swap(array, i, j);
        i++; j--; // if neither are in right place switch
      }
      swap(array, i, n); // put pivot in the right position
      int[] larray = Arrays.copyOfRange(array, 0, i);
      int[] rarray = Arrays.copyOfRange(array, i+1, n+1);
      mergeSort(larray);
      mergeSort(rarray);
      merge(array, larray, rarray);
      System.out.println(Arrays.toString(array));
    }
  }

  public static void swap(int[] array, int i, int j){
    int temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }

  public static void merge(int[] array, int[] larray, int[] rarray){
    int i = 0, j = 0, k = 0;
    while(i < larray.length && j < rarray.length){
      if (larray[i] < rarray[j]){
        array[k++] = larray[i++];
      }else{
        array[k++] = rarray[j++];
      }
    }
  }

  public static void main(String[] args){
    int[] array = {6, 23, 5, 2, 186, 2, 21, 53, 1, 12};
    System.out.println(Arrays.toString(array));
    mergeSort(array);
    System.out.println(Arrays.toString(array));
  }

}
