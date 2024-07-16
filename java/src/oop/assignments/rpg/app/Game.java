/*
package oop.assignments.rpg.app;

import assignments.rpg.domain.Archer;
import assignments.rpg.domain.Character;
import assignments.rpg.domain.Enemy;
import assignments.rpg.domain.Warrior;
import assignments.rpg.domain.Mage;
import assignments.rpg.service.Battle;
import oop.Game.Battle;
import oop.assignments.rpg.domain.Enemy;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Game {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<Character> players = new ArrayList<>();
        List<Character> enemies = new ArrayList<>();

        System.out.println("Escolha seus personagens:");
        players.add(chooseCharacter(scanner, "Player 1"));
        players.add(chooseCharacter(scanner, "Player 2"));

        enemies.add(new Enemy("Goblin", 50, 3, 5, "Monster", 20, 37, 2));
        enemies.add(new Enemy("Goblin", 59, 60, 30, "Boss", 20, 23, 14));

        Battle battle = new Battle(players, enemies, scanner);
        battle.startBattle();

        if (players.isEmpty()) {
            System.out.println("\u001B[31mOs inimigos venceram a batalha!\u001B[0m");
        } else if (enemies.isEmpty()) {
            System.out.println("\u001B[32mVencemos a batalha!\u001B[0m");
        } else {
            System.out.println("\u001B[33mEmpatou!\u001B[0m");
        }
    }

    private static Character chooseCharacter(Scanner scanner, String playerName) {
        while (true) {
            try {
                System.out.println("\nEscolha um personagem para " + playerName + ":");
                System.out.println("1. Warrior");
                System.out.println("2. Archer");
                System.out.println("3. Mage");
                System.out.print("Digite o número da opção: ");
                int choice = Integer.parseInt(scanner.nextLine());

                switch (choice) {
                    case 1:
                        return new Warrior(playerName, 100, 80, 70, 0, 0.1);
                    case 2:
                        return new Archer(playerName, 80, 15, 5, 100, 0.15);
                    case 3:
                        return new Mage(playerName, 60, 10, 40, 100, 20);
                    default:
                        System.out.println("Opção inválida. Tente novamente.");
                }
            } catch (NumberFormatException e) {
                System.out.println("Entrada inválida. Digite um número.");
            }
        }
    }
}
*/
