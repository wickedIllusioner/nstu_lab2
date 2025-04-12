func task1(_ s: String) -> (Int, [String]) {
    let n = s.count
    var steps = [String]()
    
    // Начинаем с пустой строки
    var current = ""
    
    // Пытаемся найти самый длинный префикс, который можно удвоить
    for i in stride(from: n / 2, through: 1, by: -1) {
        let prefix = String(s.prefix(i))
        let nextSubstring = String(s.dropFirst(i).prefix(i))
        
        if prefix == nextSubstring {
            // 1. Добавляем символы по одному до префикса длины i
            for j in 0..<i {
                let index = s.index(s.startIndex, offsetBy: j)
                current.append(s[index])
                steps.append(current)
            }
            
            // 2. Операция удвоения
            current += current
            steps.append(current)
            current = ""
            
            // 3. Добавляем оставшиеся символы по одному
            for j in 2*i..<n {
                let index = s.index(s.startIndex, offsetBy: j)
                current.append(s[index])
                steps.append(current)
            }
            
            return (i + 1 + (n - 2 * i), steps)
        }
    }
    
    // Если не нашли повторяющийся префикс, добавляем все символы по одному
    for char in s {
        current.append(char)
        steps.append(current)
    }
    
    return (n, steps)
}

// Пример использования
print("Введите строку:", terminator: "")
if let input = readLine() {
    let result = task1(input)
    
    print("\(result.0) = ", terminator: "")
    for i in 0..<result.1.count {
        print(result.1[i], terminator: "")
        if i != result.1.count - 1 {
            print("->", terminator: "")
        }
    }
    print()
}