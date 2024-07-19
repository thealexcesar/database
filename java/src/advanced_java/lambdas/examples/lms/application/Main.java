package advanced_java.lambdas.examples.lms.application;

import advanced_java.lambdas.examples.lms.domain.Assessment;
import advanced_java.lambdas.examples.lms.domain.Course;
import advanced_java.lambdas.examples.lms.domain.CourseEnrollment;
import advanced_java.lambdas.examples.lms.domain.Student;
import advanced_java.lambdas.examples.lms.service.CourseService;
import advanced_java.lambdas.examples.lms.service.DossierService;
import advanced_java.lambdas.examples.lms.service.StudentService;

public class Main {
    public static void main(String[] args) {
        Course javaCourse = new Course("Java Course", "Advanced", 40);
        Course angularCourse = new Course("Angular", "ADV", 30);

        Student student1 = new Student("Alex", 31);
        Student student2 = new Student("Loren", 20);

        CourseEnrollment enrollment1 = new CourseEnrollment(javaCourse);
        enrollment1.setCompleted(true);
        enrollment1.addAssessment(new Assessment("Midterm", 6));
        enrollment1.addAssessment(new Assessment("Final", 7));

        CourseEnrollment enrollment2 = new CourseEnrollment(angularCourse);
        enrollment2.setCompleted(true);
        enrollment2.addAssessment(new Assessment("Midterm", 5));
        enrollment2.addAssessment(new Assessment("Final", 7));

        student1.enroll(enrollment1);
        student2.enroll(enrollment2);

        StudentService studentService = new StudentService();
        studentService.addStudent(student1);
        studentService.addStudent(student2);

        CourseService courseService = new CourseService();
        courseService.addCourse(javaCourse);
        courseService.addCourse(angularCourse);

        DossierService dossierService = new DossierService();
        dossierService.generateDossier(student1);
        dossierService.generateDossier(student2);

        System.out.println("m[atricula 1: " + enrollment1);
        System.out.println("m[atricula 2: " + enrollment2);
    }
}
