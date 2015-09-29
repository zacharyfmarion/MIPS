def isPrime(n):
	for x in range(2, n-1):
		if (n % x == 0):
			return False
	return True

def main():
    n = input("Please enter a number: ")
    print(isPrime(n))

if __name__ == "__main__":
    main()
