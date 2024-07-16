package oop.oop5;

public abstract class LivingBeing {
    private String kingdom;
    private String phylum;
    private String kind;
    private String order;
    private String family;
    private String gender;
    private String specie;

    public LivingBeing(String kingdom, String phylum, String kind, String order, String family, String gender, String specie) {
        this.kingdom = kingdom;
        this.phylum = phylum;
        this.kind = kind;
        this.order = order;
        this.family = family;
        this.gender = gender;
        this.specie = specie;
    }

    public String getKingdom() {
        return kingdom;
    }

    public String getPhylum() {
        return phylum;
    }

    public String getKind() {
        return kind;
    }

    public String getOrder() {
        return order;
    }

    public String getFamily() {
        return family;
    }

    public String getGender() {
        return gender;
    }

    public String getSpecie() {
        return specie;
    }

    public abstract String getType();

    @Override
    public String toString() {
        return getType() +
                "\nReino: " + kingdom +
                "\nFilo: " + phylum +
                "\nClasse: " + kind +
                "\nOrdem: " + order +
                "\nFamília: " + family +
                "\nGênero: " + gender +
                "\nEspécie: " + specie;
    }
}
