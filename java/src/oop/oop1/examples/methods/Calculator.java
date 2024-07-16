package oop.oop1.examples.methods;

public class Calculator {
    public void sumArray(int[] numbers) {
        int sum = 0;
        for (int number : numbers) {
            sum += number;
        }
        System.out.println(sum);
    }

    public void sumArrayUsingVarArgs(String notSpecial, int... numbers){
        int sum = 0;
        for (int number : numbers) {
            sum += number;
        }
        System.out.println(sum);
        System.out.println(notSpecial);
    }
}
