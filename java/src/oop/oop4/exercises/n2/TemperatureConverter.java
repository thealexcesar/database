package oop.oop4.exercises.n2;
import java.util.Scanner;
/**
 * Create a class TemperatureConverter with a static method
 * celsiusToFahrenheit that converts a temperature from Celsius to Fahrenheit
 * and a method fahrenheitToCelsius that converts from Fahrenheit to Celsius.
 * @author Alex Cesar
 */
public class TemperatureConverter {
    private static double celsiusToFahrenheit(double celsius) {
        return (celsius * 9 / 5) + 32;
    }

    private static double fahrenheitToCelsius(double fahrenheit) {
        return (fahrenheit - 32) * 5 / 9;
    }

    public void temperatureConverterToString() {
        Scanner scan = new Scanner(System.in);

        int choice = 0;
        while (true) {
            System.out.println("\nEscolha o tipo de Conversão:\n[1] Celsius -> Fahrenheit\n[2] Fahrenheit -> Celsius");
            System.out.print("Opção: ");

            if (scan.hasNextInt()) {
                choice = scan.nextInt();
                double degree;

                switch (choice) {
                    case 1:
                        System.out.print("Digite a temperatura em Celsius: ");
                        degree = scan.nextDouble();
                        double convertedTemp1 = celsiusToFahrenheit(degree);
                        System.out.printf("%.2f Celsius = %.2f Fahrenheit.\n", degree, convertedTemp1);
                        break;
                    case 2:
                        System.out.print("Digite a temperatura em Fahrenheit: ");
                        degree = scan.nextDouble();
                        double convertedTemp2 = fahrenheitToCelsius(degree);
                        System.out.printf("%.2f Fahrenheit = %.2f Celsius.\n", degree, convertedTemp2);
                        break;
                    default:
                        System.out.println("Opção inválida. Escolha 1 ou 2.");
                        continue;
                }

                scan.nextLine();
            } else {
                System.out.println("Opção inválida. Por favor, digite um número inteiro.");
                scan.nextLine();
                continue;
            }

            System.out.print("Deseja continuar? (S/N): ");
            String continuar = scan.nextLine();
            if (!continuar.equalsIgnoreCase("s")) break;
        }

        scan.close();
        System.out.println("Programa encerrado.");
    }
}
