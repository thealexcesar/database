package advanced_java.generics.exercises.superhero.domain.model;

public abstract class Person {
    private String name;
    private int strength, agility, health;
    private Weakness weakness;

    public Person(String name, int strength, int agility, int health, Weakness weakness) {
        this.name = name;
        this.strength = strength;
        this.agility = agility;
        this.health = health;
        this.weakness = weakness;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Nome: "+name+" - força: "+strength+" - agilidade: "+agility+" - saúde: "+health+" - fraqueza: "+weakness;
    }
}
