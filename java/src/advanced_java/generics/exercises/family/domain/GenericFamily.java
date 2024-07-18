package advanced_java.generics.exercises.family.domain;

import java.util.ArrayList;
import java.util.List;

public class GenericFamily<P extends Parent, C extends Child> {
    private List<P> parents;
    private List<C> children;

    public GenericFamily() {
        this.parents = new ArrayList<>();
        this.children = new ArrayList<>();
    }

    public void addParent(P parent) {
        this.parents.add(parent);
    }

    public void removeParent(P parent) {
        this.parents.remove(parent);
    }

    public void addChild(C child) {
        this.children.add(child);
    }

    public void removeChild(C child) {
        this.children.remove(child);
    }

    public List<P> getParents() {
        return parents;
    }

    public List<C> getChildren() {
        return children;
    }

    public void printParents() {
        parents.forEach(System.out::println);
    }

    public void printChildren() {
        children.forEach(System.out::println);
    }

    public void printFamilyMembers() {
        System.out.println("Family Members:");
        parents.forEach(parent -> System.out.println("Parent: " + parent));
        children.forEach(child -> System.out.println("Child: " + child));
    }
}
