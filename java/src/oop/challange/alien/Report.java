package oop.challange.alien;

import java.util.List;

public class Report {
    private List<Alien> alienList;

    public Report(List<Alien> alienList) {
        this.alienList = alienList;
    }

    public void printReport() {
        System.out.println("\u001B[34mRelatorio de entradas de alienigenas\u001B[0m\n----------------------------");
        for (Alien alien : alienList) {
            System.out.println("Nome: " + alien.getName());
            System.out.println("Especie: " + alien.getSpecies().getName());
            System.out.println("Nivel de periculosidade: " + alien.getDangerLevel());
            System.out.println("Dasta/Hora de entrada: " + alien.getInnerAt());
            System.out.println();
        }
    }
}
