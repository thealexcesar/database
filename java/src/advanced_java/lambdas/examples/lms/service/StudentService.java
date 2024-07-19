package advanced_java.lambdas.examples.lms.service;

import advanced_java.lambdas.examples.lms.domain.CourseEnrollment;
import advanced_java.lambdas.examples.lms.domain.Student;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class StudentService {
    private Set<Student> students = new HashSet<>();

    public void addStudent(Student student) {
        students.add(student);
    }

    public List<Student> filterStudents(Predicate<Student> predicate) {
        return students.stream().filter(predicate).collect(Collectors.toList());
    }

    public boolean checkAllCoursesApproved(Student student) {
        return student.getEnrollments().stream().allMatch(CourseEnrollment::isCompleted);
    }
    public Set<Student> getStudents() {
        return students;
    }
}
