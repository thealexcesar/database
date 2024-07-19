package advanced_java.lambdas.examples.lms.service;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

public class TransformationService<T, R> {
    public List<R> transform(List<T> list, Function<T, R> function) {
        return list.stream().map(function).collect(Collectors.toList());
    }
}