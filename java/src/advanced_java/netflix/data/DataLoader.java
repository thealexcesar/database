// DataLoader.java
package advanced_java.netflix.data;

import advanced_java.netflix.domain.Genre;
import advanced_java.netflix.domain.Movie;
import advanced_java.netflix.domain.Series;
import advanced_java.netflix.repository.MoviesRepository;
import advanced_java.netflix.repository.SeriesRepository;

import java.time.LocalDate;

public class DataLoader {
    public static void loadSampleData(MoviesRepository movieRepository, SeriesRepository seriesRepository) {
        movieRepository.save(new Movie("Action Movie 1", Genre.ACTION, LocalDate.of(2021, 1, 1)));
        movieRepository.save(new Movie("Action Movie 2", Genre.ACTION, LocalDate.of(2022, 5, 10)));
        movieRepository.save(new Movie("Comedy Movie 1", Genre.COMEDY, LocalDate.of(2020, 3, 20)));
        movieRepository.save(new Movie("Drama Movie 1", Genre.DRAMA, LocalDate.of(2019, 8, 15)));
        movieRepository.save(new Movie("Horror Movie 1", Genre.HORROR, LocalDate.of(2018, 10, 31)));
        movieRepository.save(new Movie("Romance Movie 1", Genre.ROMANCE, LocalDate.of(2020, 2, 14)));
        movieRepository.save(new Movie("Sci-Fi Movie 1", Genre.SCIFI, LocalDate.of(2021, 12, 25)));
        movieRepository.save(new Movie("Documentary Movie 1", Genre.DOCUMENTARY, LocalDate.of(2019, 11, 20)));
        movieRepository.save(new Movie("Thriller Movie 1", Genre.THRILLER, LocalDate.of(2020, 7, 4)));
        movieRepository.save(new Movie("Animation Movie 1", Genre.ANIMATION, LocalDate.of(2021, 4, 1)));

        seriesRepository.save(new Series("Action Series 1", Genre.ACTION, LocalDate.of(2021, 1, 1)));
        seriesRepository.save(new Series("Drama Series 1", Genre.DRAMA, LocalDate.of(2022, 2, 2)));
        seriesRepository.save(new Series("Comedy Series 1", Genre.COMEDY, LocalDate.of(2020, 6, 15)));
        seriesRepository.save(new Series("Horror Series 1", Genre.HORROR, LocalDate.of(2019, 9, 30)));
        seriesRepository.save(new Series("Romance Series 1", Genre.ROMANCE, LocalDate.of(2018, 5, 20)));
        seriesRepository.save(new Series("Sci-Fi Series 1", Genre.SCIFI, LocalDate.of(2021, 3, 10)));
        seriesRepository.save(new Series("Documentary Series 1", Genre.DOCUMENTARY, LocalDate.of(2020, 12, 1)));
        seriesRepository.save(new Series("Thriller Series 1", Genre.THRILLER, LocalDate.of(2019, 11, 5)));
        seriesRepository.save(new Series("Animation Series 1", Genre.ANIMATION, LocalDate.of(2021, 7, 12)));
    }
}
