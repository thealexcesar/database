package advanced_java.threads.banking_system;

public class CustomerThread extends Thread {
    private final Bank bank;
    private final int accountId;
    private final boolean deposit;
    private final double amount;

    public CustomerThread(Bank bank, int accountId, boolean deposit, double amount) {
        this.bank = bank;
        this.accountId = accountId;
        this.deposit = deposit;
        this.amount = amount;
    }

    @Override
    public void run() {
        Account account = bank.getAccount(accountId);
        try {
            if (deposit) {
                account.deposit(amount);
            } else {
                account.withdraw(amount);
            }
        } catch (InsufficientFundsException e) {
            System.err.println("Erro na transação para a conta " + accountId + ": " + e.getMessage());
        }
    }
}
