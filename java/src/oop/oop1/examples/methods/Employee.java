package oop.oop1.examples.methods;

import java.util.Arrays;

public class Employee {
    private String name;
    private double[] salaries;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        if (name == null || name.length() == 0) {
            System.err.println("Insira um nome válido");
            return;
        }
        this.name = name;
    }

    public double[] getSalaries() {
        return salaries;
    }

    public void setSalaries(double[] salaries) {
        this.salaries = salaries;
    }

    @Override
    public String toString() {
        StringBuilder msg = new StringBuilder();
        msg.append("\u001B[34mEmployee:\u001B[0m\n------------------\nname: ")
                .append(name).append("\nsalaries:\n");

        if (salaries != null) {
            for (int i = 0; i < salaries.length; i++) {
                msg.append(salaries[i]);
                if (i < salaries.length - 1) {
                    msg.append(", ");
                }
            }
            msg.append("\n")
                    .append(averageSalary())
                    .append("\nUsing Arrays.toString: ")
                    .append(Arrays.toString(salaries))
                    .append("\n---------------------\n");
        } else {
            msg.append("No salaries found\n---------------------\n");
        }
        return msg.toString();
    }

    public String averageSalary() {
        if (salaries == null || salaries.length == 0) {
            return "";
        }

        double sum = 0;
        for (double salary : salaries) {
            sum += salary;
        }
        double average = sum / salaries.length;

        return String.format("Average: %.2f", average);
    }
}
