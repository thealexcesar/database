package advanced_java.threads.banking_system;

public class Owner {
    private String name;
    private int accountId;

    public Owner(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    @Override
    public String toString() {
        return name;
    }
}
