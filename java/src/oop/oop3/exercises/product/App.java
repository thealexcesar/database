package oop.oop3.exercises.product;

import java.util.Scanner;
/**
 * Create a class called Product to model information about a product.
 * Create a simple shopping system.
 * Attributes: Name, Price, Stock Quantity
 * Methods: updateStock, displayDetails.
 * @author Alex Cesar
 */

public class App {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        Product[] products = new Product[3];
        products[0] = new Product("Laptop", 3000.00, 10);
        products[1] = new Product("TV", 3599.50, 30);
        products[2] = new Product("Air Fryer", 600.90, 20);

        Product.displayAllProducts(products);

        System.out.println("\nEnter the index of the product you want to update (0 - " + (products.length - 1) + "):");
        int index = input.nextInt();

        if (index >= 0 && index < products.length) {
            System.out.println("Enter the quantity to add to stock:");
            int quantity = input.nextInt();
            products[index].updateStock(quantity);

            System.out.println("\nUpdated product:");
            products[index].displayDetails();
        } else {
            System.out.println("Invalid product index.");
        }
    }
}