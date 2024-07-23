package advanced_java.netflix.repository;

import advanced_java.netflix.domain.SubscriptionPlan;
import advanced_java.netflix.domain.User;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class UserRepository implements Repository<User> {
    private List<User> users = new ArrayList<>();
    private static final String FILE_PATH = "./user.csv";

    public UserRepository() {
        loadFromFile();
    }

    @Override
    public List<User> findAll() {
        return new ArrayList<>(users);
    }

    public void create(User user) {
        users.add(user);
        saveToFile();
    }

    public User findByUsername(String username) {
        Optional<User> user = users.stream()
                .filter(u -> u.getUsername().equalsIgnoreCase(username))
                .findFirst();
        return user.orElse(null);
    }

    public boolean authenticate(String username, String password) {
        Optional<User> user = users.stream()
                .filter(u -> u.getUsername().equalsIgnoreCase(username) && u.getPassword().equals(password))
                .findFirst();
        return user.isPresent();
    }

    private void loadFromFile() {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    User user = new User(parts[1], parts[2], SubscriptionPlan.valueOf(parts[3]));
                    user.setId(UUID.fromString(parts[0]));
                    users.add(user);
                }
            }
        } catch (FileNotFoundException e) {
            System.out.println("Arquivo user.csv não encontrado. Carregando sem dados de usuário.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void saveToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : users) {
                writer.write(String.join(",",
                        user.getId().toString(),
                        user.getUsername(),
                        user.getPassword(),
                        user.getPlan().name()) + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
