package advanced_java.threads.banking_system;

public class CustomerThread {
    private Bank bank;
    private int accountId;
    private boolean deposit;
    private double amount;

    public CustomerThread(Bank bank, int accountId, boolean deposit, double amount) {
        this.bank = bank;
        this.accountId = accountId;
        this.deposit = deposit;
        this.amount = amount;
    }
}
