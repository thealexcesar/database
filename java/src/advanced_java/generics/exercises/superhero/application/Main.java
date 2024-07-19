package advanced_java.generics.exercises.superhero.application;

import advanced_java.generics.exercises.superhero.domain.model.*;
import advanced_java.generics.exercises.superhero.domain.repository.PersonRepository;
import advanced_java.generics.exercises.superhero.service.PersonService;

public class Main {
    public static void main(String[] args) {
        PersonRepository<Hero> superHeroRepository = new PersonRepository<>();
        PersonRepository<Villain> villainRepository = new PersonRepository<>();
        PersonRepository<SideKick> sidekickRepository = new PersonRepository<>();

        PersonService<Hero> superHeroService = new PersonService<>(superHeroRepository);
        PersonService<Villain> villainService = new PersonService<>(villainRepository);
        PersonService<SideKick> sidekickService = new PersonService<>(sidekickRepository);

        Hero mario = new Hero("Mario", 35, 90, 70, Weakness.FIRE, Powers.SUPER_STRENGTH);
        Hero luigi = new Hero("Luigi", 34, 85, 80, Weakness.WATER, Powers.SUPER_SPEED);
        superHeroService.add(mario);
        superHeroService.add(luigi);

        Villain bowser = new Villain("Bowser", 40, 95, 60, Weakness.WATER, "Raptar a Princesa");
        villainService.add(bowser);

        SideKick toad = new SideKick("Toad", 25, 60, 90, Weakness.MAGIC, "Cura Rápida");
        sidekickService.add(toad);

        System.out.println("Heróis:\n--------------------------------------------");
        superHeroService.printAllPeople();
        System.out.println("\nVilões:\n--------------------------------------------");
        villainService.printAllPeople();
        System.out.println("\nAjudantes:\n--------------------------------------------");
        sidekickService.printAllPeople();
    }
}
