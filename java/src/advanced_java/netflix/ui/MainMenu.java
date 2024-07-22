package advanced_java.netflix.ui;

import advanced_java.netflix.domain.CategoryType;
import advanced_java.netflix.domain.Content;
import advanced_java.netflix.domain.GenreType;
import advanced_java.netflix.domain.User;
import advanced_java.netflix.repository.FavoritesRepository;
import advanced_java.netflix.service.StreamingService;
import advanced_java.netflix.service.UserService;
import advanced_java.netflix.ui.utils.ConsoleUtils;
import advanced_java.netflix.ui.utils.Constants;
import advanced_java.netflix.ui.utils.LoadSpinning;
import advanced_java.netflix.ui.utils.PrintMsg;

import java.util.List;
import java.util.Scanner;
import java.util.concurrent.CompletableFuture;

public class MainMenu {
    private final User user;
    private final UserService userService;
    private final StreamingService streamingService;
    private final FavoritesRepository favoritesRepository;
    private static final long LOADING_TIME = 2000; // Tempo de carregamento em milissegundos

    public MainMenu(UserService userService, User user) {
        this.userService = userService;
        this.user = user;
        this.streamingService = new StreamingService(userService.getMovieRepository(), userService.getSeriesRepository());
        this.favoritesRepository = new FavoritesRepository();

        CompletableFuture.runAsync(() -> user.getFavorites().addAll(favoritesRepository.loadFavorites(user)));
    }

    public void displayMenu() {
        while (true) {
            System.out.print(Constants.HR+"\n| Bem-vindo ao Netflix de Console!"+" ".repeat(13)+"|");
            System.out.println(Constants.HR+"\n| 1. Ver Filmes "+" ".repeat(31)+"|");
            System.out.println("| 2. Ver Séries"+" ".repeat(32)+"|\n| 3. Buscar por Nome"+" ".repeat(27)+"|");
            System.out.println("| 4. Buscar por Gênero"+" ".repeat(25)+"|\n| 5. Ver Favoritos"+" ".repeat(29)+"|");
            System.out.println("| 6. Adicionar aos Favoritos"+" ".repeat(19)+"|\n| 7. Logout"+" ".repeat(36)+"|" + Constants.HR);
            int choice = ConsoleUtils.readInt("\nEscolha uma opção: ");

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
                default -> PrintMsg.tryAgain("Escolha inválida! ");
            }
        }
    }

    private void viewMovies() {
        startLoadingAnimation();
        List<Content> movies = CompletableFuture.supplyAsync(() -> streamingService.searchByCategory(CategoryType.MOVIE)).join();
        displayContent(movies, "\nFilmes");
    }

    private void viewSeries() {
        startLoadingAnimation();
        List<Content> series = CompletableFuture.supplyAsync(() -> streamingService.searchByCategory(CategoryType.SERIES)).join();
        displayContent(series, "\nSéries");
    }

    private void searchByName() {
        String name = ConsoleUtils.readString("Digite o nome do conteúdo: ");
        if (name != null && !name.isEmpty()) {
            startLoadingAnimation();
            List<Content> contents = CompletableFuture.supplyAsync(() -> streamingService.searchByTitle(name)).join();
            displayContent(contents, "Resultados da Busca");
        }
    }

    private void searchByGenre() {
        PrintMsg.choose("gênero");
        for (GenreType genre : GenreType.values()) {
            System.out.println(genre.ordinal() + 1 + ". " + genre);
        }
        int genreChoice = ConsoleUtils.readInt("Escolha uma opção: ");
        if (genreChoice > 0 && genreChoice <= GenreType.values().length) {
            GenreType genre = GenreType.values()[genreChoice - 1];
            startLoadingAnimation();
            List<Content> contents = CompletableFuture.supplyAsync(() -> streamingService.searchByGenre(genre)).join();
            displayContent(contents, "\nResultados da Busca:\n");
        }
    }

    private void viewFavorites() {
        List<Content> favorites = user.getFavorites();
        if (favorites.isEmpty()) {
            PrintMsg.actions(false, "Favorito");
        } else {
            displayContent(favorites, "\nFavoritos");
        }
    }

    private void addToFavorites() {
        String title = ConsoleUtils.readString("Digite o título do conteúdo que deseja adicionar aos favoritos: ");
        startLoadingAnimation();
        List<Content> contents = CompletableFuture.supplyAsync(() -> streamingService.searchByTitle(title)).join();
        if (contents.isEmpty()) {
            PrintMsg.actions(false);
        } else {
            Content content = contents.get(0);
            user.addFavorite(content);
            CompletableFuture.runAsync(() -> favoritesRepository.saveFavorites(user));
            PrintMsg.actions(true, "Conteúdo adicionado aos favoritos");
        }
    }

    private void logout() {
        System.out.println("Logout bem-sucedido. Até mais, " + user.getUsername() + "!");
        new LoginMenu(userService).displayMenu();
    }

    private void displayContent(List<Content> contents, String title) {
        System.out.println(Constants.HR+title+Constants.HR);
        if (contents.isEmpty()) {
            PrintMsg.actions(false);
            return;
        }

        int columns = 3;
        int count = 0;
        for (Content content : contents) {
            System.out.printf("%-30s\n", content);
            if (++count % columns == 0) {
                System.out.println();
            }
        }
        System.out.println();
        System.out.println("Digite qualquer coisa para voltar ao menu inicial...");
        new Scanner(System.in).nextLine();
    }

    private void startLoadingAnimation() {
        LoadSpinning loadingAnimation = new LoadSpinning(LOADING_TIME);
        Thread loadingThread = new Thread(loadingAnimation);
        loadingThread.start();

        try {
            loadingThread.join();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
