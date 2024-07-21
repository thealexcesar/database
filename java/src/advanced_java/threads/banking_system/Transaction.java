package advanced_java.threads.banking_system;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.text.NumberFormat;

public class Transaction {
    private final LocalDateTime dateTime;
    private final double amount;
    private final TransactionType type;

    public Transaction(LocalDateTime dateTime, double amount, TransactionType type) {
        this.dateTime = dateTime;
        this.amount = amount;
        this.type = type;
    }

    @Override
    public String toString() {
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss", new Locale("pt", "BR"));
        NumberFormat cf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
        return "Valor: "+cf.format(amount)+" Data: " + dateTime.format(df)+" Tipo: "+type;
    }
}
