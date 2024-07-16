package oop.oop4.exercises.n1;

public class App {
    public static void main(String[] args) {
        Counter[] numbers = new Counter[99];
        for (Counter number : numbers) {
            number = new Counter();
        }
        Counter.counterToString();
    }
}
