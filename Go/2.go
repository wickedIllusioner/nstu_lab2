package main

import "fmt"

func countRounds(teams int) int {
	if teams == 1 {
		return 0
	} else if teams%2 == 0 {
		matches := teams / 2
		return matches + countRounds(matches)
	} else {
		matches := (teams - 1) / 2
		return matches + countRounds(matches+1)
	}
}

func main() {
	var totalTeams int
	fmt.Scanln(&totalTeams)
	fmt.Println(countRounds(totalTeams))
}