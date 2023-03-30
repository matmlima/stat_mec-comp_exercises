def dec2bin(n):
    if n == 0:
        return ""
    return dec2bin(n // 2) + str(n % 2)

for i in range(0,9):
    print(i, "=>", dec2bin(i))
