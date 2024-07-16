package oop.assignments.rpg.domain;

public abstract class Effect {
    protected int duration;

    public Effect(int duration) {
        this.duration = duration;
    }

    abstract void apply(Character character);

    public boolean isExpired() {
        return duration <= 0;
    }

    public void reduceDuration() {
        this.duration--;
    }
}