package oop.oop3.exercises.employee;

import java.util.ArrayList;
import java.util.Scanner;
/**
 * Create a class named Employee to model information about an employee.
 * Attributes: Name, Position, Salary, Department
 * Methods: promote and displayDetails.
 * @author Alex Cesar
 * */
class Employee {
    private String name;
    private String position;
    private double salary;
    private String department;
    private static ArrayList<Employee> employeeList = new ArrayList<>();

    public Employee(String name, String position, double salary, String department) {
        this.name = name;
        this.position = position;
        this.salary = salary;
        this.department = department;
    }

    public void promote(String newPosition, double newSalary) {
        this.position = newPosition;
        this.salary = newSalary;
    }

    public void displayDetails() {
        System.out.println("Nome: " + name);
        System.out.println("Cargo: " + position);
        System.out.println("Salário: " + salary);
        System.out.println("Departamento: " + department);
    }

    public static Employee createEmployee(Scanner input) {
        System.out.print("Digite o nome: ");
        String name = input.nextLine();
        System.out.print("Digite o cargo: ");
        String position = input.nextLine();
        System.out.print("Digite o salário: ");
        double salary = Double.parseDouble(input.nextLine());
        System.out.print("Digite o departamento: ");
        String department = input.nextLine();
        return new Employee(name, position, salary, department);
    }

    public static void addEmployee(Scanner input) {
        employeeList.add(createEmployee(input));
        System.out.println("Funcionário registrado com sucesso.");
    }

    public static void promoteEmployee(Scanner input) {
        System.out.print("Digite o nome do funcionário a ser promovido: ");
        String name = input.nextLine();
        Employee employee = findEmployee(name);
        if (employee != null) {
            System.out.print("Digite o novo cargo: ");
            String newPosition = input.nextLine();
            System.out.print("Digite o novo salário: ");
            double newSalary = Double.parseDouble(input.nextLine());
            employee.promote(newPosition, newSalary);
            System.out.println("Funcionário promovido com sucesso.");
        } else {
            System.err.println("Funcionário não encontrado.");
        }
    }

    private static Employee findEmployee(String name) {
        for (Employee employee : employeeList) {
            if (employee.name.equalsIgnoreCase(name)) {
                return employee;
            }
        }
        return null;
    }

    public static void listEmployees() {
        if (employeeList.isEmpty()) {
            System.err.println("Nenhum funcionário registrado.");
        } else {
            System.out.println("\n\u001B[34mLista de Funcionários\u001B[0m");
            System.out.println("------------------------------------------------");
            for (Employee employee : employeeList) {
                employee.displayDetails();
                System.out.println();
            }
            System.out.println("------------------------------------------------");
        }
    }
}