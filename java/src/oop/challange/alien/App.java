package oop.challange.alien;

import java.time.LocalDate;

public class App {

    public static void main(String[] args) {

        Species specie1 = new Species("Sayajin", "Planeta Vegeta", 7);
        Species specie2 = new Species("Cryptoniano", "Krypto", 8);
        Alien alien1 = new Alien(1, "Kakaroto", specie1, 10, LocalDate.now());
        Alien alien2 = new Alien(2, "Kal El", specie2, 9, LocalDate.now());

        Admin admin = new Admin();

        admin.createSpecies(specie1);
        admin.createSpecies(specie2);

        admin.createAlien(alien1);
        admin.createAlien(alien2);

        Report report = new Report(admin.getAlienList());
        report.printReport();

        admin.closeProgram();
    }
}
