#include <stdio.h>
#include <string.h>
#include <math.h>

#define MAX_MONTHS 12

struct SalesData
{
    char month[10];
    double sales;
};

void readData(struct SalesData sales[], char *filename)
{
    FILE *fp;
    fp = fopen("input.txt", "r");
    if (fp == NULL)
    {
        printf("Error: Unable to open file %s\n", filename);
        return;
    }

    for (int i = 0; i < MAX_MONTHS; i++)
    {
        fscanf(fp, "%s %lf", sales[i].month, &sales[i].sales);
    }

    fclose(fp);
}

void printSalesReport(struct SalesData sales[])
{
    printf("Monthly sales report for 2022:\n\n");
    printf("Month\tSales\n");
    for (int i = 0; i < MAX_MONTHS; i++)
    {
        printf("%s\t$%.2lf\n", sales[i].month, sales[i].sales);
    }
    printf("\n");
}

void printSalesSummary(struct SalesData sales[])
{
    double min = sales[0].sales, max = sales[0].sales, sum = 0;
    int minIndex = 0, maxIndex = 0;
    for (int i = 0; i < MAX_MONTHS; i++)
    {
        sum += sales[i].sales;
        if (sales[i].sales < min)
        {
            min = sales[i].sales;
            minIndex = i;
        }
        if (sales[i].sales > max)
        {
            max = sales[i].sales;
            maxIndex = i;
        }
    }
    double average = sum / MAX_MONTHS;

    printf("Sales summary:\n");
    printf("Minimum sales: $%.2lf (%s)\n", min, sales[minIndex].month);
    printf("Maximum sales: $%.2lf (%s)\n", max, sales[maxIndex].month);
    printf("Average sales: $%.2lf\n\n", average);
}

void printSixMonthMovingAverage(struct SalesData sales[])
{
    double sum = 0;
    printf("Six-Month Moving Average Report:\n");
    for (int i = 0; i < MAX_MONTHS - 5; i++)
    {
        for (int j = i; j < i + 6; j++)
        {
            sum += sales[j].sales;
        }
        double average = sum / 6;
        printf("%s - %s\t$%.2lf\n", sales[i].month, sales[i + 5].month, average);
        sum = 0;
    }
    printf("\n");
}

void sortSalesData(struct SalesData sales[])
{
    struct SalesData temp;
    for (int i = 0; i < MAX_MONTHS - 1; i++)
    {
        for (int j = 0; j < MAX_MONTHS - i - 1; j++)
        {
            if (sales[j].sales < sales[j + 1].sales)
            {
                temp = sales[j];
                sales[j] = sales[j + 1];
                sales[j + 1] = temp;
            }
        }
    }

    printf("Monthly sales report from highest to lowest:\n\n");
    printf("Month\tSales\n");
    for (int i = 0; i < MAX_MONTHS; i++)
    {
        printf("%s\t$%.2lf\n", sales[i].month, sales[i].sales);
    }
    printf("\n");
}

int main(void)
{
    struct SalesData sales[MAX_MONTHS];
    readData(sales, "input.txt");
    printSalesReport(sales);
    printSalesSummary(sales);
    printSixMonthMovingAverage(sales);
    sortSalesData(sales);
    return 0;
}
