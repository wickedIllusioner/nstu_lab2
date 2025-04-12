package program3;

import java.util.Scanner;

public class Main {
    public static int countEven(int num) {
        int counter = 0;
        while (num != 0) {
            int n = num % 10;
            if (n % 2 == 0) {
                counter++;
            }
            num /= 10;
        }
        return counter;
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int totalNums = scan.nextInt();

        for (int i = 0; i < totalNums; i++) {
            int number = scan.nextInt();
            System.out.println(countEven(number));
        }

        scan.close();
    }
}
