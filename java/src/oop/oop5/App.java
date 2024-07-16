package oop.oop5;

import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        boolean continueLoop = true;

        while (continueLoop) {
            displayMenu();
            int option = getValidOption(input);

            switch (option) {
                case 1 -> Plant.addPlant(input);
                case 2 -> Fungus.addFungus(input);
                case 3 -> Animal.addAnimal(input);
                case 4 -> listAllLivingBeings();
                case 5 -> Plant.listPlants();
                case 6 -> Fungus.listFungi();
                case 7 -> Animal.listAnimals();
                case 8 -> continueLoop = false;
                default -> System.err.println("Opção inválida. Por favor, tente novamente.");
            }
        }

        input.close();
    }

    private static void displayMenu() {
        System.out.println("\n\u001B[34mMenu de Cadastro de Seres Vivos\u001B[0m");
        System.out.println("-------------------------------");
        System.out.println("[1] Cadastrar Planta");
        System.out.println("[2] Cadastrar Fungo");
        System.out.println("[3] Cadastrar Animal");
        System.out.println("[4] Listar Todos os Seres Vivos");
        System.out.println("[5] Listar Plantas");
        System.out.println("[6] Listar Fungos");
        System.out.println("[7] Listar Animais");
        System.out.println("[8] Sair");
        System.out.print("Escolha uma opção: ");
    }

    private static int getValidOption(Scanner input) {
        int option;
        while (true) {
            try {
                option = Integer.parseInt(input.nextLine());
                if (option >= 1 && option <= 8) {
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

    private static void listAllLivingBeings() {
        boolean anyLivingBeings = false;

        if (!Plant.getPlants().isEmpty()) {
            System.out.println("\n\u001B[34mLista de Plantas: \u001B[0m");
            System.out.println("-------------------------------");
            for (Plant plant : Plant.getPlants()) {
                System.out.println(plant);
            }
            anyLivingBeings = true;
        }

        if (!Fungus.getFungi().isEmpty()) {
            System.out.println("\n\u001B[34mLista de Fungos: \u001B[0m");
            System.out.println("-------------------------------");
            for (Fungus fungus : Fungus.getFungi()) {
                System.out.println(fungus);
            }
            anyLivingBeings = true;
        }

        if (!Animal.getAnimals().isEmpty()) {
            System.out.println("\n\u001B[34mLista de Animais: \u001B[0m");
            System.out.println("-------------------------------");
            for (Animal animal : Animal.getAnimals()) {
                System.out.println(animal);
            }
            anyLivingBeings = true;
        }

        if (!anyLivingBeings) {
            System.err.println("\n\u001B[34mNenhum ser vivo cadastrado. \u001B[0m");
            System.out.println("-------------------------------");
        }
    }
}
