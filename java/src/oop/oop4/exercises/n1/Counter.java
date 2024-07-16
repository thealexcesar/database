package oop.oop4.exercises.n1;
/**
 * Creates a Counter class with a static variable 'count' and a constructor that increments
 * this variable every time a new instance of the class is created. Provides a static method
 * getCount() that returns the current value of 'count'.
 * @author Alex Cesar.
 */
class Counter {
    private static int counter = 0;

    public Counter() {
        counter++;
    }

    public static int getCounter() {
        return counter;
    }

    public static void counterToString() {
        System.out.println("counter: " + getCounter());
    }
}