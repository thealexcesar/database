package oop.oop4.exercises.n5;

public class App {
    public static void main(String[] args) {
        System.out.println(Bank.BLUE+"ABERTURA DE CONTAS:"+Bank.RESET+"\n--------------------------------------------------------------------------");
        Bank.openAccount("123", "Kenpachi Zarachi", 1000);
        Bank.openAccount("456", "Genryusai Shigekuni Yamamoto. [0m", 1500);
        System.out.println("--------------------------------------------------------------------------");

        System.out.println(Bank.BLUE+"\nTODAS AS CONTAS:"+Bank.RESET+"\n---------------------------------------------------------------------------");
        for (BankAccount account : Bank.getAccounts()) {
            System.out.println("Conta: " + account.getAccountNumber() + ", Titular: " + account.getAccountHolder() + ", Saldo: R$" + account.getBalance());
        }
        System.out.println("---------------------------------------------------------------------------");

        System.out.println(Bank.BLUE+"\nDEPOSITO\n"+Bank.RESET+"---------------------------------------------------------------------------");
        Bank.deposit("123", 500);
        Bank.deposit("456", 200);
        Bank.deposit("789", 100);
        System.out.println("---------------------------------------------------------------------------");

        System.out.println(Bank.BLUE+"\nSAQUE\n"+Bank.RESET+"---------------------------------------------------------------------------");
        Bank.withdraw("456", 200);
        Bank.withdraw("123", 5000);
        System.out.println("---------------------------------------------------------------------------");

        System.out.println(Bank.BLUE+"\nTRANSFERENCIA\n"+Bank.RESET+"---------------------------------------------------------------------------");
        Bank.transferMoney("123", "456", 300);
        Bank.transferMoney("123", "789", 100);
        Bank.transferMoney("123", "456", 10000);
        Bank.transferMoney("456", "123", 1800);
        System.out.println("---------------------------------------------------------------------------");

        System.out.println(Bank.BLUE+"\nFECHAMENTO DE CONTA\n"+Bank.RESET+"---------------------------------------------------------------------------");
        Bank.closeAccount("123");
        Bank.closeAccount("456");
    }
}
