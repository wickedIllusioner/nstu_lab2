import java.util.Scanner;

public class Main {
    public static int countEven(long num) {
        int counter = 0;
        while (num != 0) {
            long n = num % 10;
            if (n % 2 == 0 && n != 0) {
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
            long number = scan.nextLong();
            System.out.println(countEven(number));
        }

        scan.close();
    }
}
