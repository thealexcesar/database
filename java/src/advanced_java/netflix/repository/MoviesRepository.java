package advanced_java.netflix.repository;

import advanced_java.netflix.domain.GenreType;
import advanced_java.netflix.domain.Movie;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

public class MoviesRepository implements Repository<Movie> {
    private List<Movie> movies = new ArrayList<>();
    private static final String FILE_PATH = "./movies.csv";
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public MoviesRepository() {
        if (!loadFromFile()) loadSampleData();
    }

    @Override
    public List<Movie> findAll() {
        return new ArrayList<>(movies);
    }

    @Override
    public void save(Movie movie) {
        movies.add(movie);
        saveToFile();
    }

    private boolean loadFromFile() {
        File file = new File(FILE_PATH);
        if (!file.exists()) {
            return false;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 5 && "Movie".equalsIgnoreCase(parts[0])) {
                    try {
                        LocalDate releaseDate = LocalDate.parse(parts[4], DATE_FORMATTER);
                        Movie movie = new Movie(parts[1], GenreType.valueOf(parts[2]), releaseDate);
                        movies.add(movie);
                    } catch (DateTimeParseException e) {
                        System.err.println("Erro ao analisar a data: " + parts[4] + " - " + e.getMessage());
                    }
                }
            }
            return true;
        } catch (IOException e) {
            System.out.println("Erro ao carregar arquivo CSV de filmes. Carregando dados de exemplo.");
            return false;
        }
    }

    private void saveToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Movie movie : movies) {
                writer.write(String.join(",",
                        movie.getClass().getSimpleName(),
                        movie.getTitle(),
                        movie.getGenre().name(),
                        movie.getCategory().name(),
                        movie.getReleaseDate().format(DATE_FORMATTER)) + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void loadSampleData() {
        movies.add(new Movie("Spider-Man: No Way Home", GenreType.ACTION, LocalDate.of(2021, 12, 17)));
        movies.add(new Movie("The Batman", GenreType.ACTION, LocalDate.of(2022, 3, 4)));
        movies.add(new Movie("Dune", GenreType.SCI_FI, LocalDate.of(2021, 10, 22)));
        movies.add(new Movie("The French Dispatch", GenreType.DRAMA, LocalDate.of(2021, 10, 22)));
        movies.add(new Movie("No Time to Die", GenreType.ACTION, LocalDate.of(2021, 10, 8)));
        movies.add(new Movie("The Green Knight", GenreType.FANTASY, LocalDate.of(2021, 7, 30)));
        movies.add(new Movie("Jungle Cruise", GenreType.ACTION, LocalDate.of(2021, 7, 30)));
        movies.add(new Movie("Black Widow", GenreType.ACTION, LocalDate.of(2021, 7, 9)));
        movies.add(new Movie("Cruella", GenreType.DRAMA, LocalDate.of(2021, 5, 28)));
        movies.add(new Movie("Soul", GenreType.ANIMATION, LocalDate.of(2020, 12, 25)));
        movies.add(new Movie("Luca", GenreType.ANIMATION, LocalDate.of(2021, 6, 18)));
        saveToFile();
    }
}
