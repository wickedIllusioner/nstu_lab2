#include <iostream>
#include <vector>
#include <utility>
#include <string>

using namespace std;

pair<int, vector<string>> minOperation(string s) {
    int n = s.length();
    vector<string> steps;

    // Начинаем с пустой строки
    string current;
    steps.push_back(current); // Начальное состояние (пустая строка)

    // Пытаемся найти самый длинный префикс, который можно удвоить
    for (int i = n / 2; i > 0; i--) {
        if (s.substr(0, i) == s.substr(i, i)) {
            // 1. Добавляем символы по одному до префикса длины i
            for (int j = 0; j < i; j++) {
                current += s[j];
                steps.push_back(current);
            }
            // 2. Операция удвоения
            current += current;
            steps.push_back(current);
            current = "";
            // 3. Добавляем оставшиеся символы по одному
            for (int j = 2 * i; j < n; j++) {
                current += s[j];
                steps.push_back(current);
            }
            return {i + 1 + (n - 2 * i), steps};
        }
    }

    // Если не нашли повторяющийся префикс, добавляем все символы по одному
    for (char c : s) {
        current += c;
        steps.push_back(current);
    }
    return {n, steps};
}

int main() {
    string input;
    std::cin >> input;
    auto result = minOperation(input);

    std::cout << result.first << " = ";
    for (int i = 0; i < result.second.size(); i++) {
        std::cout << result.second[i];
        if (i != 0 && i != result.second.size() - 1)
            std::cout << "->";
    }

    return 0;
}