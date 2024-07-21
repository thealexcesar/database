package advanced_java.netflix.domain;

import java.time.LocalDate;

public abstract class Content {
    private String title;
    private Genre genre;
    private Category category;
    private LocalDate releaseDate;

    public Content(String title, Genre genre, Category category, LocalDate releaseDate) {
        this.title = title;
        this.genre = genre;
        this.category = category;
        this.releaseDate = releaseDate;
    }

    public String getTitle() {
        return title;
    }

    public Genre getGenre() {
        return genre;
    }

    public Category getCategory() {
        return category;
    }

    public LocalDate getReleaseDate() {
        return releaseDate;
    }

    @Override
    public String toString() {
        return "Title: " + title + ", Genre: " + genre + ", Category: " + category + ", Release Date: " + releaseDate;
    }
}
