package advanced_java.generics.exercises.superhero.domain.repository;

import advanced_java.generics.exercises.superhero.domain.model.Person;
import java.util.ArrayList;
import java.util.List;

public class PersonRepository<T extends Person> {
    private List<T> people = new ArrayList<>();

    public void add(T person) {
        people.add(person);
    }

    public void remove(T person) {
        people.remove(person);
    }

    public void printPeople() {
        people.forEach(System.out::println);
    }
}
