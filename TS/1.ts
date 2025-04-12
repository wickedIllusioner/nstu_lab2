function minOperation(s: string): [number, string[]] {
    const n = s.length;
    const steps: string[] = [];
    let current = "";
    
    for (let i = Math.floor(n / 2); i > 0; i--) {
        if (s.substring(0, i) === s.substring(i, 2*i)) {
            for (let j = 0; j < i; j++) {
                current += s[j];
                steps.push(current);
            }
            current += current;
            steps.push(current);
            current = "";
            for (let j = 2*i; j < n; j++) {
                current += s[j];
                steps.push(current);
            }
            return [i + 1 + (n - 2*i), steps];
        }
    }
    
    for (const c of s) {
        current += c;
        steps.push(current);
    }
    return [n, steps];
}

const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('', (input) => {
    const [count, steps] = minOperation(input.trim());
    console.log(`${count} = ${steps.join("->")}`);
    rl.close();
});