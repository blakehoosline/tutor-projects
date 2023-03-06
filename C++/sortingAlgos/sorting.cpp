#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

// Define the Student class
class Student
{
private:
    string firstName;
    string lastName;
    double gpa;

public:
    // Constructors
    Student() : firstName(""), lastName(""), gpa(0.0) {}
    Student(string fName, string lName, double g) : firstName(fName), lastName(lName), gpa(g) {}

    // Getters and Setters
    string getFirstName() const { return firstName; }
    string getLastName() const { return lastName; }
    double getGpa() const { return gpa; }
    void setFirstName(string fName) { firstName = fName; }
    void setLastName(string lName) { lastName = lName; }
    void setGpa(double g) { gpa = g; }

    // Overload the '<' operator to compare Student objects by GPA
    bool operator<(const Student &other) const
    {
        return gpa < other.gpa;
    }

    // Print Student information
    void print() const
    {
        cout << firstName << " " << lastName << ", GPA: " << gpa << endl;
    }
};

// Merge Sort algorithm for sorting an array of Student objects by GPA
void merge(vector<Student> &arr, int l, int m, int r)
{
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;

    // Create temp arrays
    vector<Student> L(n1);
    vector<Student> R(n2);

    // Copy data to temp arrays L[] and R[]
    for (i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];

    // Merge the temp arrays back into arr[l..r]
    i = 0;
    j = 0;
    k = l;
    while (i < n1 && j < n2)
    {
        if (L[i] < R[j])
        {
            arr[k] = L[i];
            i++;
        }
        else
        {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    // Copy the remaining elements of L[], if there are any
    while (i < n1)
    {
        arr[k] = L[i];
        i++;
        k++;
    }

    // Copy the remaining elements of R[], if there are any
    while (j < n2)
    {
        arr[k] = R[j];
        j++;
        k++;
    }
}

void mergeSort(vector<Student> &arr, int l, int r)
{
    if (l >= r)
    {
        return;
    }
    int m = l + (r - l) / 2;
    mergeSort(arr, l, m);
    mergeSort(arr, m + 1, r);
    merge(arr, l, m, r);
}

// Quick Sort algorithm for sorting an array of Student objects by GPA
int partition(vector<Student> &arr, int low, int high)
{
    double pivot = arr[high].getGpa();
    int i = low - 1;

    for (int j = low; j <= high - 1; j++)
    {
        if (arr[j].getGpa() < pivot)
        {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[high]);
    return i + 1;
}

void quickSort(vector<Student> &arr, int low, int high)
{
    if (low < high)
    {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

// Load data from file into a vector of Student objects
vector<Student> loadStudentsFromFile(string filename)
{
    vector<Student> students;
    ifstream file(filename);
    if (!file)
    {
        cout << "Error: Could not open file " << filename << endl;
        return students;
    }

    int count;
    file >> count;
    for (int i = 0; i < count; i++)
    {
        string fName, lName;
        double gpa;
        file >> fName >> lName >> gpa;
        students.emplace_back(fName, lName, gpa);
    }

    return students;
}

// Print the contents of the vector of Student objects
void printStudents(const vector<Student> &students)
{
    for (const auto &student : students)
    {
        student.print();
    }
}

int main()
{
    vector<Student> students;
    bool loaded = false;
    int choice;
    do
    {
        cout << endl
             << "Menu:" << endl;
        cout << "1. Load the Data" << endl;
        cout << "2. View the Data" << endl;
        cout << "3. Sort using Merge Sort" << endl;
        cout << "4. Sort using Quick Sort" << endl;
        cout << "5. Exit the program" << endl;
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice)
        {
        case 1:
        {
            string filename;
            cout << "Enter the name of the input file: ";
            cin >> filename;
            students = loadStudentsFromFile(filename);
            loaded = true;
            cout << "Data loaded successfully." << endl;
            break;
        }
        case 2:
        {
            if (loaded)
            {
                cout << "Student data:" << endl;
                printStudents(students);
            }
            else
            {
                cout << "Error: No data loaded." << endl;
            }
            break;
        }
        case 3:
        {
            if (loaded)
            {
                mergeSort(students, 0, students.size() - 1);
                cout << "Data sorted using Merge Sort." << endl;
            }
            else
            {
                cout << "Error: No data loaded." << endl;
            }
            break;
        }
        case 4:
        {
            if (loaded)
            {
                quickSort(students, 0, students.size() - 1);
                cout << "Data sorted using Quick Sort." << endl;
            }
            else
            {
                cout << "Error: No data loaded." << endl;
            }
            break;
        }
        case 5:
        {
            cout << "Exiting the program." << endl;
            break;
        }
        default:
        {
            cout << "Invalid choice. Please enter a number from 1 to 5." << endl;
            break;
        }
        }
    } while (choice != 5);

    return 0;
}
