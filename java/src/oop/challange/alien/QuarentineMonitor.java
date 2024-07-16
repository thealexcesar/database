package oop.challange.alien;

import java.util.ArrayList;
import java.util.List;

public class QuarentineMonitor {
    private List<Alien> dangerousAliens;

    public QuarentineMonitor() {
        this.dangerousAliens = new ArrayList<>();
    }

    public List<Alien> getDangerousAliens() {
        return dangerousAliens;
    }

    public void addDangerousAlien(Alien alien) {
        if (alien.getDangerLevel() > 5) {
            dangerousAliens.add(alien);
            System.out.println("Alienígena " + alien.getName() + " em quarentena");
        } else {
            System.out.println("Alienígena " + alien.getName() + " não oferece perigo");
        }
    }

    public void setDangerousAliens(List<Alien> dangerousAliens) {
        this.dangerousAliens = dangerousAliens;
    }
}
