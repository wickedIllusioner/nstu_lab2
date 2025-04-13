import java.util.*;

public class Main {
       
    // Функция будет возвращать объект Object[], содержащий количество операций и список строк
    public static Object[] task1(String s) {
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
                return new Object[]{i + 1 + (n - 2*i), steps};
            }
        }
        
        for (int i = 0; i < n; i++) {
            current.append(s.charAt(i));
            steps.add(current.toString());
        }
        return new Object[]{n, steps};
    }
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String input = scanner.nextLine().trim();
        Object[] result = task1(input);

	int count = (int)result[0];
	@SuppressWarnings("unchecked")
	List<String> steps = (List<String>)result[1];
        
    System.out.print(result[0] + " = ");
	System.out.println(String.join("->", steps));
    }
}
