using System;
using System.Collections.Generic;

class Program {
    static Tuple<int, List<string>> task1(string s) {
        int n = s.Length;
        var steps = new List<string> {};
        string current = "";
        
        for (int i = n / 2; i > 0; i--) {
            if (s.Substring(0, i) == s.Substring(i, i)) {
                for (int j = 0; j < i; j++) {
                    current += s[j];
                    steps.Add(current);
                }
                current += current;
                steps.Add(current);
                current = "";
                for (int j = 2 * i; j < n; j++) {
                    current += s[j];
                    steps.Add(current);
                }
                return Tuple.Create(i + 1 + (n - 2 * i), steps);
            }
        }
        
        foreach (char c in s) {
            current += c;
            steps.Add(current);
        }
        return Tuple.Create(n, steps);
    }
    
    static void Main() {
        string input = Console.ReadLine().Trim();
        var result = task1(input);
        
        Console.Write($"{result.Item1} = ");
        Console.WriteLine(string.Join("->", result.Item2));
    }
}