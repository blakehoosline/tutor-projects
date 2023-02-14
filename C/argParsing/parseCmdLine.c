#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    if (argc != 5 && argc != 7)
    {
        printf("Usage: %s <team1> <team2> <score1> <score2>\n", argv[0]);
        return 1;
    }

    // Parse command line arguments
    char *team1 = argv[1];
    char *team2 = argv[2];
    int score1 = atoi(argv[3]);
    int score2 = atoi(argv[4]);

    // Determine winner and score difference
    int diff = abs(score1 - score2);
    char *winner = (score1 > score2) ? team1 : team2;
    char *loser = (score1 > score2) ? team2 : team1;

    // Output result
    printf("%s Won\n%d points Difference\n%c%c Team Lost\n", winner, diff, loser[0], loser[1]);

    return 0;
}
