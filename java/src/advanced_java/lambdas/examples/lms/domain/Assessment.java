package advanced_java.lambdas.examples.lms.domain;

public class Assessment {
    private String studentName;
    private float score;

    public Assessment(String studentName, float score) {
        this.studentName = studentName;
        this.score = score;
    }

    public String getStudentName() {
        return studentName;
    }

    public float getScore() {
        return score;
    }
}
