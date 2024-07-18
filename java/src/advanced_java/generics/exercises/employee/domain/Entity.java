package advanced_java.generics.exercises.employee.domain;

public class Entity {
    private String name;
    private int age;

    public Entity(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    @Override
    public String toString() {
        return "nome: " + name + " - idade: " + age;
    }
}
