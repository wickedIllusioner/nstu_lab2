def countOdd(num: int):
    counter = 0
    while num != 0:
        n = num % 10
        if n % 2 == 0 and n != 0: counter += 1
        num //= 10
    
    return counter


total = int(input())

for _ in range(total):
    tmp = int(input())
    print(countOdd(tmp))
