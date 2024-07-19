package advanced_java.generics.exercises.superhero.domain.model;

import java.util.HashMap;
import java.util.Map;

public enum Powers {
    SUPER_STRENGTH, SUPER_SPEED, INVISIBILITY, FLIGHT, TELEPORT;

    private static final Map<Powers, String> powers = new HashMap<>();

    static {
        powers.put(SUPER_STRENGTH, "Super Força");
        powers.put(SUPER_SPEED, "Super Velocidade");
        powers.put(INVISIBILITY, "Invisibilidade");
        powers.put(FLIGHT, "Voar");
        powers.put(TELEPORT, "Teleporte");
    }

    @Override
    public String toString() {
        return powers.get(this);
    }
}
