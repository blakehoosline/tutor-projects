import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;


public class Main {

    public static int Ackerman(int m, int n) {
        if (m == 0) {
            return n + 1;
        } else if (n == 0) {
            return Ackerman(m - 1, 1);
        } else {
            return Ackerman(m - 1, Ackerman(m, n - 1));
        }
    }

    public static int numberOfOnesInBinaryRepresentation(int num) {
        int count = 0;
        while (num != 0) {
            if ((num & 1) == 1) {
                count++;
            }
            num >>= 1;
        }
        return count;
    }

    public static void printReverse(Scanner in) {
        List<String> lines = new ArrayList<>();
        while (in.hasNextLine()) {
            String line = in.nextLine();
            if (!line.isEmpty()) {
                lines.add(line);
            } else {
                break; // stop reading input if an empty line is entered
            }
        }
        for (int i = lines.size() - 1; i >= 0; i--) {
            String[] words = lines.get(i).split(" ");
            for (int j = words.length - 1; j >= 0; j--) {
                System.out.print(words[j] + " ");
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Test Ackermann function
        System.out.println("Ackerman function:");
        System.out.println("A(2,3) = " + Ackerman(2, 3));
        System.out.println("A(3,2) = " + Ackerman(3, 2));
        System.out.println("A(3,4) = " + Ackerman(3, 4));

        // Test numberOfOnesInBinaryRepresentation function
        System.out.println("\nNumber of ones in binary representation:");
        System.out.println("Number of ones in binary representation of 15 = " + numberOfOnesInBinaryRepresentation(15));
        System.out.println("Number of ones in binary representation of 27 = " + numberOfOnesInBinaryRepresentation(27));
        System.out.println("Number of ones in binary representation of 255 = " + numberOfOnesInBinaryRepresentation(255));

        // Test printReverse function
        System.out.println("\nPrint input lines in reverse order:");
        System.out.println("Enter some lines of text (empty line to stop):");
        printReverse(scanner);
    }
}
