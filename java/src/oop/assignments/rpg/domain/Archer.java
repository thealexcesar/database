package oop.assignments.rpg.domain;

public class Archer extends Character {
    private int dexterity;

    public Archer(String name, int score, int strength, int defense, int mana, double criticalChance) {
        super(name, score, strength, defense, mana, criticalChance);
        this.dexterity = dexterity;
        this.abilities.add(new Ability("Arrow Shot", 30, AbilityType.PHYSICAL));
    }

    @Override
    public boolean isWeakTo(AbilityType abilityType) {
        return abilityType == AbilityType.MAGIC;
    }

    public int getDexterity() {
        return dexterity;
    }

    public void setDexterity(int dexterity) {
        this.dexterity = dexterity + 10;
    }
}
