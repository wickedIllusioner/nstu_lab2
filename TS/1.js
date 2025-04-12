function minOperation(s) {
    var n = s.length;
    var steps = [];
    var current = "";
    for (var i = Math.floor(n / 2); i > 0; i--) {
        if (s.substring(0, i) === s.substring(i, 2 * i)) {
            for (var j = 0; j < i; j++) {
                current += s[j];
                steps.push(current);
            }
            current += current;
            steps.push(current);
            current = "";
            for (var j = 2 * i; j < n; j++) {
                current += s[j];
                steps.push(current);
            }
            return [i + 1 + (n - 2 * i), steps];
        }
    }
    for (var _i = 0, s_1 = s; _i < s_1.length; _i++) {
        var c = s_1[_i];
        current += c;
        steps.push(current);
    }
    return [n, steps];
}
var readline = require('readline');
var rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
rl.question('', function (input) {
    var _a = minOperation(input.trim()), count = _a[0], steps = _a[1];
    console.log("".concat(count, " = ").concat(steps.join("->")));
    rl.close();
});
