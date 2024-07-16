package oop.oop4.exercises.n9;

public class App {
    public static void main(String[] args) {
        CurrencyConverter converter1 = new UsdToEurConverter();
        double amount1 = converter1.convert(100.0, "USD", "EUR");
        System.out.printf("USD 100.0 = EUR %.2f\n", amount1);

        CurrencyConverter converter2 = new EurToThbConverter();
        double amount2 = converter2.convert(50.0, "EUR", "THB");
        System.out.printf("EUR 50.0 = THB %.2f\n", amount2);
    }
}
