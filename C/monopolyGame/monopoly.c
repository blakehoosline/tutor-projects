#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

typedef struct Player
{
    int id;
    int loc;
    long balance;
} TPlayer;

typedef struct Property
{
    int id;
    int owner_id;
    int rent;
} TProperty;

int transaction(TPlayer *p1, TPlayer *p2, int amount)
{
    if (p1->balance >= amount)
    {
        p1->balance -= amount;
        p2->balance += amount;
        return 1;
    }
    else
    {
        p2->balance += p1->balance;
        p1->balance = 0;
        return 0;
    }
}

int one_round(int m, int n, TPlayer p[], TProperty prop[])
{
    for (int i = 0; i < m; i++)
    {
        int steps = rand() % 6 + 1 + rand() % 6 + 1;
        p[i].loc = (p[i].loc + steps) % n;
        if (prop[p[i].loc].owner_id == -1)
        {
            prop[p[i].loc].owner_id = i;
            p[i].balance--;
        }
        else if (prop[p[i].loc].owner_id != i)
        {
            int rent = prop[p[i].loc].rent;
            int success = transaction(&p[i], &p[prop[p[i].loc].owner_id], rent);
            if (!success)
            {
                return 0;
            }
        }
    }
    return 1;
}

void print_result(int m, TPlayer p[])
{
    printf(" id balance\n");
    for (int i = 0; i < m; i++)
    {
        printf("%8d %8ld\n", p[i].id, p[i].balance);
    }
    long sum = 0;
    long max = 0;
    for (int i = 0; i < m; i++)
    {
        sum += p[i].balance;
        if (p[i].balance > max)
        {
            max = p[i].balance;
        }
    }
    printf("average: %f max: %ld, max/average = %lf\n", (double)sum / m, max, (double)max * m / sum);
}

void monopoly(int m, int n, TPlayer p[], TProperty prop[], int max_rounds)
{
    srand(12345);
    int rounds = 1;
    while (one_round(m, n, p, prop) && rounds < max_rounds)
    {
        rounds++;
    }
    print_result(m, p);
    printf("after %d rounds\n", rounds);
}

int main(int argc, char *argv[])
{
    if (argc != 4)
    {
        printf("Usage: %s m n rounds\n", argv[0]);
        return -1;
    }
    int m = atoi(argv[1]);
    int n = atoi(argv[2]);
    assert(n >= 13);
    assert(m >= 1);
    assert(atoi(argv[3]) >= 1);
    int rounds = atoi(argv[3]);
    TPlayer p[m];
    TProperty prop[n];
    for (int i = 0; i < n; i++)
    {
        prop[i].id = i;
        prop[i].owner_id = -1;
        prop[i].rent = i + 1;
    }
    for (int j = 0; j < m; j++)
    {
        p[j].id = j;
        p[j].loc = 0;
        p[j].balance = n;
    }
    monopoly(m, n, p, prop, rounds);
    return 0;
}
