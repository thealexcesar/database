package oop.oop5;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Plant extends LivingBeing {
    private static List<Plant> plants = new ArrayList<>();

    public Plant(String kingdom, String phylum, String kind, String order, String family, String gender, String specie) {
        super(kingdom, phylum, kind, order, family, gender, specie);
    }

    @Override
    public String getType() {
        return "Planta";
    }

    public static void addPlant(Scanner input) {
        System.out.print("Digite o reino da planta: ");
        String kingdom = input.nextLine();
        System.out.print("Digite o filo da planta: ");
        String phylum = input.nextLine();
        System.out.print("Digite a classe da planta: ");
        String kind = input.nextLine();
        System.out.print("Digite a ordem da planta: ");
        String order = input.nextLine();
        System.out.print("Digite a família da planta: ");
        String family = input.nextLine();
        System.out.print("Digite o gênero da planta: ");
        String gender = input.nextLine();
        System.out.print("Digite a espécie da planta: ");
        String specie = input.nextLine();
        Plant plant = new Plant(kingdom, phylum, kind, order, family, gender, specie);
        plants.add(plant);
        System.out.println("Planta cadastrada com sucesso!");
    }

    public static void listPlants() {
        if (plants.isEmpty()) {
            System.out.println("Nenhuma planta cadastrada.");
        } else {
            System.out.println("Lista de Plantas:");
            for (Plant plant : plants) {
                System.out.println(plant);
            }
        }
    }

    public static List<Plant> getPlants() {
        return plants;
    }
}
