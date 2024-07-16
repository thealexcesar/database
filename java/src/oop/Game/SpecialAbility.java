package oop.Game;

public enum SpecialAbility {
    SHARINGAN("Sharingan"),
    RINNEGAN("Rinnegan"),
    AMATERASU("Amaterasu");

    private final String descricao;

    SpecialAbility(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }

}
