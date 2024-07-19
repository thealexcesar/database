package advanced_java.generics.exercises.superhero.domain.model;

public class Hero extends Person {
    private Powers power;

    public Hero(String name, int strength, int agility, int health, Weakness weakness, Powers power) {
        super(name, strength, agility, health, weakness);
        this.power = power;
    }

    public Powers getPower() {
        return power;
    }

    public void setPower(Powers power) {
        this.power = power;
    }

    @Override
    public String toString() {
        return super.toString()+" - Super Poder: "+power;
    }
}