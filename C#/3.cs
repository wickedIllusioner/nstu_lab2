using System;

class Program
{
    static int CountEven(long num)
    {
        int counter = 0;
        while (num != 0)
        {
            long n = num % 10;
            if (n % 2 == 0 && n != 0) counter++;
            num /= 10;
        }
        return counter;
    }

    static void Main()
    {
        int n = int.Parse(Console.ReadLine());

        for (int i = 0; i < n; i++)
        {
            long tmp = long.Parse(Console.ReadLine());
            Console.WriteLine(CountEven(tmp));
        }
    }
}
