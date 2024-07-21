package advanced_java.netflix.domain;

import java.time.LocalDate;

public class Series extends Content {
    public Series(String title, Genre genre, LocalDate releaseDate) {
        super(title, genre, Category.SERIES, releaseDate);
    }
}
