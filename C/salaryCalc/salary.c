#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    double hourly_rate, salary, bonus = 0, percentage_increase = 0;
    int hours_worked = 0, has_percentage_increase = 0;

    // Parse command line arguments
    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "-h") == 0)
        {
            hours_worked = atoi(argv[i + 1]);
            i++;
        }
        else if (strcmp(argv[i], "-b") == 0)
        {
            bonus = atoi(argv[i + 1]);
            i++;
        }
        else if (strcmp(argv[i], "-p") == 0)
        {
            has_percentage_increase = 1;
        }
        else
        {
            hourly_rate = atof(argv[i]);
        }
    }

    // Calculate salary
    salary = hourly_rate * hours_worked;
    if (has_percentage_increase)
    {
        percentage_increase = salary * 0.10;
        salary += percentage_increase;
    }
    salary += bonus;

    // Check if bonus is more than 50% of salary
    if (bonus > (salary * 0.50))
    {
        printf("Error: Bonus cannot be more than 50 percent of calculated salary\n");
        return 1;
    }

    // Check if hours worked is more than 80
    if (hours_worked > 80)
    {
        printf("Error: Hours worked cannot be more than 80\n");
        return 1;
    }

    // Print salary
    printf("The salary for this period is $%.2f\n", salary);
    return 0;
}
