package advanced_java.threads.banking_system;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Account {
    private static int nextId = 1;
    private int id;
    private double balance;
    private AccountType type;
    private List<Transaction> transactions;

    public Account(AccountType type) {
        this.id = nextId++;
        this.balance = 0D;
        this.transactions = Collections.synchronizedList(new ArrayList<>());
    }

    public void deposit(double amount) {

    }

    public void withdraw(double amount) {

    }

    public int getId() {
        return id;
    }
}
