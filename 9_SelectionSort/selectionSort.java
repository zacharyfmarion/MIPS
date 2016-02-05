import java.util.*;

public class selectionSort{

  public static void selectionSort(int[] array){
    for (int i = 0; i < array.length; i++){
      for (int j = 0; j < array.length; j++){
        if (array[i] < array[j]){
          swap(array, i, j);
        }
      }
    }
  }

  public static void swap(int[] array, int i, int j){
    int temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }

  public static void main(String[] args){
    int[] array = {6, 23, 5, 2, 186, 2, 21, 53, 1, 36};
    System.out.println(Arrays.toString(array));
    selectionSort(array);
    System.out.println(Arrays.toString(array));
  }

}
