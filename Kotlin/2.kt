fun countRounds(teams: Int): Int {
    if (teams == 1) {
        return 0
    }
    else if (teams % 2 == 0) {
        var matches = teams / 2
        return matches + countRounds(matches)
    }
    else {
        var matches = (teams-1) / 2
        return matches + countRounds(matches+1)
    }
}

fun main() {
    val totalTeams = readLine()!!.toInt()
    println(countRounds(totalTeams))
}
