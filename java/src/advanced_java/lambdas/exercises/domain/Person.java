package advanced_java.lambdas.exercises.domain;

import java.util.Objects;

public class Person {
    private String name;
    private int age;
    private String role;
    private String anime;

    public Person(String name, int age, String role, String anime) {
        this.name = name;
        this.age = age;
        this.role = role;
        this.anime = anime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAnime() {
        return anime;
    }

    public void setAnime(String anime) {
        this.anime = anime;
    }

    @Override
    public String toString() {
        return "Person{name='" + name + "', age=" + age + ", role='" + role + "', anime='" + anime + "'}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Person person = (Person) o;
        return age == person.age &&
                Objects.equals(name, person.name) &&
                Objects.equals(role, person.role) &&
                Objects.equals(anime, person.anime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, age, role, anime);
    }
}
