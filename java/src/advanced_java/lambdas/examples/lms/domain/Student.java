package advanced_java.lambdas.examples.lms.domain;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

public class Student {
    private UUID id;
    private String name;
    private int age;
    private Set<CourseEnrollment> enrollments = new HashSet<>();

    public Student(String name, int age) {
        this.id = UUID.randomUUID();
        this.name = name;
        this.age = age;
        this.enrollments = enrollments;
    }

    public UUID getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }


    public Set<CourseEnrollment> getEnrollments() {
        return enrollments;
    }

    public void enroll(CourseEnrollment enrollment) {
        enrollments.add(enrollment);
    }
}
