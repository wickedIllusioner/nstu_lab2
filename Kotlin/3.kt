fun countEven(num: Long): Int {
    var counter = 0
    var tempNum = num
    while (tempNum != 0L) {
        var n = tempNum % 10
        if (n % 2 == 0L && n != 0L) {
            counter++
        }
        tempNum /= 10
    }
    return counter
}

fun main() {
    val totalNums = readLine()!!.toLong()
    for (i in 1..totalNums) {
        val number = readLine()!!.toLong()
        println(countEven(number))
    }
}
