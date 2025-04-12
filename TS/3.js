function countEven(num) {
    var counter = 0;
    while (num !== 0) {
        var n = num % 10;
        if (n % 2 === 0)
            counter++;
        num = Math.floor(num / 10);
    }
    return counter;
}
var readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});
readline.question('', function (n) {
    var count = 0;
    var processNumber = function () {
        if (count >= parseInt(n)) {
            readline.close();
            return;
        }
        readline.question('', function (tmp) {
            console.log(countEven(parseInt(tmp)));
            count++;
            processNumber();
        });
    };
    processNumber();
});
