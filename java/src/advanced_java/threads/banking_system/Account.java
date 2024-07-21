package advanced_java.threads.banking_system;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

public class Account {
    private static int nextId = 1;
    private final int id;
    private String agency;
    private Owner owner;
    private double balance;
    private String accountNumber;
    private final AccountType accountType;
    private final List<Transaction> transactions;

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
        transactions.add(new Transaction(LocalDateTime.now(), amount, TransactionType.DEPOSIT));
    }

    public synchronized void withdraw(double amount) throws InsufficientFundsException {
        if (balance < amount) throw new InsufficientFundsException("Saldo insuficiente.");
        balance -= amount;
        transactions.add(new Transaction(LocalDateTime.now(), amount, TransactionType.WITHDRAW));
    }

    public int getId() {
        return id;
    }

    private String generateAccountNumber() {
        StringBuilder accountNumberBuilder = new StringBuilder();
        for (int i = 0; i < 8; i++)  accountNumberBuilder.append((int)(Math.random() * 10));
        accountNumberBuilder.append("-").append((int)(Math.random() * 10));
        return accountNumberBuilder.toString();
    }

    @Override
    public String toString() {
        return "\u001B[34m\nConta \u001B[0m"+id+":\n------------\nTitular: "+owner+"\nAngencia: "+agency+"\nSaldo: "+
                balance+"\nNumero: "+accountNumber+"\nTipo: "+accountType+"\n\u001B[33mTransações: \u001B[0m"+transactions+"\n";

    }
}
