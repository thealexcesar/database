package advanced_java.maps.examples;
/**
 * Create a Student class with attributes name and grade.
 * Create a Map<String, Student> where the key is the student's name and the value is the Student object.
 * Add five students to the Map and display the contents of the Map.
 * @author Alex Cesar
 */
public class Student {
    private String name;
    private double score;

    public Student(String name, double score) {
        this.name = name;
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public double getGrade() {
        return score;
    }

}
