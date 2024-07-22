package advanced_java.netflix.domain;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public abstract class Content {
    private String title;
    private GenreType genre;
    private CategoryType category;
    private LocalDate releaseDate;
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    public Content(String title, GenreType genre, CategoryType category, LocalDate releaseDate) {
        this.title = title;
        this.genre = genre;
        this.category = category;
        this.releaseDate = releaseDate;
    }

    public String getTitle() {
        return title;
    }

    public GenreType getGenre() {
        return genre;
    }

    public CategoryType getCategory() {
        return category;
    }

    public LocalDate getReleaseDate() {
        return releaseDate;
    }

    public String getFormattedReleaseDate() {
        return releaseDate.format(FORMATTER);
    }

    @Override
    public String toString() {
        return title + " - gênero: " + genre + " - categoria: " + category + " - lançamento: " + getFormattedReleaseDate();
    }
}
