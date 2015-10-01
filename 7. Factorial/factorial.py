def factorial(n):
    if (n == 0):
        return 1
    else: return n*factorial(n-1)

def main():
    n = input("Enter a number: ");
    print(factorial(n))

if __name__ == "__main__":
    main()
