package advanced_java.threads.banking_system;

import java.util.HashMap;
import java.util.Map;

public class Bank {
    private final Map<Integer, Account> accounts;

    public Bank() {
        this.accounts = new HashMap<>();
    }

    public synchronized int addAccount(Owner owner, AccountType accountType) {
        Account newAccount = new Account(owner, accountType);
        accounts.put(newAccount.getId(), newAccount);
        return newAccount.getId();
    }

    public Account getAccount(int accountId) {
        return accounts.get(accountId);
    }
}
