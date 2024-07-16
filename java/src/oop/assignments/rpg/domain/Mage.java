package oop.assignments.rpg.domain;

public class Mage extends Character {

    public Mage(String name, int score, int strength, int defense, int mana, double criticalChance) {
        super(name, score, strength, defense, mana, criticalChance);
        this.abilities.add(new Ability("Fireball", 30, AbilityType.FIRE));
    }

    @Override
    public boolean isWeakTo(AbilityType abilityType) {
        return abilityType == AbilityType.PHYSICAL;
    }
}
