package advanced_java.generics.exercises.web.domain;

public class MAN extends AbstractNetwork {
    public MAN(String name) {
        super(name);
    }

    @Override
    public void operate() {
        System.out.println("Operando como uma Rede Metropolitana (MAN): " + getName());
        getComponents().forEach(NetworkComponent::operate);
    }
}
