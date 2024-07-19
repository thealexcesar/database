package advanced_java.generics.exercises.superhero.domain.model;

public class SideKick extends Person {
    private String ability;

    public SideKick(String name, int strength, int agility, int health, Weakness weakness, String ability) {
        super(name, strength, agility, health, weakness);
        this.ability = ability;
    }

    public String getAbility() {
        return ability;
    }

    public void setAbility(String ability) {
        this.ability = ability;
    }

    @Override
    public String toString() {
        return super.toString() + " - habilidade: " + ability;
    }
}