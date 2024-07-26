package advanced_java.netflix.ui;

import advanced_java.netflix.domain.SubscriptionPlan;
import advanced_java.netflix.domain.User;
import advanced_java.netflix.service.UserService;
import advanced_java.netflix.ui.utils.ConsoleUtils;
import advanced_java.netflix.ui.utils.Constants;
import advanced_java.netflix.ui.utils.PrintMsg;
import advanced_java.netflix.ui.utils.LoadSpinning;
import advanced_java.netflix.validation.UserValidator;

public class LoginMenu {
    private final UserService userService;
    private static final long LOADING_TIME = 2000;

    public LoginMenu(UserService userService) {
        this.userService = userService;
    }

    public void displayMenu() {
        while (true) {
            System.out.println(Constants.HR + "\n| Bem-vindo ao Login do Netflix de T-Academy!  |" + Constants.HR);
            System.out.println("| 1. Login" + " ".repeat(37) + "|\n| 2. Registrar" + " ".repeat(33) + "|" + Constants.HR);
            int choice = ConsoleUtils.readInt("Escolha uma opção: ");

            switch (choice) {
                case 1 -> login();
                case 2 -> register();
                default -> System.out.println(Constants.INVALID_CHOICE_TRY_AGAIN);
            }
        }
    }

    private void login() {
        System.out.println("Digite seu nome de usuário: ");
        String username = Constants.input.nextLine();
        System.out.println("Digite sua senha: ");
        String password = Constants.input.nextLine();

        startLoadingAnimation();

        boolean authenticated = userService.authenticate(username, password);

        if (!authenticated) {
            PrintMsg.tryAgain("Login ou senha inválidos!");
            return;
        }
        System.out.println("\nLogin bem-sucedido. Bem-vindo, " + username + "!");
        User user = userService.findByUsername(username);
        new MainMenu(userService, user).displayMenu();
    }

    private void register() {
        System.out.println("Digite seu nome de usuário: ");
        String username = Constants.input.nextLine();
        System.out.println("Digite sua senha: ");
        String password = Constants.input.nextLine();

        if (userService.userExists(username)) {
            System.err.println("Nome de usuário já está em uso. Tente novamente.");
            return;
        }

        SubscriptionPlan plan = chooseSubscriptionPlan();

        User newUser = new User(username, password, plan);

        try {
            UserValidator.validate(newUser);
            userService.save(newUser);
            System.out.println("Registro bem-sucedido. Bem-vindo, " + username + "!");
            new MainMenu(userService, newUser).displayMenu();
        } catch (IllegalArgumentException e) {
            System.out.println("Erro de validação: " + e.getMessage());
        } catch (RuntimeException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private SubscriptionPlan chooseSubscriptionPlan() {
        while (true) {
            System.out.println(Constants.HR + "\nEscolha um plano de assinatura:");
            for (SubscriptionPlan plan : SubscriptionPlan.values()) {
                System.out.println(plan.ordinal() + 1 + ". " + plan);
            }
            int choice = ConsoleUtils.readInt("Escolha uma opção: ");
            if (choice > 0 && choice <= SubscriptionPlan.values().length) {
                return SubscriptionPlan.values()[choice - 1];
            } else {
                System.out.println(Constants.INVALID_CHOICE_TRY_AGAIN);
            }
        }
    }

    private void startLoadingAnimation() {
        LoadSpinning loadingAnimation = new LoadSpinning(LOADING_TIME);
        Thread loadingThread = new Thread(loadingAnimation);
        loadingThread.start();

        try {
            loadingThread.join();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
