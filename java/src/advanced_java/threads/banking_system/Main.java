package advanced_java.threads.banking_system;

import advanced_java.threads.banking_system.domain.Bank;
import advanced_java.threads.banking_system.infrastructure.logs.ParallelLogProcessor;
import advanced_java.threads.banking_system.service.BankService;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.concurrent.ExecutionException;

public class Main {
    public static void main(String[] args) {
        Bank bank = new Bank();
        BankService bankService = new BankService(bank);

        bankService.createAccounts();

        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.println("\u001B[34m\nEscolha uma opção: \u001B[0m");
            System.out.println("[1] Visualizar transações");
            System.out.println("[2] Processar arquivos de log para contar ocorrências de uma palavra");
            System.out.println("[3] Sair");
            int choice = getValidChoice(scanner);

            switch (choice) {
                case 1 -> bankService.showTransactions();
                case 2 -> {
                    System.out.print("Digite a palavra a ser contada nos logs: ");
                    processLogs(scanner.nextLine());
                }
                case 3 -> {
                    System.out.println("Saindo...");
                    System.exit(0);
                }
                default -> System.out.println("Opção inválida.");
            }
        }
    }

    private static int getValidChoice(Scanner scanner) {
        int choice = -1;
        try {
            choice = Integer.parseInt(scanner.nextLine());
        } catch (NumberFormatException e) {
            System.out.println("Entrada inválida. Por favor, insira um número.");
        }
        return choice;
    }

    private static void processLogs(String wordToCount) {
        List<String> filePaths = new ArrayList<>();
        filePaths.add("./transactions.csv");

        ParallelLogProcessor parallelLogProcessor = new ParallelLogProcessor(4);
        try {
            int totalOccurrences = parallelLogProcessor.processLogs(filePaths, wordToCount);
            System.out.println("Total ocorrências da palavra '" + wordToCount + "': " + totalOccurrences);
        } catch (InterruptedException | ExecutionException e) {
            System.err.println(e.getMessage());
        }
    }
}
