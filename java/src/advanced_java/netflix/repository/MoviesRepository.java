package advanced_java.netflix.repository;

import advanced_java.netflix.domain.GenreType;
import advanced_java.netflix.domain.Movie;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MoviesRepository implements Repository<Movie> {
    private List<Movie> movies = new ArrayList<>();

    public MoviesRepository() {
        loadSampleData();
    }

    @Override
    public List<Movie> findAll() {
        return new ArrayList<>(movies);
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
    }
}
