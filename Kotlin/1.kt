fun minOperation(s: String): Pair<Int, List<String>> {
    val n = s.length
    val steps = mutableListOf<String>()
    var current = ""
    
    for (i in n / 2 downTo 1) {
        if (s.substring(0, i) == s.substring(i, 2 * i)) {
            for (j in 0 until i) {
                current += s[j]
                steps.add(current)
            }
            current += current
            steps.add(current)
            current = ""
            for (j in 2 * i until n) {
                current += s[j]
                steps.add(current)
            }
            return Pair(i + 1 + (n - 2 * i), steps.toList())
        }
    }
    
    for (c in s) {
        current += c
        steps.add(current)
    }
    return Pair(n, steps.toList())
}

fun main() {
    val input = readLine()!!.trim()
    val (count, steps) = minOperation(input)
    
    print("$count = ")
    println(steps.joinToString("->"))
}