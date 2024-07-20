package advanced_java.threads.banking_system.domain.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

public class Account {
    private UUID id;
    private double balance;
    private List<Transaction> transactions;

    public Account(UUID id) {
        this.id = id;
        this.balance = 0D;
        this.transactions = Collections.synchronizedList(new ArrayList<>());
    }

}
