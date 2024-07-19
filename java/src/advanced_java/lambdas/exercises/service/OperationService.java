package advanced_java.lambdas.exercises.service;

import advanced_java.lambdas.exercises.domain.Person;

import java.util.*;
import java.util.stream.Collectors;

public class OperationService {

    public List<Integer> filterEvenNumbers(List<Integer> numbers) {
        return numbers.stream()
                .filter(n -> n % 2 == 0)
                .collect(Collectors.toList());
    }

    public List<Integer> doubleElements(List<Integer> numbers) {
        return numbers.stream()
                .map(n -> n * 2)
                .collect(Collectors.toList());
    }

    public boolean areAllElementsGreaterThan(List<Integer> numbers, int value) {
        return numbers.stream()
                .allMatch(n -> n > value);
    }

    public Optional<Integer> findMax(List<Integer> numbers) {
        return numbers.stream()
                .max(Integer::compareTo);
    }

    public List<String> convertToUpperCase(List<String> strings) {
        return strings.stream()
                .map(String::toUpperCase)
                .collect(Collectors.toList());
    }

    public List<String> sortByLength(List<String> strings) {
        return strings.stream()
                .sorted(Comparator.comparingInt(String::length))
                .collect(Collectors.toList());
    }

    public Map<Integer, List<Person>> groupPeopleByAge(List<Person> people) {
        return people.stream()
                .collect(Collectors.groupingBy(Person::getAge));
    }

    public double calculateAverage(List<Integer> numbers) {
        return numbers.stream()
                .collect(Collectors.averagingDouble(Integer::doubleValue));
    }

    public List<Integer> removeDuplicates(List<Integer> numbers) {
        return numbers.stream()
                .distinct()
                .collect(Collectors.toList());
    }

    public <T> List<T> combineListsInterleaving(List<String> list1, List<Integer> list2) {
        List<T> combined = new ArrayList<>();
        int maxSize = Math.max(list1.size(), list2.size());
        for (int i = 0; i < maxSize; i++) {
            if (i < list1.size()) {
                combined.add((T) list1.get(i));
            }
            if (i < list2.size()) {
                combined.add((T) list2.get(i));
            }
        }
        return combined;
    }
}