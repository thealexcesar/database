package oop.oop3.exercises.person;

import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Person[] people = {
                new Person("Kratos", 35, 1.85, 110),
                new Person("Dante", 30, 1.78, 75),
                new Person("Ezio Auditore", 45, 1.8, 78)
        };

        System.out.println("\u001B[34m Person \u001B[0m\n-----------------------------------");
        for (Person person : people) {
            person.displayInfo();
            person.gainWeight(10);
            person.loseWeight(7);
            person.displayInfo();
        }

    }
}
