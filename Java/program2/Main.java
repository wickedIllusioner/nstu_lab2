package program2;
import java.util.*;

public class Main {
    public static int countRounds(int teams) {
        if (teams == 1) {
            return 0;
        }
        else if (teams % 2 == 0) {
            int matches = teams / 2;
            return matches + countRounds(matches);
        }
        else {
            int matches = (teams - 1) / 2;
            return matches + countRounds(matches+1);
        }
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int totalTeams = scan.nextInt();
        scan.close();

        System.out.println(countRounds(totalTeams));
    }
}
