package oop.oop4.exercises.n9;

public class EurToThbConverter implements CurrencyConverter{
    private static final double EUR_TO_THB = 39.55;

    @Override
    public double convert(double amount, String fromCurrency, String toCurrency) {
        if (fromCurrency.equals("EUR") && toCurrency.equals("THB")) {
            return amount * EUR_TO_THB;
        } else if (fromCurrency.equals("THB") && toCurrency.equals("EUR")) {
            return amount / EUR_TO_THB;
        }
        return 0;
    }
}
