import random as random

def mergeSort(array):
    if (len(array) >= 1):
        n = random.randrange(0,len(array))
        larray = []
        rarray = []
        for x in range(0,len(array)-1):
            ## NEED A CHECK FOR if (x = n) continue
            if (array[x] < array[n]):
                # add to larray
                larray.append(array[x])
            else:
                rarray.append(array[x])
        # MergeSort left and right subarrays
        if (len(array) >= 1):
            larray = mergeSort(larray)
            rarray = mergeSort(rarray)
        # Merge mergeeSorted subarrays
        array = merge(larray, rarray, array[n])
    return array

def merge(arr1, arr2, middleval):
    arr3 = []
    n, i, j = 0, 0, 0
    if(len(arr1) < len(arr2)):
        n = len(arr1)
    else:
        n = len(arr2)
    while (i < len(arr1) and j < len(arr2)):
        if (middleval < arr1[i] and middleval < arr2[j]):
            arr3.append(middleval)
            continue

        if (arr1[i] < arr2[j]):
            arr3.append(arr1[i])
            i = i + 1
        else:
            arr3.append(arr2[j])
            j = i + 1

    return arr3

def main():
    arr = [6,23,5,2,186,2,21,53,1,36,1]
    print(arr)
    arr = mergeSort(arr)
    print(arr)

if __name__ == "__main__":
    main()
