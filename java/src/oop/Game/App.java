package oop.Game;

import java.util.Scanner;

public class App {
    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        boolean sair = false;
        while (!sair) {
            exibirMenu();
            int escolha = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer após a leitura do inteiro

            switch (escolha) {
                case 1:
                    visualizarInformacoes();
                    break;
                case 2:
                    simularBatalha();
                    break;
                case 3:
                    sair = true;
                    System.out.println("Saindo do programa...");
                    break;
                default:
                    System.out.println("Opção inválida! Tente novamente.");
                    break;
            }
        }
        scanner.close(); // Fechar o scanner ao sair do programa
    }

    private static void exibirMenu() {
        System.out.println("\n========== Menu Principal ==========");
        System.out.println("1. Visualizar informações de personagem");
        System.out.println("2. Simular batalha");
        System.out.println("3. Sair");
        System.out.print("Escolha uma opção: ");
    }

    private static void visualizarInformacoes() {
        System.out.println("\n========== Visualizar Informações de Personagem ==========");
        Ninja personagem1 = (Ninja) criarPersonagem("Naruto Uzumaki", 100);
        Ninja personagem2 = (Ninja) criarPersonagem("Sasuke Uchiha", 100);

        exibirPersonagem(personagem1);
        exibirPersonagem(personagem2);
    }

    private static void simularBatalha() {
        System.out.println("\n========== Simular Batalha ==========");
        Ninja personagem1 = (Ninja) criarPersonagem("Naruto Uzumaki", 100);
        Ninja personagem2 = (Ninja) criarPersonagem("Sasuke Uchiha", 100);

        Battle batalha = new Battle(personagem1, personagem2);
        batalha.simulateBattle();
    }

    private static Person criarPersonagem(String nome, int vida) {
        return new Ninja(nome, vida);
    }

    private static void exibirPersonagem(Person personagem) {
        System.out.println(personagem.toString());
    }
}
