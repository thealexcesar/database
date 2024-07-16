package oop.assignments.rpg.domain;

public class Warrior extends Character {

    private String weaponType;

    public Warrior(String name, int score, int strength, int defense, int mana, double criticalChance) {
        super(name, score, strength, defense, mana, criticalChance);
        this.weaponType = "Sword";
        this.abilities.add(new Ability("Power Strike", 50, AbilityType.PHYSICAL));
    }

    public String getWeaponType() {
        return weaponType;
    }

    public void setWeaponType(String weaponType) {
        this.weaponType = weaponType;
    }

    @Override
    public boolean isWeakTo(AbilityType abilityType) {
        return abilityType == AbilityType.MAGIC;
    }
}
