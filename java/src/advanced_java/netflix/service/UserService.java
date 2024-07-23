package advanced_java.netflix.service;

import advanced_java.netflix.domain.User;
import advanced_java.netflix.repository.DocumentariesRepository;
import advanced_java.netflix.repository.MoviesRepository;
import advanced_java.netflix.repository.SeriesRepository;
import advanced_java.netflix.repository.UserRepository;

public class UserService {
    private final UserRepository userRepository;
    private final MoviesRepository movieRepository;
    private final SeriesRepository seriesRepository;
    private final DocumentariesRepository documentariesRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
        this.movieRepository = new MoviesRepository();
        this.seriesRepository = new SeriesRepository();
        this.documentariesRepository = new DocumentariesRepository();
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public void save(User user) {
        userRepository.create(user);
    }

    public MoviesRepository getMovieRepository() {
        return movieRepository;
    }

    public SeriesRepository getSeriesRepository() {
        return seriesRepository;
    }

    public DocumentariesRepository getDocumentariesRepository() {
        return documentariesRepository;
    }

    public boolean authenticate(String username, String password) {
        return userRepository.authenticate(username, password);
    }

    public boolean userExists(String username) {
        return userRepository.findByUsername(username) != null;
    }
}
