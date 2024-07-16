package oop.oop4.exercises.n4;

import java.util.List;

public class App {
    public static void main(String[] args) {
        Product[] products = new Product[10];

        products[0] = new Product("Monitor", 2580.50);
        products[1] = new Product("Mouse", 299.00);
        products[2] = new Product("Cubo de Rubik", 99.00);
        products[3] = new Product("Headset", 600.00);

        for (Product product : products) {
            if (product != null) {
                ProductManager.addProduct(product);
            }
        }

        System.out.println("Lista de produtos\n--------------------------------");
        String msgProductNotFound = "Nenhum produto encontrado.";

        List<Product> allProducts = ProductManager.getProducts();
        if (allProducts != null) {
            for (Product allProduct : allProducts) {
                if (allProduct != null) {
                    System.out.println("Nome: "+allProduct.getName()+", Valor: "+allProduct.getPrice());
                }
            }
        } else {
            System.out.println(msgProductNotFound);
        }

        ProductManager.removeProduct(products[1]);

        System.out.println("\nLista final de produtos\n--------------------------------");
        List<Product> finalProducts = ProductManager.getProducts();
        StringBuilder sb = new StringBuilder();
        if (finalProducts != null) {
            for (Product product : finalProducts) {
                if (product != null) {
                    sb.append("Nome: ").append(product.getName()).append(", Valor: ")
                            .append(product.getPrice()).append("\n");
                }
            }
            System.out.println(sb.length() == 0 ? msgProductNotFound : sb.toString());
        } else {
            System.out.println(msgProductNotFound);
        }
    }
}
