import math

def isPrime(n):
	for x in range(2, int(math.sqrt(n)+1)):
		if (n % x == 0):
			return False
	return True

def main():
    n = input("Please enter a number: ")
    print(isPrime(float(n)))

if __name__ == "__main__":
    main()
