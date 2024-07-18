package advanced_java.generics.exercises.employee.domain;

import java.util.ArrayList;
import java.util.List;

public class GenericEntity<T extends Entity> {
    private List<T> entities;

    public GenericEntity() {
        this.entities = new ArrayList<>();
    }

    public void addEntity(T entity) {
        this.entities.add(entity);
    }

    public void removeEntity(T entity) {
        this.entities.remove(entity);
    }

    public List<T> listEntities() {
        return new ArrayList<>(entities);
    }

    public void printEntityDetails() {
        entities.forEach(System.out::println);
    }
}
