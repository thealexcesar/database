package oop.oop3.exercises.movie;

import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        boolean continueLoop = true;

        while (continueLoop) {
            displayMenu();
            int option = getValidOption(input);

            switch (option) {
                case 1 -> Book.addBook(input);
                case 2 -> Movie.addMovie(input);
                case 3 -> Book.listBooks();
                case 4 -> Movie.listMovies();
                case 5 -> continueLoop = false;
                default -> System.err.println("Opção inválida. Por favor, tente novamente.");
            }
        }

        input.close();
    }

    private static void displayMenu() {
        System.out.println("\nMenu:");
        System.out.println("-------------------------------");
        System.out.println("[1] Registrar Livro");
        System.out.println("[2] Registrar Filme");
        System.out.println("[3] Listar Livros");
        System.out.println("[4] Listar Filmes");
        System.out.println("[5] Sair");
        System.out.print("Escolha uma opção: ");
    }

    private static int getValidOption(Scanner input) {
        int option;
        while (true) {
            try {
                option = Integer.parseInt(input.nextLine());
                if (option >= 1 && option <= 5) {
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