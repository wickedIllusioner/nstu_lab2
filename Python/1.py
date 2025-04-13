def task1(s):
    n = len(s)
    steps = []
    current = ""

    for i in range(n // 2, 0, -1):
        if s[:i] == s[i:2*i]:
            for j in range(i):
                current += s[j]
                steps.append(current)
            current += current
            steps.append(current)
            current = ""
            for j in range(2*i, n):
                current += s[j]
                steps.append(current)
            return (i + 1 + (n - 2*i), steps)
    
    for c in s:
        current += c
        steps.append(current)
    return (n, steps)

input_str = input()
result = task1(input_str)

print(f"{result[0]} = ", end="")
print("->".join(result[1]))
