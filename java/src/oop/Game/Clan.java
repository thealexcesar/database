package oop.Game;

public enum Clan {
    UZUMAKI("Clã Uzumaki"),
    UCHIHA("Clã Uchiha"),
    SENJU("Clã Senju"),
    HYUGA("Clã Hyuga");

    private final String descricao;

    Clan(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }
}
