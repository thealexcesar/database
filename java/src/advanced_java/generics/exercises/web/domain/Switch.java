package advanced_java.generics.exercises.web.domain;

public class Switch implements NetworkComponent {
    private String name;

    public Switch(String name) {
        this.name = name;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void operate() {
        System.out.println(name+" está comutando pacotes.");
    }
}
