def countRounds(teams: int):
    if teams == 1:
        return 0
    elif teams % 2 == 0:
        matches = teams // 2
        return matches + countRounds(matches)
    else:
        matches = (teams - 1) // 2
        return matches + countRounds(matches + 1)

n = int(input())
print(countRounds(n))