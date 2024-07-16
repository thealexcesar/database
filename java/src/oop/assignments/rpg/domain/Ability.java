package oop.assignments.rpg.domain;

public class Ability {
    private String name;
    private int baseDamage;
    private AbilityType type;

    public Ability(String name, int baseDamage, AbilityType type) {
        this.name = name;
        this.baseDamage = baseDamage;
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public int getBaseDamage() {
        return baseDamage;
    }

    public AbilityType getType() {
        return type;
    }
}