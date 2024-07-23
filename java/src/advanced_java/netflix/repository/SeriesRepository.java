package advanced_java.netflix.repository;

import advanced_java.netflix.domain.GenreType;
import advanced_java.netflix.domain.Series;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class SeriesRepository implements Repository<Series> {
    private List<Series> series = new ArrayList<>();

    public SeriesRepository() {
        loadSampleData();
    }

    @Override
    public List<Series> findAll() {
        return new ArrayList<>(series);
    }

    private void loadSampleData() {
        series.add(new Series("Stranger Things", GenreType.SCI_FI, LocalDate.of(2023, 7, 1)));
        series.add(new Series("The Witcher", GenreType.FANTASY, LocalDate.of(2023, 6, 29)));
        series.add(new Series("The Mandalorian", GenreType.ACTION, LocalDate.of(2023, 5, 4)));
        series.add(new Series("Breaking Bad", GenreType.DRAMA, LocalDate.of(2023, 4, 1)));
        series.add(new Series("The Crown", GenreType.DRAMA, LocalDate.of(2023, 3, 15)));
        series.add(new Series("Black Mirror", GenreType.THRILLER, LocalDate.of(2023, 8, 17)));
        series.add(new Series("Friends", GenreType.COMEDY, LocalDate.of(2023, 5, 1)));
        series.add(new Series("The Haunting of Hill House", GenreType.HORROR, LocalDate.of(2023, 10, 12)));
        series.add(new Series("Rick and Morty", GenreType.ANIMATION, LocalDate.of(2023, 7, 12)));
        series.add(new Series("The Simpsons", GenreType.ANIMATION, LocalDate.of(2023, 7, 1)));
        series.add(new Series("See", GenreType.ACTION, LocalDate.of(2023, 6, 1)));
        series.add(new Series("The Walking Dead", GenreType.HORROR, LocalDate.of(2023, 5, 15)));
        series.add(new Series("Young Sheldon", GenreType.COMEDY, LocalDate.of(2023, 7, 8)));
        series.add(new Series("The Expanse", GenreType.SCI_FI, LocalDate.of(2023, 6, 15)));
        series.add(new Series("Westworld", GenreType.SCI_FI, LocalDate.of(2023, 8, 5)));
    }
}
