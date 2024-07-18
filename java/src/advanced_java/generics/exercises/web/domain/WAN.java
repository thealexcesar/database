package advanced_java.generics.exercises.web.domain;

public class WAN extends AbstractNetwork {
    public WAN(String name) {
        super(name);
    }

    @Override
    public void operate() {
        System.out.println("Operando como uma Rede de Longa Distância (WAN): " + getName());
        getComponents().forEach(NetworkComponent::operate);
    }
}
