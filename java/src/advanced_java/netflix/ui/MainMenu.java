package advanced_java.netflix.ui;

import advanced_java.netflix.domain.Category;
import advanced_java.netflix.domain.Content;
import advanced_java.netflix.domain.Genre;
import advanced_java.netflix.domain.User;
import advanced_java.netflix.repository.FavoritesRepository;
import advanced_java.netflix.service.StreamingService;
import advanced_java.netflix.service.UserService;

import java.util.List;
import java.util.Scanner;
import java.util.concurrent.CompletableFuture;

public class MainMenu {
    private User user;
    private UserService userService;
    private StreamingService streamingService;
    private FavoritesRepository favoritesRepository;

    public MainMenu(UserService userService, User user) {
        this.userService = userService;
        this.user = user;
        this.streamingService = new StreamingService(userService.getMovieRepository(), userService.getSeriesRepository());
        this.favoritesRepository = new FavoritesRepository();

        CompletableFuture.runAsync(() -> user.getFavorites().addAll(favoritesRepository.loadFavorites(user)));
    }

    public void displayMenu() {
        while (true) {
            System.out.println("**************************************************");
            System.out.println("* Bem-vindo ao Netflix de Console!              *");
            System.out.println("**************************************************");
            System.out.println("* 1. Ver Filmes                                 *");
            System.out.println("* 2. Ver Séries                                 *");
            System.out.println("* 3. Buscar por Nome                            *");
            System.out.println("* 4. Buscar por Gênero                          *");
            System.out.println("* 5. Ver Favoritos                              *");
            System.out.println("* 6. Adicionar aos Favoritos                    *");
            System.out.println("* 7. Logout                                     *");
            System.out.println("**************************************************");
            int choice = ConsoleUtils.readInt("Escolha uma opção: ");

            switch (choice) {
                case 1 -> viewMovies();
                case 2 -> viewSeries();
                case 3 -> searchByName();
                case 4 -> searchByGenre();
                case 5 -> viewFavorites();
                case 6 -> addToFavorites();
                case 7 -> {
                    logout();
                    return;
                }
                default -> System.out.println("Escolha inválida. Tente novamente.");
            }
        }
    }

    private void viewMovies() {
        LoadingAnimation loadingAnimation = new LoadingAnimation();
        Thread loadingThread = new Thread(loadingAnimation);
        loadingThread.start();

        List<Content> movies = CompletableFuture.supplyAsync(() -> streamingService.searchByCategory(Category.MOVIE)).join();

        loadingAnimation.stop();
        try {
            loadingThread.join();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        displayContent(movies, "Filmes");
    }

    private void viewSeries() {
        LoadingAnimation loadingAnimation = new LoadingAnimation();
        Thread loadingThread = new Thread(loadingAnimation);
        loadingThread.start();

        List<Content> series = CompletableFuture.supplyAsync(() -> streamingService.searchByCategory(Category.SERIES)).join();

        loadingAnimation.stop();
        try {
            loadingThread.join();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        displayContent(series, "Séries");
    }

    private void searchByName() {
        String name = ConsoleUtils.readString("Digite o nome do conteúdo: ");
        if (name != null && !name.isEmpty()) {
            LoadingAnimation loadingAnimation = new LoadingAnimation();
            Thread loadingThread = new Thread(loadingAnimation);
            loadingThread.start();

            List<Content> contents = CompletableFuture.supplyAsync(() -> streamingService.searchByTitle(name)).join();

            loadingAnimation.stop();
            try {
                loadingThread.join();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }

            displayContent(contents, "Resultados da Busca");
        }
    }

    private void searchByGenre() {
        System.out.println("Escolha um gênero: ");
        for (Genre genre : Genre.values()) {
            System.out.println(genre.ordinal() + 1 + ". " + genre);
        }
        int genreChoice = ConsoleUtils.readInt("Escolha uma opção: ");
        if (genreChoice > 0 && genreChoice <= Genre.values().length) {
            Genre genre = Genre.values()[genreChoice - 1];

            LoadingAnimation loadingAnimation = new LoadingAnimation();
            Thread loadingThread = new Thread(loadingAnimation);
            loadingThread.start();

            List<Content> contents = CompletableFuture.supplyAsync(() -> streamingService.searchByGenre(genre)).join();

            loadingAnimation.stop();
            try {
                loadingThread.join();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }

            displayContent(contents, "Resultados da Busca");
        }
    }

    private void viewFavorites() {
        List<Content> favorites = user.getFavorites();
        if (favorites.isEmpty()) {
            System.out.println("Nenhum favorito encontrado.");
        } else {
            displayContent(favorites, "Favoritos");
        }
    }

    private void addToFavorites() {
        String title = ConsoleUtils.readString("Digite o título do conteúdo que deseja adicionar aos favoritos: ");
        List<Content> contents = CompletableFuture.supplyAsync(() -> streamingService.searchByTitle(title)).join();
        if (contents.isEmpty()) {
            System.out.println("Conteúdo não encontrado.");
        } else {
            Content content = contents.get(0);
            user.addFavorite(content);

            CompletableFuture.runAsync(() -> favoritesRepository.saveFavorites(user));
            System.out.println("Conteúdo adicionado aos favoritos com sucesso!");
        }
    }

    private void logout() {
        System.out.println("Logout bem-sucedido. Até mais, " + user.getUsername() + "!");
        new LoginMenu(userService).displayMenu();
    }

    private void displayContent(List<Content> contents, String title) {
        System.out.println("**************************************************");
        System.out.println("* " + title);
        System.out.println("**************************************************");
        if (contents.isEmpty()) {
            System.out.println("Nenhum conteúdo encontrado.");
            return;
        }

        int columns = 3;
        int count = 0;
        for (Content content : contents) {
            System.out.printf("%-30s", content.getTitle());
            if (++count % columns == 0) {
                System.out.println();
            }
        }
        System.out.println();
        System.out.println("Digite qualquer coisa para voltar ao menu inicial...");
        new Scanner(System.in).nextLine();
    }
}
