package advanced_java.collections.maps.exercises;

import java.util.HashMap;
import java.util.Map;

public class App {
    private static final String HR = "\u001B[34m------------------------------\u001B[0m";

    public static void main(String[] args) {
        Map<String, Student> students = new HashMap<>();
        StudentService studentService = new StudentService(students);

        studentService.showAllStudents();
        studentService.showGroupStudentsByNotes();
        studentService.showScoreByName("Lisa");
        studentService.showStudentsWithScoreGreaterThan(70.0F);
        studentService.removeStudentByScore(80.0F);
        studentService.showAllStudents();
        studentService.showRankingStudents();
    }
}
