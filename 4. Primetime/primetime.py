import math

def primetime(low, high):
	counter = 0
	for x in range(low, high):
		if (x == 1):
			continue
		if (isPrime(float(x))):
			counter = counter + 1
	return counter

def isPrime(n):
	for x in range(2, int(math.sqrt(n)+1)):
		if (n % x == 0):
			return False
	return True

def main():
    l = input("Please enter a lower bound: ")
	u = input("Please enter an upper bound: ")
    print(primetime(l,u))

if __name__ == "__main__":
    main()
