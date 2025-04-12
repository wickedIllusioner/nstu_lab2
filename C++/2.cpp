/*
Вам дано целое число n—количество команд в турнире со странными правилами:
• Если текущее количество команд четное, каждая команда объединяется с другой командой. Всего n/2 сыграно матчей, и n/2 команды проходят в следующий раунд.
• Если текущее количество команд нечетное, одна команда случайным образом продвигается в турнире, а остальные распределяются по парам. 
    Всего (n-1)/2 сыграно матчей, и (n-1)/2+1 команды проходят в следующий раунд. Возвращает количество матчей, сыгранных в турнире, пока не будет определен победитель.
*/

#include <iostream>

int countRounds(int teams) {
    if (teams == 1) {
        return 0;
    }
    else if (teams % 2 == 0) {
        int matches = teams / 2;
        return matches + countRounds(matches);
    }
    else {
        int matches = (teams - 1) / 2;
        return matches + countRounds(matches+1);
    }
}

int main() {
    int totalTeams {};
    std::cin >> totalTeams;
    std::cout << countRounds(totalTeams) << std::endl;

    return 0;
}