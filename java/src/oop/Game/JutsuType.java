package oop.Game;

public enum JutsuType {
    NINJUTSU("Ninjutsu"),
    TAIJUTSU("Taijutsu"),
    GENJUTSU("Genjutsu");

    private final String descricao;

    JutsuType(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }
}
