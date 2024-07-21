package advanced_java.netflix.repository;

import advanced_java.netflix.domain.Genre;
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
                        Movie movie = new Movie(parts[1], Genre.valueOf(parts[2]), releaseDate);
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
        movies.add(new Movie("Action Movie 1", Genre.ACTION, LocalDate.of(2021, 1, 1)));
        movies.add(new Movie("Action Movie 2", Genre.ACTION, LocalDate.of(2022, 5, 10)));
        movies.add(new Movie("Comedy Movie 1", Genre.COMEDY, LocalDate.of(2020, 3, 20)));
        movies.add(new Movie("Drama Movie 1", Genre.DRAMA, LocalDate.of(2019, 8, 15)));
        movies.add(new Movie("Horror Movie 1", Genre.HORROR, LocalDate.of(2018, 10, 31)));
        movies.add(new Movie("Romance Movie 1", Genre.ROMANCE, LocalDate.of(2020, 2, 14)));
        movies.add(new Movie("Sci-Fi Movie 1", Genre.SCIFI, LocalDate.of(2021, 12, 25)));
        movies.add(new Movie("Documentary Movie 1", Genre.DOCUMENTARY, LocalDate.of(2019, 11, 20)));
        movies.add(new Movie("Thriller Movie 1", Genre.THRILLER, LocalDate.of(2020, 7, 4)));
        movies.add(new Movie("Animation Movie 1", Genre.ANIMATION, LocalDate.of(2021, 4, 1)));
        saveToFile();
    }
}
