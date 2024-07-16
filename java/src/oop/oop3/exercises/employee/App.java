package oop.oop3.exercises.employee;

import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        boolean continueLoop = true;

        while (continueLoop) {
            displayMenu();
            int option = getValidOption(input);

            switch (option) {
                case 1 -> Employee.addEmployee(input);
                case 2 -> Employee.promoteEmployee(input);
                case 3 -> Employee.listEmployees();
                case 4 -> continueLoop = false;
                default -> System.err.println("Opção inválida. Por favor, tente novamente.");
            }
        }

        input.close();
    }

    private static void displayMenu() {
        System.out.println("\nMenu:");
        System.out.println("-------------------------------");
        System.out.println("[1] Registrar Funcionário");
        System.out.println("[2] Promover Funcionário");
        System.out.println("[3] Listar Funcionários");
        System.out.println("[4] Sair");
        System.out.print("Escolha uma opção: ");
    }

    private static int getValidOption(Scanner input) {
        int option;
        while (true) {
            try {
                option = Integer.parseInt(input.nextLine());
                if (option >= 1 && option <= 4) {
                    break;
                } else {
                    System.err.print("Opção inválida. Por favor, tente novamente: ");
                }
            } catch (NumberFormatException e) {
                System.err.print("Entrada inválida. Por favor, digite um número: ");
            }
        }
        return option;
    }
}