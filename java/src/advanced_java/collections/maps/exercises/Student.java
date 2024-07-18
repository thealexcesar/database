package advanced_java.collections.maps.exercises;

public class Student implements Comparable<Student> {
    private String name;
    private float score;

    public Student(String name, float score) {
        this.name = name;
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public double getScore() {
        return score;
    }

    @Override
    public String toString() {
        return "Nome: " + name + " - nota: " + String.format("%.1f", score);
    }

    @Override
    public int compareTo(Student o) {
        return Float.compare(o.score, this.score);
    }
}
