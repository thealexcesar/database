package advanced_java.generics.exercises.web.domain;

import org.w3c.dom.Node;

public class LAN extends AbstractNetwork {
    public LAN(String name) {
        super(name);
    }

    @Override
    public void operate() {
        System.out.println("Operando como uma Rede Local (LAN): " + getName());
        getComponents().forEach(NetworkComponent::operate);
    }
}
