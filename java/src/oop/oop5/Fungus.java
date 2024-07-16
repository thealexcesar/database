package oop.oop5;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Fungus extends LivingBeing {
    private static List<Fungus> fungi = new ArrayList<>();

    public Fungus(String kingdom, String phylum, String kind, String order, String family, String gender, String specie) {
        super(kingdom, phylum, kind, order, family, gender, specie);
    }

    @Override
    public String getType() {
        return "Fungo";
    }

    public static void addFungus(Scanner input) {
        System.out.print("Digite o reino do fungo: ");
        String kingdom = input.nextLine();
        System.out.print("Digite o filo do fungo: ");
        String phylum = input.nextLine();
        System.out.print("Digite a classe do fungo: ");
        String kind = input.nextLine();
        System.out.print("Digite a ordem do fungo: ");
        String order = input.nextLine();
        System.out.print("Digite a família do fungo: ");
        String family = input.nextLine();
        System.out.print("Digite o gênero do fungo: ");
        String gender = input.nextLine();
        System.out.print("Digite a espécie do fungo: ");
        String specie = input.nextLine();
        Fungus fungus = new Fungus(kingdom, phylum, kind, order, family, gender, specie);
        fungi.add(fungus);
        System.out.println("Fungo cadastrado com sucesso!");
    }

    public static void listFungi() {
        if (fungi.isEmpty()) {
            System.out.println("Nenhum fungo cadastrado.");
        } else {
            System.out.println("Lista de Fungos:");
            for (Fungus fungus : fungi) {
                System.out.println(fungus);
            }
        }
    }

    public static List<Fungus> getFungi() {
        return fungi;
    }
}
