package oop.oop3.exercises.cellphone;

import java.util.ArrayList;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        boolean continueLoop = true;
        ArrayList<CellPhone> cellPhoneList = new ArrayList<>();

        while (continueLoop) {
            displayMenu();
            int option = getValidOption(input);

            switch (option) {
                case 1 -> CellPhone.addCellPhone(input, cellPhoneList);
                case 2 -> CellPhone.installAppOnPhone(input, cellPhoneList);
                case 3 -> CellPhone.listCellPhones(cellPhoneList);
                case 4 -> continueLoop = false;
                default -> System.err.println("Opção inválida. Por favor, tente novamente.");
            }
        }

        input.close();
    }

    private static void displayMenu() {
        System.out.println("\n\u001B[34mMenu:\u001B[0m");
        System.out.println("-------------------------------");
        System.out.println("[1] Registrar Celular");
        System.out.println("[2] Instalar Aplicativo");
        System.out.println("[3] Listar Celulares");
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
