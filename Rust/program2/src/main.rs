use std::io;

fn count_rounds(teams: i32) -> i32 {
    if teams == 1 {
        0
    } else if teams % 2 == 0 {
        let matches = teams / 2;
        matches + count_rounds(matches)
    } else {
        let matches = (teams - 1) / 2;
        matches + count_rounds(matches+1)
    }
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("");
    let total_teams: i32 = input.trim().parse().expect("");
    println!("{}", count_rounds(total_teams));
}
