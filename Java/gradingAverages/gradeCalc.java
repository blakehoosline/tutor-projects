import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class StudentGrades {
    public static void main(String[] args) {
        final double EXAM_WEIGHT = 0.45;
        final double ASSIGNMENT_WEIGHT = 0.45;
        final double DISCUSSION_WEIGHT = 0.1;

        Scanner userInput = new Scanner(System.in);
        String fileName;

        do {
            System.out.print("Enter the file name: ");
            fileName = userInput.nextLine();
        } while (!new File(fileName).exists());

        try (Scanner fileInput = new Scanner(new File(fileName))) {
            while (fileInput.hasNextLine()) {
                String name = fileInput.nextLine();
                String examScoresLine = fileInput.nextLine();
                String assignmentScoresLine = fileInput.nextLine();
                String discussionScoresLine = fileInput.nextLine();

                Scanner examScoresScanner = new Scanner(examScoresLine);
                double examSum = 0;
                for (int i = 0; i < 3; i++) {
                    examSum += examScoresScanner.nextDouble();
                }
                double examAverage = examSum / 3;
                double examWeightedAverage = examAverage * EXAM_WEIGHT;

                Scanner assignmentScoresScanner = new Scanner(assignmentScoresLine);
                double assignmentSum = 0;
                double minScore = Double.MAX_VALUE;
                int numAssignments = 0;
                while (assignmentScoresScanner.hasNextDouble()) {
                    double score = assignmentScoresScanner.nextDouble();
                    numAssignments++;
                    assignmentSum += score;
                    minScore = Math.min(minScore, score);
                }
                double assignmentAverage = (assignmentSum - minScore) / (numAssignments - 1);
                double assignmentWeightedAverage = assignmentAverage * ASSIGNMENT_WEIGHT;

                Scanner discussionScoresScanner = new Scanner(discussionScoresLine);
                int numDiscussions = 0;
                while (discussionScoresScanner.hasNextInt()) {
                    numDiscussions++;
                    discussionScoresScanner.nextInt();
                }
                int discussionPoints;
                if (numDiscussions >= 8) {
                    discussionPoints = 10;
                } else if (numDiscussions >= 6) {
                    discussionPoints = 5;
                } else {
                    discussionPoints = 0;
                }
                double discussionWeightedPoints = discussionPoints * DISCUSSION_WEIGHT;

                double overallWeightedAverage = examWeightedAverage + assignmentWeightedAverage + discussionWeightedPoints;
                String letterGrade;
                if (overallWeightedAverage >= 90) {
                    letterGrade = "A";
                } else if (overallWeightedAverage >= 80) {
                    letterGrade = "B";
                } else if (overallWeightedAverage >= 70) {
                    letterGrade = "C";
                } else if (overallWeightedAverage >= 60) {
                    letterGrade = "D";
                } else {
                    letterGrade = "F";
                }

                System.out.println("Name: " + name);
                System.out.println("Exam Average: " + examAverage);
                System.out.println("Assignment Average: " + assignmentAverage);
                System.out.println("Discussion Points: " + discussionPoints);
                System.out.println("Overall Weighted Average: " + overallWeightedAverage);
                System.out.println("Letter Grade: " + letterGrade);
                System.out.println();
            }
        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + fileName);
        }
    }
}
