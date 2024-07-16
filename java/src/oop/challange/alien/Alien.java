package oop.challange.alien;

import java.time.LocalDate;

public class Alien {
    private int id;
    private String name;
    private Species species;
    private int dangerLevel;
    private LocalDate innerAt;

    public Alien(int id, String name, Species species, int dangerLevel, LocalDate innerAt) {
        this.id = id;
        this.name = name;
        this.species = species;
        this.dangerLevel = dangerLevel;
        this.innerAt = innerAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Species getSpecies() {
        return species;
    }

    public void setSpecies(Species species) {
        this.species = species;
    }

    public int getDangerLevel() {
        return dangerLevel;
    }

    public void setDangerLevel(int dangerLevel) {
        this.dangerLevel = dangerLevel;
    }

    public LocalDate getInnerAt() {
        return innerAt;
    }

    public void setInnerAt(LocalDate innerAt) {
        this.innerAt = innerAt;
    }
}
