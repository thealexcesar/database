package advanced_java.netflix.domain;

import java.time.LocalDate;

public class Movie extends Content {
    public Movie(String title, Genre genre, LocalDate releaseDate) {
        super(title, genre, Category.MOVIE, releaseDate);
    }
}
