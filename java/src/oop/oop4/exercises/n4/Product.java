package oop.oop4.exercises.n4;
/**
 * Create a Product class with attributes name and price.
 * Create a ProductManager class with a static list of products and static methods
 * to add, remove, and list all products.
 * @author Alex Cesar
 */
public class Product {
    private String name;
    private double price;

    public Product(String name, double price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
