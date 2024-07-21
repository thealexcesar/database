package advanced_java.threads.banking_system.service;

import advanced_java.threads.banking_system.domain.*;
import advanced_java.threads.banking_system.infrastructure.logs.LogFileHandler;
import java.util.List;

public class BankService {
    private final Bank bank;
    private final LogFileHandler logFileHandler;

    public BankService(Bank bank) {
        this.bank = bank;
        this.logFileHandler = new LogFileHandler("./transactions.csv");
    }

    public void createAccounts() {
        Owner owner1 = new Owner("Alan Turing");
        Owner owner2 = new Owner("John Von Neumann");
        Owner owner3 = new Owner("James Gosling");

        int account1 = bank.addAccount(owner1, AccountType.CHECKING);
        int account2 = bank.addAccount(owner2, AccountType.SAVINGS);
        int account3 = bank.addAccount(owner3, AccountType.BUSINESS);

        List<Thread> threads = List.of(
                new CustomerThread(bank, account1, true, 100.0),
                new CustomerThread(bank, account1, false, 50.0),
                new CustomerThread(bank, account1, true, 300.0),
                new CustomerThread(bank, account1, false, 150.0),
                new CustomerThread(bank, account1, true, 200.0),
                new CustomerThread(bank, account2, true, 500.0),
                new CustomerThread(bank, account2, false, 200.0),
                new CustomerThread(bank, account2, true, 400.0),
                new CustomerThread(bank, account3, true, 1000.0),
                new CustomerThread(bank, account3, false, 500.0)
        );

        for (Thread thread : threads) {
            thread.start();
        }

        for (Thread thread : threads) {
            try {
                thread.join();
            } catch (InterruptedException e) {
                System.err.println("Thread interrompida: "+e.getMessage());
            }
        }

        System.out.println(bank.getAccount(account1));
        System.out.println(bank.getAccount(account2));
        System.out.println(bank.getAccount(account3));

        logTransactions();
    }

    public void showTransactions() {
        printTransactions();
    }

    private void logTransactions() {
        for (Account account : bank.getAccounts()) {
            for (Transaction transaction : account.getTransactions()) {
                logFileHandler.writeLog("Conta "+account.getId()+": "+transaction.toString()+" Saldo: "+account.getBalance());
            }
        }
    }

    private void printTransactions() {
        for (Account account : bank.getAccounts()) {
            System.out.println("\nTransações da conta "+account.getAccountNumber()+":");
            for (Transaction transaction : account.getTransactions()) {
                System.out.println(transaction);
            }
        }
    }

    public void logTransaction(Account account, Transaction transaction) {
        logFileHandler.writeLog("Conta "+account.getId()+": "+transaction.toString()+" Saldo: "+account.getBalance());
    }

    public void logError(Account account, double amount, String errorMessage) {
        logFileHandler.writeLog("Conta "+account.getId()+": Erro ao tentar sacar "+amount+" - "+errorMessage);
    }
}
