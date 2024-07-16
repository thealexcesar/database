package oop.Game;

public enum Village {
    KONOHA("Aldeia da Folha"),
    SUNA("Aldeia da Areia");

    private final String name;

    Village(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
