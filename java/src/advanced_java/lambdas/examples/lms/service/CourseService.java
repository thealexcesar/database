package advanced_java.lambdas.examples.lms.service;

import advanced_java.lambdas.examples.lms.domain.Course;
import advanced_java.lambdas.examples.lms.domain.Student;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

public class CourseService {
    private Set<Course> courses = new HashSet<>();

    public void addCourse(Course course) {
        courses.add(course);
    }

    public List<Course> getCourses() {
        return new ArrayList<>(courses);
    }

    public List<Course> transformCourses(Function<Course, Course> function) {
        return courses.stream().map(function).collect(Collectors.toList());
    }

    public Map<String, Set<Student>> groupStudentsByCourse(List<Student> students) {
        return students.stream().flatMap(student -> student.getEnrollments().stream()
                .map(enrollment -> new AbstractMap.SimpleEntry<>(enrollment.getCourse().getName(), student))).collect(Collectors
                .groupingBy(Map.Entry::getKey, Collectors.mapping(Map.Entry::getValue, Collectors.toSet())));
    }
}
