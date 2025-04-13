package main

import "fmt"

func countEven(number int) int {
	counter := 0
	for number != 0 {
		n := number % 10
		if n % 2 == 0 && n != 0 {
			counter++
		}
		number /= 10
	}
	return counter
}

func main() {
	var n int
	fmt.Scanln(&n)

	for _ = range n {
		var num int
		fmt.Scanln(&num)
		fmt.Println(countEven(num))
	}
}
