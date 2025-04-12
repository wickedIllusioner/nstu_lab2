use std::io;

fn count_even(mut num: i64) -> i64 {
    let mut counter = 0;
    while num != 0 {
        let n: i64 = num % 10;
        if n % 2 == 0 {
            counter += 1;
        }
        num /= 10;
    }
    counter
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("");
    let n: i32 = input.trim().parse().expect(""); 

    for _ in 0..n {
        let mut num_input = String::new();
        io::stdin().read_line(&mut num_input).expect("");
        let num: i64 = num_input.trim().parse().expect("");
        println!("{}", count_even(num));
    }
}
