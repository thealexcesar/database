package oop.oop4.exercises.n9;

public class UsdToEurConverter implements CurrencyConverter {
    private static final double USD_TO_EUR = 0.93;

    @Override
    public double convert(double amount, String fromCurrency, String toCurrency) {
        if (fromCurrency.equals("USD") && toCurrency.equals("EUR")) {
            return amount * USD_TO_EUR;
        } else if (fromCurrency.equals("EUR") && toCurrency.equals("USD")) {
            return amount / USD_TO_EUR;
        }
        return 0;
    }
}
