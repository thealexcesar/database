package advanced_java.netflix.repository;

import advanced_java.netflix.domain.Genre;
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
                        Series serie = new Series(parts[1], Genre.valueOf(parts[2]), releaseDate);
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
        series.add(new Series("Action Series 1", Genre.ACTION, LocalDate.of(2021, 1, 1)));
        series.add(new Series("Drama Series 1", Genre.DRAMA, LocalDate.of(2022, 2, 2)));
        series.add(new Series("Comedy Series 1", Genre.COMEDY, LocalDate.of(2020, 6, 15)));
        series.add(new Series("Horror Series 1", Genre.HORROR, LocalDate.of(2019, 9, 30)));
        series.add(new Series("Romance Series 1", Genre.ROMANCE, LocalDate.of(2018, 5, 20)));
        series.add(new Series("Sci-Fi Series 1", Genre.SCIFI, LocalDate.of(2021, 3, 10)));
        series.add(new Series("Documentary Series 1", Genre.DOCUMENTARY, LocalDate.of(2020, 12, 1)));
        series.add(new Series("Thriller Series 1", Genre.THRILLER, LocalDate.of(2019, 11, 5)));
        series.add(new Series("Animation Series 1", Genre.ANIMATION, LocalDate.of(2021, 7, 12)));
        saveToFile();
    }
}
