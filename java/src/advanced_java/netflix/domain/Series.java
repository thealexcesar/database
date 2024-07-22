package advanced_java.netflix.domain;

import java.time.LocalDate;

public class Series extends Content {
    public Series(String title, GenreType genre, LocalDate releaseDate) {
        super(title, genre, CategoryType.SERIES, releaseDate);
    }
}
