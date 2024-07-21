package advanced_java.threads.banking_system.domain;

import java.util.HashMap;
import java.util.Map;

public enum TransactionType {
    DEPOSIT, WITHDRAW;

    private static final Map<TransactionType, String> map = new HashMap<>();

    static {
        map.put(DEPOSIT, "Depósito");
        map.put(WITHDRAW, "Saque");
    }

    @Override
    public String toString() {
        return map.get(this);
    }
}
