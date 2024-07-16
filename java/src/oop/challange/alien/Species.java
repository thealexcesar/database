package oop.challange.alien;

public class Species {
    private String name;
    private String birthPlanet;
    private int dangerousLevelBase;

    public Species(String name, String birthPlanet, int dangerousLevelBase) {
        this.name = name;
        this.birthPlanet = birthPlanet;
        this.dangerousLevelBase = dangerousLevelBase;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthPlanet() {
        return birthPlanet;
    }

    public void setBirthPlanet(String birthPlanet) {
        this.birthPlanet = birthPlanet;
    }

    public int getDangerousLevelBase() {
        return dangerousLevelBase;
    }

    public void setDangerousLevelBase(int dangerousLevelBase) {
        this.dangerousLevelBase = dangerousLevelBase;
    }
}
