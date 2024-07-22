package advanced_java.netflix.ui.utils;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ConsoleUtils {
    private static final Scanner input = new Scanner(System.in);

    public static int readInt(String prompt) {
        while (true) {
            try {
                System.out.print(prompt);
                return input.nextInt();
            } catch (InputMismatchException e) {
                System.out.println("Entrada inválida. Por favor, digite um número.");
                input.nextLine();
            }
        }
    }

    public static String readString(String prompt) {
        System.out.print(prompt);
        input.nextLine();
        return input.nextLine();
    }
}
