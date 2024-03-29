import java.util.Scanner;

public class Magic8Ball {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Ask a yes or no question:");
        String question = scanner.nextLine();

        int randomNumber = (int) (Math.random() * 20);

        String[] responses = {
            "It is certain.", "It is decidedly so.", "Without a doubt.", "Yes definitely.", 
            "You may rely on it.", "As I see it, yes.", "Most likely.", "Outlook good.", 
            "Yes.", "Signs point to yes.", "Reply hazy try again.", "Ask again later.", 
            "Better not tell you now.", "Cannot predict now.", "Concentrate and ask again.", 
            "Don't count on it.", "Outlook not so good.", "My sources say no.", "Very doubtful."
        };

        System.out.println(responses[randomNumber]);
    }
}
