package oop.oop3.exercises.house;

import java.util.ArrayList;
import java.util.Scanner;
/**
 * Create a class named House to model information about a house.
 * Attributes: Address, NumberOfRooms, Area, Value
 * Methods: displayDetails and calculateTaxValue.
 * @author Alex Cesar
 * */
class House {
    private String address;
    private int numberOfRooms;
    private double area;
    private double value;

    public House(String address, int numberOfRooms, double area, double value) {
        this.address = address;
        this.numberOfRooms = numberOfRooms;
        this.area = area;
        this.value = value;
    }

    public void displayDetails() {
        System.out.println("Endereço: " + address);
        System.out.println("Número de Quartos: " + numberOfRooms);
        System.out.println("Área: " + area + " m²");
        System.out.println("Valor: R$ " + value);
        System.out.println("-------------------------------");
    }

    public double calculateTaxValue() {
        return value * 0.02;
    }

    public static House createHouse(Scanner input) {
        System.out.print("Digite o endereço: ");
        String address = input.nextLine();
        System.out.print("Digite o número de quartos: ");
        int numberOfRooms = Integer.parseInt(input.nextLine());
        System.out.print("Digite a área em m²: ");
        double area = Double.parseDouble(input.nextLine());
        System.out.print("Digite o valor: ");
        double value = Double.parseDouble(input.nextLine());
        return new House(address, numberOfRooms, area, value);
    }

    public static void addHouse(Scanner input, ArrayList<House> houseList) {
        houseList.add(createHouse(input));
        System.out.println("Casa registrada com sucesso.");
        System.out.println("-------------------------------");
    }

    public static void listHouses(ArrayList<House> houseList) {
        if (houseList.isEmpty()) {
            System.err.println("\nNenhuma casa registrada.");
            System.out.println("-------------------------------");
        } else {
            System.out.println("\n\u001B[34mLista de Casas:\u001B[0m");
            System.out.println("-------------------------------");
            for (House house : houseList) {
                house.displayDetails();
                System.out.println("Valor do Imposto: R$ " + house.calculateTaxValue());
                System.out.println("-------------------------------");
            }
        }
    }
}
