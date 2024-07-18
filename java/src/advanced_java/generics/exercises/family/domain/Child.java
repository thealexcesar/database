package advanced_java.generics.exercises.family.domain;

public class Child extends Person {
    private String favoriteToy;
    public Child(String name, int age, String favoriteToy, Genre genre) {
        super(name, age, genre);
        this.favoriteToy = favoriteToy;
    }

    public String getFavoriteToy() {
        return favoriteToy;
    }

    public void setFavoriteToy(String favoriteToy) {
        this.favoriteToy = favoriteToy;
    }

    @Override
    public String toString() {
        return super.toString() + " - brinquedo favorito: " + favoriteToy;
    }
}
