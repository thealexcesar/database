package oop.Game;

public enum SpecialType {
    HOKAGE("Hokage"),
    AKATSUKI("Akatsuki"),
    MADARA_UCHIHA("Madara Uchiha");

    private final String descricao;

    SpecialType(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }
}
