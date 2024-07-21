package advanced_java.threads.banking_system;

import java.time.LocalDateTime;

public class Transaction {
    private LocalDateTime dateTime;
    private double amount;
    private TransactionType type;
    private DepositType depositType;

    public Transaction(LocalDateTime dateTime, double amount, TransactionType type, DepositType depositType) {
        this.dateTime = dateTime;
        this.amount = amount;
        this.type = type;
        this.depositType = depositType;
    }

    @Override
    public String toString() {
        return "Transaction{" +
                "dateTime=" + dateTime +
                ", amount=" + amount +
                ", type=" + type +
                ", depositType=" + depositType +
                '}';
    }
}
