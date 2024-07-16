package oop.assignments.rpg.domain;

public class Enemy extends Character {
    private String type;
    private int experienceReward;

    public Enemy(String name, int score, int strength, int defense, String type, int experienceReward, int mana, double criticalChance) {
        super(name, score, strength, defense, mana, criticalChance);
        this.type = type;
        this.experienceReward = experienceReward;
    }

    @Override
    public boolean isWeakTo(AbilityType abilityType) {
        return abilityType == AbilityType.FIRE;
    }

    @Override
    public void performAction(Character opponent) {
        attack(opponent);
    }
}