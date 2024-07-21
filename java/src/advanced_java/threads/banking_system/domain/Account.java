package advanced_java.threads.banking_system.domain;

import advanced_java.threads.banking_system.service.BankService;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Account {
    private static int nextId = 1;
    private final int id;
    private String agency;
    private Owner owner;
    private double balance;
    private String accountNumber;
    private final AccountType accountType;
    private final List<Transaction> transactions;
    private BankService bankService;

    public Account(Owner owner, AccountType accountType) {
        this.id = nextId++;
        this.balance = 0D;
        this.agency = "001";
        this.owner = owner;
        this.accountNumber = generateAccountNumber();
        this.accountType = accountType;
        this.transactions = Collections.synchronizedList(new ArrayList<>());
        owner.setAccountId(this.id);
    }

    public synchronized void deposit(double amount) {
        balance += amount;
        Transaction transaction = new Transaction(LocalDateTime.now(), amount, TransactionType.DEPOSIT, owner.getName());
        transactions.add(transaction);
        if (bankService != null) {
            bankService.logTransaction(this, transaction);
        }
    }

    public synchronized void withdraw(double amount) throws InsufficientFundsException {
        try {
            if (balance < amount) throw new InsufficientFundsException("Saldo insuficiente.");
            balance -= amount;
            Transaction transaction = new Transaction(LocalDateTime.now(), amount, TransactionType.WITHDRAW, owner.getName());
            transactions.add(transaction);

            if (bankService != null) bankService.logTransaction(this, transaction);
        } catch (InsufficientFundsException e) {
            if (bankService != null)   bankService.logError(this, amount, e.getMessage()); throw e;
        }
    }

    public int getId() {
        return id;
    }

    public double getBalance() {
        return balance;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public List<Transaction> getTransactions() {
        return transactions;
    }

    private String generateAccountNumber() {
        StringBuilder accountNumberBuilder = new StringBuilder();
        for (int i = 0; i < 8; i++) accountNumberBuilder.append((int) (Math.random() * 10));
        accountNumberBuilder.append("-").append((int) (Math.random() * 10));
        return accountNumberBuilder.toString();
    }

    @Override
    public String toString() {
        return "\nConta " + id + ":\n--------\nTitular: " + owner + "\nAgencia: " + agency +
                "\nNumero: " + accountNumber + "\nTipo: " + accountType + "\nSaldo Atual: R$" + balance;
    }
}
