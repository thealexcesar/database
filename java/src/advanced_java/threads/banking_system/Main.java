package advanced_java.threads.banking_system;

public class Main {
    public static void main(String[] args) {
        Bank bank = new Bank();
        Owner owner1 = new Owner("Alan Turing");
        Owner owner2 = new Owner("John Von Neumann");
        Owner owner3 = new Owner("James Gosling");

        int account1 = bank.addAccount(owner1, AccountType.CHECKING);
        int account2 = bank.addAccount(owner2, AccountType.SAVINGS);
        int account3 = bank.addAccount(owner3, AccountType.BUSINESS);

        Thread t1 = new CustomerThread(bank, account1, true, 100.0);
        Thread t2 = new CustomerThread(bank, account1, false, 50.0);
        Thread t3 = new CustomerThread(bank, account1, true, 300.0);
        Thread t4 = new CustomerThread(bank, account1, false, 150.0);
        Thread t5 = new CustomerThread(bank, account1, true, 200.0);

        Thread t6 = new CustomerThread(bank, account2, true, 500.0);
        Thread t7 = new CustomerThread(bank, account2, false, 200.0);
        Thread t8 = new CustomerThread(bank, account2, true, 400.0);

        Thread t9 = new CustomerThread(bank, account3, true, 1000.0);
        Thread t10 = new CustomerThread(bank, account3, false, 500.0);

        t1.start();
        t2.start();
        t3.start();
        t4.start();
        t5.start();
        t6.start();
        t7.start();
        t8.start();
        t9.start();
        t10.start();

        try {
            t1.join(100);
            t2.join(200);
            t3.join(200);
            t4.join(100);
            t5.join(3);
            t6.join();
            t7.join();
            t8.join();
            t9.join();
            t10.join();
        } catch (InterruptedException e) {
            System.err.println("Main thread interrupted"+e.getMessage());
        }

        System.out.println(bank.getAccount(account1));
        System.out.println(bank.getAccount(account2));
        System.out.println(bank.getAccount(account3));
    }
}
