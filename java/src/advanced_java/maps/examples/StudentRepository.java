package advanced_java.maps.examples;

import java.util.*;
import java.util.stream.Collectors;

public class StudentRepository {
    private Map<String, Student> students = new HashMap<>();

    public void createStudent(Student student) {
        if (this.students.containsKey(student.getName())) {
            throw new IllegalArgumentException("O nome já existe em nossa base de dados, por favor tente outro.");
        }
        this.students.put(student.getName(), student);
    }

    public Optional<Student> getStudent(String name) {
        return Optional.ofNullable(this.students.get(name));
    }

    public List<Student> getAllStudents() {
        return this.students.values().stream().collect(Collectors.toList());
    }

}
