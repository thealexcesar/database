package oop.assignments.rpg.domain;

import java.util.ArrayList;
import java.util.List;

public abstract class Character implements Vulnerable, Action {
    protected String name;
    protected int score, strength, defense, mana;
    protected double criticalChance;
    protected List<Ability> abilities;
    protected List<Effect> effects;

    public Character(String name, int score, int strength, int defense, int mana, double criticalChance) {
        this.name = name;
        this.score = score;
        this.strength = strength;
        this.defense = defense;
        this.mana = mana;
        this.criticalChance = criticalChance;
        this.abilities = new ArrayList<>();
        this.effects = new ArrayList<>();
    }

    @Override
    public boolean isWeakTo(AbilityType abilityType) {
        return false;
    }

    public int calculateDamage(Ability ability, Character opponent) {
        int baseDamage = ability.getBaseDamage();
        AbilityType abilityType = ability.getType();
        int opponentDefense = opponent.getDefense();

        double damageMultiplier = (opponent.isWeakTo(abilityType)) ? 1.5 : 1.0;
        boolean isCritical = Math.random() < this.criticalChance;
        int calculatedDamage = (int) Math.round(baseDamage * damageMultiplier) - opponentDefense;
        calculatedDamage = isCritical ? calculatedDamage * 2 : calculatedDamage;
        if (calculatedDamage < 0) calculatedDamage = 0;

        return calculatedDamage;
    }

    public void applyEffects() {
        for (Effect effect : new ArrayList<>(effects)) {
            effect.apply(this);
        }
    }

    public void addEffect(Effect effect) {
        effects.add(effect);
    }

    public void removeEffect(Effect effect) {
        effects.remove(effect);
    }

    public List<Ability> getAbilities() {
        return abilities;
    }

    public String getName() {
        return name;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getStrength() {
        return strength;
    }

    public int getDefense() {
        return defense;
    }

    public void setDefense(int defense) {
        this.defense = defense;
    }

    public int getMana() {
        return mana;
    }

    public void setMana(int mana) {
        this.mana = mana;
    }

    @Override
    public void performAction(Character opponent) {
        if (!abilities.isEmpty() && this.mana >= abilities.get(0).getBaseDamage()) {
            Ability ability = abilities.get(0);
            this.mana -= ability.getBaseDamage();
            int damage = calculateDamage(ability, opponent);
            opponent.setScore(opponent.getScore() - damage);
            System.out.printf("%s usa %s em %s e causa %d de dano.%n", this.getName(), ability.getName(), opponent.getName(), damage);
        } else {
            this.attack(opponent);
        }
    }

    public void attack(Character opponent) {
        int damage = this.getStrength() - opponent.getDefense();
        boolean isCritical = Math.random() < this.criticalChance;

        if (isCritical) {
            damage *= 2;
            System.out.printf("\n%s ataca %s com um golpe crítico e causa %d de dano.%n", this.getName(), opponent.getName(), damage);
        } else if (damage > 0) {
            opponent.setScore(opponent.getScore() - damage);
            System.out.printf("\n%s ataca %s e causa %d de dano.%n", this.getName(), opponent.getName(), damage);
        } else {
            System.out.printf("\n%s ataca %s, mas não causa dano.%n", this.getName(), opponent.getName());
        }
    }
}
