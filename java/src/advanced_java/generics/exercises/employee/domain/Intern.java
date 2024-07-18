package advanced_java.generics.exercises.employee.domain;

public class Intern extends Entity {
    private String school;

    public Intern(String name, int age, String school) {
        super(name, age);
        this.school = school;
    }

    public String getSchool() {
        return school;
    }

    @Override
    public String toString() {
        return super.toString() + " - escola: " + school;
    }
}
