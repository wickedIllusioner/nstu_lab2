// import * as readline from 'readline';
function countRounds(teams) {
    if (teams === 1) {
        return 0;
    }
    else if (teams % 2 === 0) {
        var matches = teams / 2;
        return matches + countRounds(matches);
    }
    else {
        var matches = (teams - 1) / 2;
        return matches + countRounds(matches + 1);
    }
}
var rl = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});
rl.question("", function (totalTeams) {
    console.log(countRounds(totalTeams));
    rl.close();
});
