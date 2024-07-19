package advanced_java.generics.exercises.superhero.domain.model;

import java.util.Map;
import java.util.WeakHashMap;

public enum Weakness {
    FIRE, WATER, ICE, ELECTRICITY, MAGIC, NONE;

    private static final Map<Weakness, String> weakness = new WeakHashMap<>();

    static {
        weakness.put(FIRE, "Fogo");
        weakness.put(WATER, "Água");
        weakness.put(ICE, "Gelo");
        weakness.put(ELECTRICITY, "Eletricidade");
        weakness.put(MAGIC, "Mágica");
        weakness.put(NONE, "Não Possui Fraqueza");
    }

    @Override
    public String toString() {
        return weakness.get(this);
    }
}
