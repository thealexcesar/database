package advanced_java.netflix.domain;

import java.util.EnumMap;
import java.util.Map;

public enum CategoryType {
    MOVIE, SERIES, DOCUMENTARY;

    private static final Map<CategoryType, String> map = new EnumMap<>(CategoryType.class);

    static {
        map.put(CategoryType.MOVIE, "Filme");
        map.put(CategoryType.SERIES, "Série");
        map.put(CategoryType.DOCUMENTARY, "Documentário");
    }

    @Override
    public String toString() {
        return map.get(this);
    }
}
