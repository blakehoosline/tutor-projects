#include <stdio.h>
#include <ctype.h>

#define MAX_SIZE 25

int main()
{
    char carray[MAX_SIZE];
    int position = 0;
    char c;
    FILE *fp;

    fp = fopen("input.txt", "r");
    if (fp == NULL)
    {
        printf("Error: Unable to open input file.\n");
        return 1;
    }

    // Read input from file into carray, stopping at EOF or after MAX_SIZE characters have been read
    while ((c = fgetc(fp)) != EOF && position < MAX_SIZE)
    {
        if (isalpha(c) || c == ' ')
        {
            carray[position++] = c;
        }
    }

    fclose(fp);

    // Print character positions
    printf("Character positions:");
    for (int i = 0; i < position; i++)
    {
        printf(" %d", i);
    }
    printf("\n");

    // Print legal input
    printf("Legal input:");
    for (int i = 0; i < position; i++)
    {
        if ((carray[i] >= 'a' && carray[i] <= 'z') ||
            (carray[i] >= 'A' && carray[i] <= 'Z') ||
            carray[i] == ' ')
        {
            printf(" %c", carray[i]);
        }
    }
    printf("\n");

    // Convert carray to lowercase and print in reverse
    printf("carray[] in reverse, converted to lowercase:");
    for (int i = position - 1; i >= 0; i--)
    {
        if (carray[i] >= 'A' && carray[i] <= 'Z')
        {
            printf(" %c", carray[i] + ('a' - 'A'));
        }
        else
        {
            printf(" %c", carray[i]);
        }
    }
    printf("\n");

    return 0;
}
