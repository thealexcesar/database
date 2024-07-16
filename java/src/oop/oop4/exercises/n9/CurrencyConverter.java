package oop.oop4.exercises.n9;

import java.util.Currency;

/**
 * Create a CurrencyConverter interface with a convert(double amount, String fromCurrency, String
 * toCurrency) method. Implement this interface in two different classes, UsdToEurConverter and
 * EurToThbConverter, which convert values between different currencies.
 * @author Alex Cesar
 * */
public interface CurrencyConverter {
    double convert(double amount, String fromCurrency, String toCurrency);
}
