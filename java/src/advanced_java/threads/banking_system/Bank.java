package advanced_java.threads.banking_system;

import java.util.HashMap;
import java.util.Map;

public class Bank {
    private Map<Integer, Account> accounts;

    public Bank() {
        this.accounts = new HashMap<>();
    }

    public synchronized void addAccount(AccountType accountType) {
        Account newAccount = new Account(accountType);
        accounts.put(newAccount.getId(), newAccount);
    }

    public Map<Integer, Account> getAccounts() {
        return accounts;
    }
}
