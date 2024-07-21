package advanced_java.netflix.validation;

import advanced_java.netflix.domain.User;

public class UserValidator {
    public static void validate(User user) {
        if (user.getUsername() == null || user.getUsername().isEmpty()) {
            throw new IllegalArgumentException("O nome de usuário não pode estar vazio");
        }

        try {
            ValidSubscriptionValidator.validate(user);
        } catch (IllegalAccessException e) {
            throw new RuntimeException("Erro ao validar o plano de assinatura", e);
        }
    }
}
