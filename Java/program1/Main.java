import java.util.*;

public class Main {
    public static class Pair {
        public int first;
        public List<String> second;
        
        public Pair(int first, List<String> second) {
            this.first = first;
            this.second = second;
        }
    }
    
    public static Pair minOperation(String s) {
        int n = s.length();
        List<String> steps = new ArrayList<>();
        StringBuilder current = new StringBuilder();
        
        for (int i = n / 2; i > 0; i--) {
            if (s.substring(0, i).equals(s.substring(i, 2*i))) {
                for (int j = 0; j < i; j++) {
                    current.append(s.charAt(j));
                    steps.add(current.toString());
                }
                current.append(current);
                steps.add(current.toString());
                current = new StringBuilder();
                for (int j = 2*i; j < n; j++) {
                    current.append(s.charAt(j));
                    steps.add(current.toString());
                }
                return new Pair(i + 1 + (n - 2*i), steps);
            }
        }
        
        for (int i = 0; i < n; i++) {
            current.append(s.charAt(i));
            steps.add(current.toString());
        }
        return new Pair(n, steps);
    }
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String input = scanner.nextLine().trim();
        Pair result = minOperation(input);
        
        System.out.print(result.first + " = ");
        System.out.println(String.join("->", result.second));
    }
}