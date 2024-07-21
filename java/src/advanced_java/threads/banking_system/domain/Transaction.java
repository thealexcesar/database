package advanced_java.threads.banking_system.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.text.NumberFormat;

public class Transaction {
    private final LocalDateTime dateTime;
    private final double amount;
    private final TransactionType type;
    private final String accountOwner;

    public Transaction(LocalDateTime dateTime, double amount, TransactionType type, String accountOwner) {
        this.dateTime = dateTime;
        this.amount = amount;
        this.type = type;
        this.accountOwner = accountOwner;
    }

    @Override
    public String toString() {
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss", new Locale("pt", "BR"));
        NumberFormat cf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
        return "Titular: " + accountOwner + " - Valor: " + cf.format(amount) + " Data: " + dateTime.format(df) + " Tipo: " + type;
    }
}
