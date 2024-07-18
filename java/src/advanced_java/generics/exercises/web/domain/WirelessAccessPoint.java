package advanced_java.generics.exercises.web.domain;

public class WirelessAccessPoint implements NetworkComponent {
    private final String name;

    public WirelessAccessPoint(String name) {
        this.name = name;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void operate() {
        System.out.println(name + " está fornecendo acesso sem fio.");
    }
}
