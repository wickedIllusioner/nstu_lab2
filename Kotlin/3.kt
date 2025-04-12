fun countEven(num: Int): Int {
    var counter = 0
    var tempNum = num
    while (tempNum != 0) {
        var n = tempNum % 10
        if (n % 2 == 0) {
            counter++
        }
        tempNum /= 10
    }
    return counter
}

fun main() {
    val totalNums = readLine()!!.toInt()
    for (i in 1..totalNums) {
        val number = readLine()!!.toInt()
        println(countEven(number))
    }
}