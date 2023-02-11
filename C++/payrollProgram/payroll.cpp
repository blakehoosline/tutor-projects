#include <iostream>
#include <string>

const int MAX_NAME = 20;
const int MAX_ID = 8;
const int MAX_HOURS = 5;

struct PayrollRecord
{
    char name[MAX_NAME];
    char id[MAX_ID];
    int hours[MAX_HOURS];
    double hourlyWage;
};

double CalculateTotalHours(int hours[MAX_HOURS])
{
    double totalHours = 0;
    for (int i = 0; i < MAX_HOURS; i++)
    {
        totalHours += hours[i];
    }
    return totalHours;
}

double CalculateTotalSalary(double totalHours, double hourlyWage)
{
    return totalHours * hourlyWage;
}

double CalculateWithholding(double totalSalary)
{
    return totalSalary * 0.1;
}

double CalculateNetSalary(double totalSalary, double withholding)
{
    return totalSalary - withholding;
}

void PrintPayrollRecord(PayrollRecord record)
{
    std::cout << "Name: " << record.name << std::endl;
    std::cout << "ID: " << record.id << std::endl;
    double totalHours = CalculateTotalHours(record.hours);
    std::cout << "Total Hours Worked: " << totalHours << std::endl;
    double totalSalary = CalculateTotalSalary(totalHours, record.hourlyWage);
    std::cout << "Total Salary: $" << totalSalary << std::endl;
    double withholding = CalculateWithholding(totalSalary);
    std::cout << "Withholding: $" << withholding << std::endl;
    double netSalary = CalculateNetSalary(totalSalary, withholding);
    std::cout << "Net Salary: $" << netSalary << std::endl;
}

int main()
{
    PayrollRecord record;

    std::cout << "Enter Employee Name: ";
    std::cin.getline(record.name, MAX_NAME);

    std::cout << "Enter Employee ID: ";
    std::cin.getline(record.id, MAX_ID);

    std::cout << "Enter Hourly Wage: $";
    std::cin >> record.hourlyWage;

    std::cout << "Enter Hours Worked for each day (Monday to Friday): " << std::endl;
    for (int i = 0; i < MAX_HOURS; i++)
    {
        std::cout << "Day " << i + 1 << ": ";
        std::cin >> record.hours[i];

        if (record.hours[i] < 0 || record.hours[i] > 16)
        {
            std::cout << "Error: Hours worked should be between 0 and 16." << std::endl;
            return 0;
        }
    }

    PrintPayrollRecord(record);

    return 0;
}
