package advanced_java.collections.maps.exercises;

import java.util.*;
import java.util.stream.Collectors;

public class StudentService {
    private Map<String, Student> students = new HashMap<>();
    private static final String HR = "\u001B[34m------------------------------\u001B[0m";

    public StudentService(Map<String, Student> students) {
        this.students = students;
        System.out.println(HR);
        createStudent(new Student("Bart", generateRandomScore()));
        createStudent(new Student("Milhouse", generateRandomScore()));
        createStudent(new Student("Lisa", generateRandomScore()));
        createStudent(new Student("Nelson", generateRandomScore()));
        createStudent(new Student("Martin", generateRandomScore()));
    }

    public void createStudent(Student student) {
        if (students.containsKey(student.getName())) {
            throw new IllegalArgumentException("Ja existe um aluno com o nome " + student.getName());
        }

        students.put(student.getName(), student);
        System.out.println("Aluno " + student.getName() + " criado com sucesso!");
    }


    public void showAllStudents() {
        System.out.println(HR+"\n");
        System.out.println("Lista de Alunos:\n"+HR);
        for (Map.Entry<String, Student> entry : students.entrySet()) {
            System.out.println(entry.getValue());
        }
    }

    public void showScoreByName(String studentName) {
        String scoreMessage = getScoreByName(studentName);
        System.out.println(HR+"\n"+scoreMessage+"\n"+HR);
    }

    public void showGroupStudentsByNotes() {
        Map<String, List<Student>> groupedStudents = groupStudents();
        System.out.println("\nAlunos agrupados por notas:");
        for (Map.Entry<String, List<Student>> entry : groupedStudents.entrySet()) {
            System.out.println("Grupo " + entry.getKey() + ": " + entry.getValue());
        }
    }

    public List<Student> removeStudentByScore(float minScore) {
        List<Student> removed = new ArrayList<>();
        Iterator<Student> iterator = this.students.values().iterator();
        int countRemoved = 0;

        while (iterator.hasNext()) {
            Student student = iterator.next();

            if (student.getScore() < minScore) {
                removed.add(student);
                iterator.remove();
                countRemoved++;
            }
        }

        System.out.println("\nTotal de alunos removidos:\n"+HR+countRemoved);
        removed.forEach(System.out::println);
        return removed;
    }

    public void showRankingStudents() {
        System.out.println(HR+"\nRanking de Alunos por Nota:\n"+HR);
        Map<String, Student> rankedStudents = rankStudentsByScore();
        rankedStudents.forEach((name, student) -> System.out.println(student));
    }

    public void showStudentsWithScoreGreaterThan(float choiceScore) {
        float score = 70.0F;
        List<Student> studentsWithHighScore = getStudentsWithScoreGreater(score);

        System.out.println("\nAlunos com nota maior que "+score+"\n"+HR);
        for (Student student : studentsWithHighScore) {
            System.out.println(student);
        }
    }

    private String getScoreByName(String name) {
        Student student = this.students.get(name);
        return student == null ? "\u001B[31mAluno(a) \"" + name + "\" não encontrado.\u001B[0m" : String.format("%s tirou nota %.1f", name, student.getScore());
    }

    private List<Student> getStudentsWithScoreGreater(float scoreBase) {
        return this.students.values().stream().filter(student -> student.getScore() > scoreBase).collect(Collectors.toList());
    }

    private Map<String, Student> rankStudentsByScore() {
        return students.entrySet().stream()
                .sorted(Map.Entry.comparingByValue(Comparator.comparing(Student::getScore).reversed()))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));
    }

    private Map<String, List<Student>> groupStudents() {
        return this.students.values().stream().collect(Collectors.groupingBy(student -> {
            return student.getScore() >= 90.0 ? "A" : student.getScore() >= 80.0
                    ? "B" : student.getScore() >= 70.0 ? "C" : student.getScore() >= 60.0 ? "D" : "F";
        }));
    }

    private float generateRandomScore() {
        Random randon = new Random();
        return 40 + randon.nextFloat() * 60;
    }
}
