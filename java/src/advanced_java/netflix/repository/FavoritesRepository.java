package advanced_java.netflix.repository;

import advanced_java.netflix.domain.Content;
import advanced_java.netflix.domain.GenreType;
import advanced_java.netflix.domain.Movie;
import advanced_java.netflix.domain.Series;
import advanced_java.netflix.domain.User;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class FavoritesRepository {
    private static final String FILE_PATH = "./favorites.csv";
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public List<Content> loadFavorites(User user) {
        List<Content> favorites = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists() || file.length() == 0) {
            System.out.println("Arquivo favorites.csv não encontrado ou vazio. Carregando sem dados de favoritos.");
            return favorites;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 6 && parts[0].equals(user.getId().toString())) {
                    String type = parts[1];
                    String title = parts[2];
                    String genre = parts[3];
                    String category = parts[4];
                    LocalDate releaseDate = LocalDate.parse(parts[5], DATE_FORMATTER);

                    Content content;
                    if (category.equalsIgnoreCase("MOVIE")) {
                        content = new Movie(title, GenreType.valueOf(genre), releaseDate);
                    } else {
                        content = new Series(title, GenreType.valueOf(genre), releaseDate);
                    }
                    favorites.add(content);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return favorites;
    }

    public void saveFavorites(User user) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Content favorite : user.getFavorites()) {
                writer.write(String.join(",",
                        user.getId().toString(),
                        favorite.getClass().getSimpleName(),
                        favorite.getTitle(),
                        favorite.getGenre().name(),
                        favorite.getCategory().name(),
                        favorite.getReleaseDate().format(DATE_FORMATTER)) + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
