package advanced_java.netflix.ui;

import advanced_java.netflix.repository.MoviesRepository;
import advanced_java.netflix.repository.SeriesRepository;
import advanced_java.netflix.repository.UserRepository;
import advanced_java.netflix.service.UserService;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

public class Main {
    public static void main(String[] args) {
        UserRepository userRepository = new UserRepository();

        CompletableFuture<MoviesRepository> moviesFuture = CompletableFuture.supplyAsync(MoviesRepository::new);
        CompletableFuture<SeriesRepository> seriesFuture = CompletableFuture.supplyAsync(SeriesRepository::new);

        try {
            MoviesRepository movieRepository = moviesFuture.get();
            SeriesRepository seriesRepository = seriesFuture.get();
            UserService userService = new UserService(userRepository);

            new LoginMenu(userService).displayMenu();
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }
    }
}