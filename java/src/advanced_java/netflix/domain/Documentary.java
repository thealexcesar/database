package advanced_java.netflix.domain;

import java.time.LocalDate;

public class Documentary extends Content {
    public Documentary(String title, GenreType genre, LocalDate releaseDate) {
        super(title, genre, CategoryType.DOCUMENTARY, releaseDate);
    }
}
