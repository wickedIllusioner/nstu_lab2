// import * as readline from 'readline';

function countRounds(teams: number): number {
    if (teams === 1) {
        return 0;
    }
    else if (teams % 2 === 0) {
        const matches = teams / 2;
        return matches + countRounds(matches);
    }
    else {
        const matches = (teams - 1) / 2;
        return matches + countRounds(matches + 1);
    }
}

const rl = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("", (totalTeams: number) => {
    console.log(countRounds(totalTeams));
    rl.close();
})