package advanced_java.generics.exercises.web.domain;

public class Router implements NetworkComponent {
    private final String name;

    public Router(String name) {
        this.name = name;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void operate() {
        System.out.println(name+" está roteando pacotes.");
    }
}
