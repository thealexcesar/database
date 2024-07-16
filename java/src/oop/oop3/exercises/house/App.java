package oop.oop3.exercises.house;


import java.util.ArrayList;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        boolean continueLoop = true;
        ArrayList<House> houseList = new ArrayList<>();

        while (continueLoop) {
            displayMenu();
            int option = getValidOption(input);

            switch (option) {
                case 1 -> House.addHouse(input, houseList);
                case 2 -> House.listHouses(houseList);
                case 3 -> continueLoop = false;
                default -> System.err.println("Opção inválida. Por favor, tente novamente.");
            }
        }

        input.close();
    }

    private static void displayMenu() {
        System.out.println("\n\u001B[34mMenu:\u001B[0m");
        System.out.println("-------------------------------");
        System.out.println("[1] Registrar Casa");
        System.out.println("[2] Listar Casas");
        System.out.println("[3] Sair");
        System.out.print("Escolha uma opção: ");
    }

    private static int getValidOption(Scanner input) {
        int option;
        while (true) {
            try {
                option = Integer.parseInt(input.nextLine());
                if (option >= 1 && option <= 3) {
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
