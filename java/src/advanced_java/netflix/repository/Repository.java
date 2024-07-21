package advanced_java.netflix.repository;

import java.util.List;

public interface Repository<T> {
    List<T> findAll();
    void save(T entity);
}
