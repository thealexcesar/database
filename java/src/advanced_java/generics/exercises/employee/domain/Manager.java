package advanced_java.generics.exercises.employee.domain;

public class Manager extends Entity {
    private double bonus;

    public Manager(String name, int age, double bonus) {
        super(name, age);
        this.bonus = bonus;
    }

    public double getBonus() {
        return bonus;
    }

    @Override
    public String toString() {
        return super.toString() + " - bônus: " + bonus;
    }
}
