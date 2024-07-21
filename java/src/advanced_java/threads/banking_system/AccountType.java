package advanced_java.threads.banking_system;

import java.util.HashMap;
import java.util.Map;

public enum AccountType {
    BUSINESS, CHECKING, SAVINGS;

    private static final Map<AccountType, String> map = new HashMap<>();

    static {
        map.put(BUSINESS, "Conta Salário");
        map.put(CHECKING, "Conta Corrente");
        map.put(SAVINGS, "Conta Poupança");
    }

    @Override
    public String toString() {
        return map.get(this);
    }
}
