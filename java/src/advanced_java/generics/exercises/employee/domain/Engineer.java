package advanced_java.generics.exercises.employee.domain;

public class Engineer extends Entity {
    private Speciality specialty;

    public Engineer(String name, int age, Speciality specialty) {
        super(name, age);
        this.specialty = specialty;
    }

    public Speciality getSpecialty() {
        return specialty;
    }

    @Override
    public String toString() {
        return super.toString() + " - especialidade: " + specialty;
    }
}
