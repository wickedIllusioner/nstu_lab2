/*
Необходимо посчитать количество чётных цифр для каждого числа.
*/

#include <iostream>

int countEven(int64_t num) {
    int counter {};     // Объявление счетчика четных значений
    while (num != 0) {
        int n = num % 10;
        if (n % 2 == 0 && n != 0) counter++;  // Увеличение счетчика в случае четного разряда числа
        num /= 10;  // Изначальное число нацело делится на 10
    }
    return counter;
}

int main() {
    int n {};
    std::cin >> n;

    for (int i = 0; i < n; ++i) {
        int64_t tmp {};
        std::cin >> tmp;
        std::cout << countEven(tmp) << std::endl;
    }

    return 0;
}
