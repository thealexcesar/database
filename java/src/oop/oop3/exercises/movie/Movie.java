package oop.oop3.exercises.movie;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * Create a Movie class:
 * Create a class named Movie to model information about a movie.
 * Create a small system to register books in a list.
 * Attributes:
 * Methods: showDetails.
 * @author Alex Cesar
 */
class Movie {
    private String title;
    private String director;
    private int year;
    private double rating;
    private static ArrayList<Movie> movieList = new ArrayList<>();

    public Movie(String title, String director, int year, double rating) {
        this.title = title;
        this.director = director;
        this.year = year;
        this.rating = rating;
    }

    public void showDetails() {
        System.out.println("Título: " + title);
        System.out.println("Diretor: " + director);
        System.out.println("Ano: " + year);
        System.out.println("Avaliação: " + rating);
    }

    public static void addMovie(Scanner input) {
        System.out.print("Digite o título: ");
        String title = input.nextLine();
        System.out.print("Digite o diretor: ");
        String director = input.nextLine();
        int year = getValidYear(input);
        double rating = getValidRating(input);
        movieList.add(new Movie(title, director, year, rating));
        System.out.println("Filme registrado com sucesso.");
    }

    public static void listMovies() {
        if (movieList.isEmpty()) {
            System.out.println("Nenhum filme registrado.");
        } else {
            System.out.println("\n\u001B[34mLista de Filmes:\u001B[0m");
            System.out.println("--------------------------------------");
            for (Movie movie : movieList) {
                movie.showDetails();
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

    private static double getValidRating(Scanner input) {
        double rating;
        while (true) {
            try {
                System.out.print("Digite a avaliação: ");
                rating = Double.parseDouble(input.nextLine());
                break;
            } catch (NumberFormatException e) {
                System.err.print("Entrada inválida. Por favor, digite uma avaliação válida: ");
            }
        }
        return rating;
    }
}
