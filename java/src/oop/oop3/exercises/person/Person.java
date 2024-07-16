package oop.oop3.exercises.person;
/**
 * Create a class called Person to model information about a person.
 * Attributes: Name, Age, Height, Weight
 * Methods: age, gainWeight, loseWeight, displayInfo.
 * @author Alex Cesar
 * */
public class Person {
    private String name;
    private int age;
    private double height;
    private double weight;

    public Person(String name, int age, double height, double weight) {
        this.name = name;
        this.age = age;
        this.height = height;
        this.weight = weight;
    }

    public void age() {
        this.age++;
    }

    public void gainWeight(double weightGain) {
        this.weight += weightGain;
    }

    public void loseWeight(double weightLoss) {
        this.weight -= weightLoss;
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

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public void displayInfo() {
        System.out.println("Nome: " + getName());
        System.out.println("Idade: " + getAge());
        System.out.println("Altura: " + getHeight() + "m");
        System.out.println("Peso: " + getWeight() + "kg");
        System.out.println("-----------------------------------");

    }
}
