func countEven(_ num: Int) -> Int {
    var counter = 0
    var num = num
    while num != 0 {
        let n = num % 10
        if (n % 2 == 0) && (n != 0) { counter += 1 }
        num /= 10
    }
    return counter
}

if let n = Int(readLine() ?? "0") {
    for _ in 0..<n {
        if let tmp = Int(readLine() ?? "0") {
            print(countEven(tmp))
        }
    }
}
