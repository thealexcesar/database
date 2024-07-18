package advanced_java.generics.exercises.family.domain;

public abstract class Person {
    private String name;
    private int age;
    private Genre genre;

    public Person(String name, int age, Genre genre) {
        this.name = name;
        this.age = age;
        this.genre = genre;
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

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    @Override
    public String toString() {
        return "nome: " + name + " - idade: " + age + " - sexo: " + genre;
    }
}
