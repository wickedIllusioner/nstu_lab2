using System;

class Program
{
    static int CountRounds(int teams)
    {
        if (teams == 1)
        {
            return 0;
        }
        else if (teams % 2 == 0)
        {
            int matches = teams / 2;
            return matches + CountRounds(matches);
        }
        else
        {
            int matches = (teams - 1) / 2;
            return matches + CountRounds(matches + 1);
        }
    }

    static void Main()
    {
        int totalTeams = int.Parse(Console.ReadLine());
        Console.WriteLine(CountRounds(totalTeams));
    }
}