package oop.oop4.exercises.n4;

import java.util.ArrayList;
import java.util.List;

public class ProductManager {
    private static List<Product> products = new ArrayList<>();

    static void addProduct(Product product) {
        products.add(product);
    }

    static void removeProduct(Product product) {
        Product productToRemove = null;
        products.remove(product);
    }

    static List<Product> getProducts() {
        return products;
    }
}
