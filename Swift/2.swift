func countRounds(teams: Int) -> Int {
    if teams == 1 {
        return 0
    }
    else if teams % 2 == 0 {
        let matches = teams / 2
        return matches + countRounds(teams: matches)
    }
    else {
        let matches = (teams - 1) / 2
        return matches + countRounds(teams: matches + 1)
    }
}

if let totalTeams = Int(readLine() ?? "0") {
    print(countRounds(teams: totalTeams))
}