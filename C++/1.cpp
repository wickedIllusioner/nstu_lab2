#include <iostream>
#include <vector>
#include <utility>
#include <string>

/*
    Студенту не хочется выполнять лабораторную работу. Он должен начать выполнять ее немедленно, чтобы уложиться в срок.
    Задание - напечатать строку. За раз он может выполнить одну из следующих операций:
    - добавить символ в конце строки;
    - добавить копию текущей строки в конец (можно применить единожды).
    Помогите студенту найти минимальное количество операций, необходимых для ввода заданной строки.
    Пример: S=’’dbadbaa’
    Результат: 5 = d->db->dba->dbadba->a
 */

using namespace std;

pair<int, vector<string>> task1(string s) {
    int n = s.length();
    vector<string> steps;
    string current;

    steps.push_back(current);

    //  Поиск самого длинного префикса, который возможно удвоить
    for (int i = n / 2; i > 0; i--) {
        // Проверка на сходство левой и правой частей относительно середины строки
        if (s.substr(0, i) == s.substr(i, i)) {
            //  Если верно, то последовательно заполняем вектор до i-1 элемента строки
            for (int j = 0; j < i; j++) {
                current += s[j];
                steps.push_back(current);
            }
            // Удвоение полученной строки
            current += current;
            steps.push_back(current);
            current = "";

            //  Добавление оставшихся символов
            for (int j = 2 * i; j < n; j++) {
                current += s[j];
                steps.push_back(current);
            }

            // i - обход до i-го элемента
            // 1 - операция удвоения
            // (n - 2*i) - обход оставшихся элементов строки
            return {i + 1 + (n - 2 * i), steps};
        }
    }

    // Если в строке нет "повторяющегося" префикса, то выполняем последовательный перебор символов строки
    for (char c : s) {
        current += c;
        steps.push_back(current);
    }
    return {n, steps};
}

int main() {
    string input;
    std::cin >> input;
    auto result = task1(input);

    std::cout << result.first << " = ";
    for (int i = 0; i < result.second.size(); i++) {
        std::cout << result.second[i];
        if (i != 0 && i != result.second.size() - 1)
            std::cout << "->";
    }

    return 0;
}
