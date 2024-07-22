package advanced_java.netflix.repository;

import advanced_java.netflix.domain.GenreType;
import advanced_java.netflix.domain.Series;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

public class SeriesRepository implements Repository<Series> {
    private List<Series> series = new ArrayList<>();
    private static final String FILE_PATH = "./series.csv";
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public SeriesRepository() {
        if (!loadFromFile()) loadSampleData();
    }

    @Override
    public List<Series> findAll() {
        return new ArrayList<>(series);
    }

    @Override
    public void save(Series serie) {
        series.add(serie);
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
                if (parts.length == 5 && "Series".equalsIgnoreCase(parts[0])) {
                    try {
                        LocalDate releaseDate = LocalDate.parse(parts[4], DATE_FORMATTER);
                        Series serie = new Series(parts[1], GenreType.valueOf(parts[2]), releaseDate);
                        series.add(serie);
                    } catch (DateTimeParseException e) {
                        System.err.println("Erro ao analisar a data: " + parts[4] + " - " + e.getMessage());
                    }
                }
            }
            return true;
        } catch (IOException e) {
            System.out.println("Erro ao carregar arquivo CSV de séries. Carregando dados de exemplo.");
            return false;
        }
    }

    private void saveToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Series serie : series) {
                writer.write(String.join(",",
                        serie.getClass().getSimpleName(),
                        serie.getTitle(),
                        serie.getGenre().name(),
                        serie.getCategory().name(),
                        serie.getReleaseDate().format(DATE_FORMATTER)) + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
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
        saveToFile();
    }
}
