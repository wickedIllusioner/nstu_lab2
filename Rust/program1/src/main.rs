use std::io;

fn task1(s: &str) -> (usize, Vec<String>) {
    let n = s.len();
    let mut steps = vec![];
    let mut current = String::new();
    
    for i in (1..=n/2).rev() {
        if s[0..i] == s[i..2*i] {
            for j in 0..i {
                current.push(s.chars().nth(j).unwrap());
                steps.push(current.clone());
            }
            let temp = current.clone();  // Исправление здесь
            current.push_str(&temp);
            steps.push(current.clone());
            current.clear();
            for j in 2*i..n {
                current.push(s.chars().nth(j).unwrap());
                steps.push(current.clone());
            }
            return (i + 1 + (n - 2*i), steps);
        }
    }
    
    for c in s.chars() {
        current.push(c);
        steps.push(current.clone());
    }
    (n, steps)
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let input = input.trim();
    
    let (count, steps) = task1(input);
    
    print!("{} = ", count);
    for (i, step) in steps.iter().enumerate() {
        print!("{}", step);
        if i != steps.len() - 1 {
            print!("->");
        }
    }
    print!("\n");
}

