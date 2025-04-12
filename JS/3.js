function countEven(num) {
    let counter = 0;
    while (num !== 0) {
        const n = num % 10;
        if (n % 2 === 0) counter++;
        num = Math.floor(num / 10);
    }
    return counter;
}

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

readline.question('', n => {
    let count = 0;
    const processNumber = () => {
        if (count >= parseInt(n)) {
            readline.close();
            return;
        }
        readline.question('', tmp => {
            console.log(countEven(parseInt(tmp)));
            count++;
            processNumber();
        });
    };
    processNumber();
});