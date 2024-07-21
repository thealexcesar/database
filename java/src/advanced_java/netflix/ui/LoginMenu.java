package advanced_java.netflix.ui;

import advanced_java.netflix.domain.SubscriptionPlan;
import advanced_java.netflix.domain.User;
import advanced_java.netflix.service.UserService;

import java.util.Scanner;

public class LoginMenu {
    private UserService userService;

    public LoginMenu(UserService userService) {
        this.userService = userService;
    }

    public void displayMenu() {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.println("**************************************************");
            System.out.println("* Bem-vindo ao Login do Netflix de Console!      *");
            System.out.println("**************************************************");
            System.out.println("* 1. Login                                      *");
            System.out.println("* 2. Registrar                                  *");
            System.out.println("**************************************************");
            int choice = ConsoleUtils.readInt("Escolha uma opção: ");

            switch (choice) {
                case 1 -> login();
                case 2 -> register();
                default -> System.out.println("Escolha inválida. Tente novamente.");
            }
        }
    }

    private void login() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Digite seu nome de usuário: ");
        String username = scanner.nextLine();
        System.out.println("Digite sua senha: ");
        String password = scanner.nextLine();

        LoadingAnimation loadingAnimation = new LoadingAnimation();
        Thread loadingThread = new Thread(loadingAnimation);
        loadingThread.start();

        boolean authenticated = userService.authenticate(username, password);

        loadingAnimation.stop();
        try {
            loadingThread.join();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        if (authenticated) {
            System.out.println("\nLogin bem-sucedido. Bem-vindo, " + username + "!");
            User user = userService.findByUsername(username);
            new MainMenu(userService, user).displayMenu();
        } else {
            System.out.println("\nLogin ou senha inválidos. Tente novamente.");
        }
    }

    private void register() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Digite seu nome de usuário: ");
        String username = scanner.nextLine();
        System.out.println("Digite sua senha: ");
        String password = scanner.nextLine();

        User newUser = new User(username, password, SubscriptionPlan.BASIC);
        userService.save(newUser);
        System.out.println("Registro bem-sucedido. Bem-vindo, " + username + "!");
        new MainMenu(userService, newUser).displayMenu();
    }
}
