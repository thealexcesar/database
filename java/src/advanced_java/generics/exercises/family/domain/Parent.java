package advanced_java.generics.exercises.family.domain;

public class Parent extends Person {
    private String profession;

    public Parent(String name, int age, String profession, Genre genre) {
        super(name, age, genre);
        this.profession = profession;
    }

    @Override
    public String toString() {
        return super.toString() + " - profissão: " + profession;
    }
}
