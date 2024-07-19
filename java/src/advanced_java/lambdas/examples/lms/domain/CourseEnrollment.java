package advanced_java.lambdas.examples.lms.domain;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CourseEnrollment {
    private Course course;
    private LocalDateTime enrolledAt;
    private List<Assessment> assessments = new ArrayList<>();
    private boolean completed = false;

    public CourseEnrollment(Course course) {
        this.course = course;
        this.enrolledAt = LocalDateTime.now();
    }

    public void addAssessment(Assessment assessment) {
        this.assessments.add(assessment);
    }

    public List<Assessment> getAssessments() {
        return assessments;
    }

    public Course getCourse() {
        return course;
    }

    public boolean isCompleted() {
        return completed;
    }


    public void isCompleted(boolean completed) {
        this.completed = completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }

    public LocalDateTime getRegisteredAt() {
        return enrolledAt;
    }

    public void setRegisteredAt(LocalDateTime enrolledAt) {
        this.enrolledAt = enrolledAt;
    }

    @Override
    public String toString() {
        return String.valueOf(completed && assessments.stream().mapToDouble(Assessment::getScore).average().orElse(0) >= 7.0);
    }
}
