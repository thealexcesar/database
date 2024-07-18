package advanced_java.generics.exercises.web.domain;

import java.util.Set;

public interface Network {
    String getName();
    void addComponent(NetworkComponent component);
    void removeComponent(NetworkComponent component);
    Set<NetworkComponent> getComponents();
    void operate();
}
