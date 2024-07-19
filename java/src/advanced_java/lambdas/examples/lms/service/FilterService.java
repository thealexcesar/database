package advanced_java.lambdas.examples.lms.service;

import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class FilterService<T> {
    public List<T> filter(List<T> list, Predicate<T> predicate) {
        return list.stream().filter(predicate).collect(Collectors.toList());
    }
}
