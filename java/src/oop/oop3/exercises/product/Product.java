package oop.oop3.exercises.product;
/**
* Create a base class called "Product" with attributes like "Name" and "Price".
* Create a derived class called "Book" that inherits from "Product" and adds attributes specific to a book.
* Create 4 books.
* @author Alex Cesar
*/
public class Product {
    private String name;
    private double price;
    private int stockQuantity;

    public Product(String name, double price, int stockQuantity) {
        this.name = name;
        this.price = price;
        this.stockQuantity = stockQuantity;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void updateStock(int quantity) {
        this.stockQuantity += quantity;
    }

    public void displayDetails() {
        System.out.println("Product: " + name);
        System.out.println("Price: $" + price);
        System.out.println("Stock Quantity: " + stockQuantity);
    }

    public static void displayAllProducts(Product[] products) {
        System.out.println("\nProduct List\n-----------------------------------");
        for (int i = 0; i < products.length; i++) {
            products[i].displayDetails();
            System.out.println("-----------------------------------");
        }
    }
}
