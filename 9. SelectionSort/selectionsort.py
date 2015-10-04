def selectionSort(array):
    for i in range(len(array)):
        for j in range(len(array)):
            if (array[i] < array[j]):
                swap(array, i, j)

def swap(array, a, b):
    temp = array[a]
    array[a] = array[b]
    array[b] = temp

def main():
    list = [1,34,45,6,7,9,2]
    print(list)
    selectionSort(list)
    print(list)

if __name__ == "__main__":
    main()
