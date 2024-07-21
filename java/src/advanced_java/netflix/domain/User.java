package advanced_java.netflix.domain;

import advanced_java.netflix.validation.ValidSubscription;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

public class User {
    private UUID id;
    private String username;
    private String password;

    @ValidSubscription
    private SubscriptionPlan plan;

    private List<Content> favorites;

    public User(String username, String password, SubscriptionPlan plan) {
        this.id = UUID.randomUUID();
        this.username = username;
        this.password = password;
        this.plan = plan;
        this.favorites = new ArrayList<>();
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public SubscriptionPlan getPlan() {
        return plan;
    }

    public void setPlan(SubscriptionPlan plan) {
        this.plan = plan;
    }

    public List<Content> getFavorites() {
        return favorites;
    }

    public void addFavorite(Content content) {
        if (!favorites.contains(content)) {
            favorites.add(content);
        }
    }

    public void removeFavorite(Content content) {
        favorites.remove(content);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(username, user.username);
    }

    @Override
    public int hashCode() {
        return Objects.hash(username);
    }
}
