package oop.oop3.exercises.movie;


import java.util.ArrayList;
import java.util.Scanner;

class Book {
private String title;
private String author;
private int year;
private static ArrayList<Book> bookList = new ArrayList<>();

public Book(String title, String author, int year) {
    this.title = title;
    this.author = author;
    this.year = year;
}

public void showDetails() {
    System.out.println("Título: " + title);
    System.out.println("Autor: " + author);
    System.out.println("Ano: " + year);
}

public static void addBook(Scanner input) {
    System.out.print("Digite o título: ");
    String title = input.nextLine();
    System.out.print("Digite o autor: ");
    String author = input.nextLine();
    int year = getValidYear(input);
    bookList.add(new Book(title, author, year));
    System.out.println("Livro registrado com sucesso.");
}

public static void listBooks() {
    if (bookList.isEmpty()) {
        System.out.println("Nenhum livro registrado.");
    } else {
        System.out.println("\n\u001B[34mLista de Livros:\u001B[0m");
        System.out.println("--------------------------------------");
        for (Book book : bookList) {
            book.showDetails();
            System.out.println();
        }
        System.out.println("--------------------------------------");
    }
}

private static int getValidYear(Scanner input) {
    int year;
    while (true) {
        try {
            System.out.print("Digite o ano: ");
            year = Integer.parseInt(input.nextLine());
            break;
        } catch (NumberFormatException e) {
            System.err.print("Entrada inválida. Por favor, digite um ano válido: ");
        }
    }
    return year;
}
}
