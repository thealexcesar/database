package advanced_java.netflix.domain;

import java.time.LocalDate;

public class Movie extends Content {
    public Movie(String title, GenreType genre, LocalDate releaseDate) {
        super(title, genre, CategoryType.MOVIE, releaseDate);
    }
}
