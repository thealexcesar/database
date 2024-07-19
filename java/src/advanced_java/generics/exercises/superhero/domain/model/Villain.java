package advanced_java.generics.exercises.superhero.domain.model;

public class Villain extends Person {
    private String evilPlan;

    public Villain(String name, int strength, int agility, int health, Weakness weakness, String evilPlan) {
        super(name, strength, agility, health, weakness);
        this.evilPlan = evilPlan;
    }

    public String getEvilPlan() {
        return evilPlan;
    }

    public void setEvilPlan(String evilPlan) {
        this.evilPlan = evilPlan;
    }

    @Override
    public String toString() {
        return super.toString()+" - plano do mal: "+evilPlan;
    }
}