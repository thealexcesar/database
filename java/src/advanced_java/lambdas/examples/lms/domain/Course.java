package advanced_java.lambdas.examples.lms.domain;

import java.util.Objects;

public class Course {
    private String name;
    private String description;
    private int durationHours;

    public Course(String name, String description, int durationHours) {
        this.name = name;
        this.description = description;
        this.durationHours = durationHours;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public int getDurationHours() {
        return durationHours;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Course course = (Course) o;
        return name.equals(course.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }
}
