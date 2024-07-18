package advanced_java.generics.exercises.web.domain;

public class PAN extends AbstractNetwork {
    public PAN(String name) {
        super(name);
    }

    @Override
    public void operate() {
        System.out.println("Operando como uma Rede Pessoal (PAN): " + getName());
        getComponents().forEach(NetworkComponent::operate);
    }
}
