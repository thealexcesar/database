package oop.oop5;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Animal extends LivingBeing {
    private static List<Animal> animals = new ArrayList<>();

    public Animal(String kingdom, String phylum, String kind, String order, String family, String gender, String specie) {
        super(kingdom, phylum, kind, order, family, gender, specie);
    }

    @Override
    public String getType() {
        return "Animal";
    }

    public static void addAnimal(Scanner input) {
        System.out.print("Digite o reino do animal: ");
        String kingdom = input.nextLine();
        System.out.print("Digite o filo do animal: ");
        String phylum = input.nextLine();
        System.out.print("Digite a classe do animal: ");
        String kind = input.nextLine();
        System.out.print("Digite a ordem do animal: ");
        String order = input.nextLine();
        System.out.print("Digite a família do animal: ");
        String family = input.nextLine();
        System.out.print("Digite o gênero do animal: ");
        String gender = input.nextLine();
        System.out.print("Digite a espécie do animal: ");
        String specie = input.nextLine();
        Animal animal = new Animal(kingdom, phylum, kind, order, family, gender, specie);
        animals.add(animal);
        System.out.println("Animal cadastrado com sucesso!");
    }

    public static void listAnimals() {
        if (animals.isEmpty()) {
            System.out.println("Nenhum animal cadastrado.");
        } else {
            System.out.println("Lista de Animais:");
            for (Animal animal : animals) {
                System.out.println(animal);
            }
        }
    }

    public static List<Animal> getAnimals() {
        return animals;
    }
}
