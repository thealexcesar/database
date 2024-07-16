package oop.oop4.exercises.n5;

import java.util.ArrayList;
import java.util.List;
/**
 * Create a Bank class with a static list of bank accounts and static methods to open an account,
 * close an account, deposit, withdraw, and transfer money between accounts.
 * @author Alex Cesar
 */
public class Bank {
    public static final String RESET = "\u001B[0m";
    public static final String BLUE = "\u001B[34m";
    public static final String GREEN = "\u001B[32m";

    private static List<BankAccount> accounts = new ArrayList<>();

    public static void openAccount(String accountNumber, String accountHolder, double initialDeposit) {
        if (initialDeposit <= 0) {
            System.out.println("Initial deposit must be greater than zero.");
            return;
        }
        BankAccount account = new BankAccount(accountNumber, accountHolder, initialDeposit);
        accounts.add(account);
        System.out.println(GREEN+"Conta aberta com sucesso: " + accountNumber+RESET);
    }

    public static void closeAccount(String accountNumber) {
        BankAccount accountToClose = null;
        boolean accountFound = false;
        for (BankAccount account : accounts) {
            if (account.getAccountNumber().equals(accountNumber)) {
                accountFound = true;
                if (account.getBalance() == 0) {
                    accountToClose = account;
                } else {
                    System.err.println("Impossível fechar a conta " + accountNumber + ", seu saldo precisa ser R$0.00.");
                }
                break;
            }
        }

        if (accountToClose != null) {
            accounts.remove(accountToClose);
            System.out.println(GREEN + "Conta fechada com sucesso: " + accountToClose.getAccountNumber() + RESET);
        } else if (!accountFound) {
            System.err.println("Conta não encontrada: " + accountNumber);
        }
    }


    public static void deposit(String accountNumber, double amount) {
        if (amount <= 0) {
            System.err.println("Deposito deve ser maior que zero.");
            return;
        }
        BankAccount account = findAccountByNumber(accountNumber);
        if (account != null) {
            account.setBalance(account.getBalance() + amount);
            System.out.println(GREEN+"Depósito de R$" + amount + " na conta " + accountNumber + " realizado com sucesso."+RESET);
        } else {
            System.err.println("Conta não encontrada: " + accountNumber);
        }
    }

    public static void withdraw(String accountNumber, double amount) {
        if (amount <= 0) {
            System.err.println("Deposito deve ser maior que zero.");
            return;
        }
        BankAccount account = findAccountByNumber(accountNumber);
        if (account != null) {
            if (account.getBalance() >= amount) {
                account.setBalance(account.getBalance() - amount);
                System.out.println(GREEN+"Saque de R$" + amount + " da conta " + accountNumber + " realizado com sucesso."+RESET);
            } else {
                System.err.println("Saldo insuficiente na conta " + accountNumber);
            }
        } else {
            System.err.println("Conta não encontrada: " + accountNumber);
        }
    }

    public static void transferMoney(String fromAccountNumber, String toAccountNumber, double amount) {
        if (amount <= 0) {
            System.err.println("Transferencia deve ser maior que zero.");
            return;
        }
        BankAccount fromAccount = findAccountByNumber(fromAccountNumber);
        BankAccount toAccount = findAccountByNumber(toAccountNumber);

        if (fromAccount == null) {
            System.err.println("Conta " + fromAccountNumber + " não encontrada.");
        } else if (toAccount == null) {
            System.err.println("Conta " + toAccountNumber + " não encontrada.");
        } else {
            if (fromAccount.getBalance() >= amount) {
                fromAccount.setBalance(fromAccount.getBalance() - amount);
                toAccount.setBalance(toAccount.getBalance() + amount);
                System.out.println(GREEN+"Transferência de R$" + amount + " da conta " + fromAccountNumber +
                        " para a conta " + toAccountNumber + " realizada com sucesso."+RESET);
            } else {
                System.err.println("Saldo insuficiente na conta " + fromAccountNumber);
            }
        }
    }

    private static BankAccount findAccountByNumber(String accountNumber) {
        for (BankAccount account : accounts) {
            if (account.getAccountNumber().equals(accountNumber)) {
                return account;
            }
        }
        return null;
    }

    public static List<BankAccount> getAccounts() {
        return accounts;
    }
}
