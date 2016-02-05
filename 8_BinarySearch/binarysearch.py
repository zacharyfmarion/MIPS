def binarySearch(array, val, lo, hi):
    # val was not found in the array
    if (hi < lo):
        return -1
    # calculate the middle index
    n = lo + (hi-lo)/2
    if (val < array[n]):
        return binarySearch(array, val, lo, n-1)
    elif (val > array[n]):
        return binarySearch(array, val, n+1, hi)
    else:
        # val was found
        return n

def main():
    arr = [0,1,2,3,4,5,6]
    print(binarySearch(arr, 4, 0, 6))

if __name__ == "__main__":
    main()
