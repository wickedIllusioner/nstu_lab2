function countRounds(teams) {
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

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

readline.question('', (totalTeams) => {
    console.log(countRounds(parseInt(totalTeams)));
    readline.close();
});
