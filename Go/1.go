package main

import (
	"fmt"
	"strings"
)

func task1(s string) (int, []string) {
	n := len(s)
	steps := []string{}
	current := ""

	for i := n / 2; i > 0; i-- {
		if strings.HasPrefix(s[i:], s[:i]) {
			for j := 0; j < i; j++ {
				current += string(s[j])
				steps = append(steps, current)
			}
			current += current
			steps = append(steps, current)
			current = ""
			for j := 2 * i; j < n; j++ {
				current += string(s[j])
				steps = append(steps, current)
			}
			return i + 1 + (n - 2*i), steps
		}
	}

	for _, c := range s {
		current += string(c)
		steps = append(steps, current)
	}
	return n, steps
}

func main() {
	var input string
	fmt.Scan(&input)
	count, steps := task1(input)

	fmt.Printf("%d = ", count)
	for i, step := range steps {
		fmt.Print(step)
		if i != len(steps)-1 {
			fmt.Print("->")
		}
	}
	fmt.Print("\n")
}
