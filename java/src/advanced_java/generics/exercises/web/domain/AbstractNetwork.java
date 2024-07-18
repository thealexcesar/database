package advanced_java.generics.exercises.web.domain;

import advanced_java.generics.exercises.web.domain.Network;
import advanced_java.generics.exercises.web.domain.NetworkComponent;

import java.util.HashSet;
import java.util.Set;

public abstract class AbstractNetwork implements Network {
    private String name;
    private final Set<NetworkComponent> components = new HashSet<>();

    public AbstractNetwork(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public void addComponent(NetworkComponent component) {
        components.add(component);
    }

    @Override
    public void removeComponent(NetworkComponent component) {
        components.remove(component);
    }

    @Override
    public Set<NetworkComponent> getComponents() {
        return components;
    }
}
