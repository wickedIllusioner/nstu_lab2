/*
Необходимо посчитать количество чётных цифр для каждого числа.
*/

#include <iostream>

int countEven(int num) {
    int counter {};
    while (num != 0) {
        int n = num % 10;
        if (n % 2 == 0) counter++;
        num /= 10;
    }
    return counter;
}

int main() {
    int n {};
    std::cin >> n;

    for (int i = 0; i < n; ++i) {
        int tmp {};
        std::cin >> tmp;
        std::cout << countEven(tmp) << std::endl;
    }

    return 0;
}