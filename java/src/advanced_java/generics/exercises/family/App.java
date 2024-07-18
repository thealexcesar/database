package advanced_java.generics.exercises.family;

import advanced_java.generics.exercises.family.domain.Child;
import advanced_java.generics.exercises.family.domain.GenericFamily;
import advanced_java.generics.exercises.family.domain.Genre;
import advanced_java.generics.exercises.family.domain.Parent;

public class App {
    public static void main(String[] args) {
        GenericFamily<Parent, Child> family = new GenericFamily<>();

        Parent father = new Parent("Naruto", 45, "Hokage", Genre.M);
        Parent mother = new Parent("Hinata", 43, "Medica", Genre.F);
        family.addParent(father);
        family.addParent(mother);

        Child son = new Child("Boruto", 14, "Bola", Genre.M);
        Child daughter = new Child("Himawari", 9, "Boneca", Genre.F);
        family.addChild(son);
        family.addChild(daughter);

        System.out.println("Pais:\n--------------------------------------");
        family.printParents();

        System.out.println("\nFilhos:\n--------------------------------------");
        family.printChildren();

        family.removeParent(mother);
        family.removeChild(daughter);

        System.out.println("\nPais após remoção:\n--------------------------------------");
        family.printParents();

        System.out.println("\nFilhos após remoção:\n--------------------------------------");
        family.printChildren();

        family.printFamilyMembers();
    }
}
