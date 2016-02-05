def bitwise_add(a, b):
    sum = a ^ b
    carry = a & b
    while(carry != 0):
        carry <<= 1
        carryHolder = carry
        carry = sum & carry
        sum = sum ^ carryHolder
    return sum

def main():
    print(bitwise_add(4,10));

if __name__ == "__main__":
    main()
