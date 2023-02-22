using System;
using System.IO;

class Program
{
   //Function to calulate a customers order.
   static double CalculateOrder(double cost, double option)
   {
       //Declarations
       string stylus, glasses, canvas;

       //Take in the base value of the HoloScroll tablet.
       Console.WriteLine("\nEnter HoloScroll Base Price: ");
       cost = Convert.ToDouble(Console.ReadLine());

       //Confirm the size of the tablet the customer wants.
       Console.WriteLine("\nPress 1 for the regular canvas or 2 for larger canvas: ");
       option = Convert.ToDouble(Console.ReadLine());
       if (option == 2)
       {
           cost += 400;
       }

       //Determine if the customer wants to include a stylus.
       Console.WriteLine("\nAdd a HoloFeather? (y/n): ");
       stylus = Console.ReadLine();
       stylus = stylus.ToLower();
       if (stylus == "y" || stylus == "yes")
       {
           cost += 200;
       }

       //Determine if the customer wants to include a base station.
       Console.WriteLine("\nAdd a HoloBase? (y/n): ");
       canvas = Console.ReadLine();
       canvas = canvas.ToLower();
       if (canvas == "y" || canvas == "yes")
       {
           cost += 500;
       }

       //Determine if the customer wants to include a pair of privacy glasses.
       Console.WriteLine("\nAdd a HoloSights? (y/n): ");
       glasses = Console.ReadLine();
       glasses = glasses.ToLower();
       if (glasses == "y" || glasses == "yes")
       {
           cost += 200;
       }
       return cost;
   }

   static void Main(string[] args)
   {
       //Introduction Message
       Console.WriteLine("Welcome to Ghost Inc.!");

       //Declarations
       double cost = 0, option = 0, total;
       string name;
       int response, test, x = 0;

       //Arrays
       string[] customer = new string[100];
       double[] amount = new double[100];

       //This part decides whether to enter or exit the loop.
       Console.WriteLine("\nSelect a menu item:");
       Console.WriteLine(" 1. Place an Order");
       Console.WriteLine(" 2. Finish for the day");
       try
       {
           response = Convert.ToInt16(Console.ReadLine());
       }
       catch (FormatException)
       {
           Console.WriteLine("Invalid input. Please enter a valid integer.");
           response = 0; // or any other value you want to use to indicate an error
       }

       //While loop checks to make sure that only
       //the number values of 1 and 2 are accepted.
       while (!(response > 0 && response < 3))
       {
           Console.WriteLine("\nInvalid response.\nPlease select a menu item using the correct number value.");
           response = Convert.ToInt16(Console.ReadLine());
       }

       //The do while loop will continue until option 2 is selected.
       do
       {
           //Counter to increase the max value of both arrays
           x++;

           //Receive customer's name.
           Console.WriteLine("\nEnter Customer Name: ");
           name = Console.ReadLine();

           //While loop checks to make sure that a name was entered.
           //And not a blank space or a number.
           while (string.IsNullOrEmpty(name) || int.TryParse(name, out test))
           {
               Console.WriteLine("A name must be entered. Please try again.");
               name = Console.ReadLine();
           }

           //Add name to the array called "customer".
           customer[x - 1] = name;

           //This part starts the function called "CalculateOrder"
           //and takes the final cost value, assigns it to "total"
           //then adds it to the array called "amount".
           total = CalculateOrder(cost, option);
           amount[x-1] = total;

           //Output the customer's name and thier total.
           Console.WriteLine($"\nOrder placed for {name} ${total}");

           //This part decides whether to enter or exit the loop.
           Console.WriteLine("\nSelect a menu item:");
           Console.WriteLine(" 1. Place an Order");
           Console.WriteLine(" 2. Finish for the day");
           response = Convert.ToInt16(Console.ReadLine());

       } while (response == 1) ;

       //Locates and open file named "todaySales.txt"
       StreamWriter todaySales = new StreamWriter(@"C:\Users\samma\OneDrive\Documents\BlueRidge\SDE-193 (C#)\todaySales.txt");

       //Using a for loop it outputs the objects
       //within the arrays "customer" and "amount"
       for (int i = 0; i < x; i++)
       {
           todaySales.WriteLine($"{customer[i]}, ${amount[i]}");
       }

       //Closes the file named "todaySales.txt"
       todaySales.Close();

       //Closing Message
       Console.WriteLine("\nHave a great rest of your day!");
   }
}
