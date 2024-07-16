package oop.challange.alien;

import java.util.ArrayList;
import java.util.List;

public class Admin {
    private List<Alien> alienList;
    private List<Species> speciesList;
    private QuarentineMonitor quarentineMonitor;

    public Admin() {
        this.alienList = new ArrayList<>();
        this.speciesList = new ArrayList<>();
        this.quarentineMonitor = new QuarentineMonitor();
    }

    public void closeProgram() {
        System.out.println("Encerrando programa...");
        System.exit(0);
    }

    public void createSpecies(Species species) {
        speciesList.add(species);
    }

    public void createAlien(Alien alien) {
        alienList.add(alien);
        quarentineMonitor.addDangerousAlien(alien);
    }

    public List<Alien> getAlienList() {
        return alienList;
    }

    public void setAlienList(List<Alien> alienList) {
        this.alienList = alienList;
    }

    public List<Species> getSpeciesList() {
        return speciesList;
    }

    public void setSpeciesList(List<Species> speciesList) {
        this.speciesList = speciesList;
    }

    public QuarentineMonitor getQuarentineMonitor() {
        return quarentineMonitor;
    }

    public void setQuarentineMonitor(QuarentineMonitor quarentineMonitor) {
        this.quarentineMonitor = quarentineMonitor;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "alienList=" + alienList +
                ", speciesList=" + speciesList +
                ", quarentineMonitor=" + quarentineMonitor +
                '}';
    }
}
