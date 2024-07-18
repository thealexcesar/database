package advanced_java.generics.exercises.web.domain;

import java.util.List;

public class GenericWeb<T> {
    private List<T> components;

    public GenericWeb() {
        this.components = components;
    }

    public void addComponent(T component) {
        components.add(component);
    }

    public void removeComponent(T component) {
        components.remove(component);
    }

    public void simulateComponent() {
        for (T component : components) {
            System.out.println("Simulando componente: " + component);
        }
    }

    public List<T> getComponents() {
        return components;
    }
}
